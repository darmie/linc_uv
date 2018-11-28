package uv;

import uv.Uv;
import cpp.*;
import haxe.io.Bytes;

class EventEmitter0 {
	var listeners:Array<Void->Void> = [];
	public function new() {}
	public function add(v):Void->Void {
		listeners.push(v);
		return function() listeners.remove(v);
	}
	public function emit()
		for(cb in listeners) cb();
}

class EventEmitter1<T1> {
	var listeners:Array<T1->Void> = [];
	public function new() {}
	public function add(v):Void->Void {
		listeners.push(v);
		return function() listeners.remove(v);
	}
	public function emit(v:T1)
		for(cb in listeners) cb(v);
}

class EventEmitter2<T1, T2> {
	var listeners:Array<T1->T2->Void> = [];
	public function new() {}
	public function add(v):Void->Void {
		listeners.push(v);
		return function() listeners.remove(v);
	}
	public function emit(v1:T1, v2:T2)
		for(cb in listeners) cb(v1, v2);
}

@:access(uv)
@:unreflective
class Tcp extends Finalizable {
	public var onConnect(default, null):EventEmitter1<Tcp> = new EventEmitter1();
	public var onRead(default, null):EventEmitter1<Bytes> = new EventEmitter1();
	public var onEnd(default, null):EventEmitter0 = new EventEmitter0();
	
	var loop:Loop;
	var handle:TcpHandle;
	
	public function new(loop:Loop) {
		super();
		this.loop = loop;
		handle = cast Stdlib.malloc(Stdlib.sizeof(Tcp_t));
		Uv.tcp_init(loop.handle, handle);
		handle.data = untyped __cpp__('this');
	}
	
	public function bind(addr:SockAddrIn, flags:Int) {
		var addr:Pointer<SockAddrHandle> = addr.handle.reinterpret();
		return Uv.tcp_bind(cast handle, cast addr, flags);
	}
	
	public function listen(backlog:Int) {
		var stream:StreamHandle = cast handle;
		return Uv.listen(stream, backlog, Callable.fromStaticFunction(_onConnect));
	}
	
	public function accept(client:Tcp) {
		return Uv.accept(cast handle, cast client.handle);
	}
	
	public function readStart() {
		return Uv.read_start(cast handle, Callable.fromStaticFunction(_onAlloc), Callable.fromStaticFunction(_onRead));
	}
	
	override function finalize() {
		Stdlib.free((cast handle:Pointer<Tcp_t>));
		loop = null;
		handle = null;
	}
	
	static function _onConnect(stream:Star<Stream_t>, status:Int):Void {
		var tcp:Tcp = untyped __cpp__('(hx::Object*){0}->data', stream);
		var client = new Tcp(tcp.loop);
		tcp.accept(client); // TODO: handle error
		tcp.onConnect.emit(client);
	}
	
	static function _onAlloc(stream:Star<Handle_t>, suggestedSize:Size_t, buf:Star<Buf_t>):Void {
		var tcp:Tcp = untyped __cpp__('(hx::Object*){0}->data', stream);
		var suggestedSize:Int = cast suggestedSize;
		var buf:BufHandle = cast buf;
		var arr = NativeArray.create(suggestedSize);
		var base:Pointer<Char> = NativeArray.address(arr, 0);
		buf.base = cast base;
		buf.len = suggestedSize;
	}
	
	static function _onRead(stream:Star<Stream_t>, nread:Long, buf:ConstStar<Buf_t>):Void {
		var tcp:Tcp = untyped __cpp__('(hx::Object*){0}->data', stream);
		var nread:Int = cast nread;
		var buf:BufHandle = cast buf;
		
		if(nread > 0) {
			var bytes = Bytes.alloc(nread);
			Stdlib.memcpy(NativeArray.address(bytes.getData(), 0), cast buf.base, nread);
			tcp.onRead.emit(bytes);
		}
		
		if(nread < 0) {
			if(nread != Uv.EOF) {
				trace('error: $nread');
				// TODO: emit error
			}
			
			var handle:Pointer<Tcp_t> = cast tcp.handle;
			var handle:Pointer<Handle_t> = handle.reinterpret();
			Uv.close(cast handle.ref, null);
			tcp.onEnd.emit();
		}
	}
}