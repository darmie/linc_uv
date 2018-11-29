package uv;

import uv.Uv;
import uv.EventEmitter;
import cpp.*;
import haxe.io.Bytes;


@:access(uv)
@:unreflective
class Stream<Handle:StreamHandle> extends Finalizable {
	public var onConnect(default, null):EventEmitter1<Stream<Handle>> = new EventEmitter1();
	public var onRead(default, null):EventEmitter1<Bytes> = new EventEmitter1();
	public var onEnd(default, null):EventEmitter0 = new EventEmitter0();
	
	var loop:Loop;
	var handle:Handle;
	
	public function new(loop:Loop, handle:Handle) {
		super();
		this.loop = loop;
		this.handle = handle;
		handle.data = untyped __cpp__('this');
	}
	
	public inline function listen(backlog:Int) {
		return Uv.listen(cast handle, backlog, Callable.fromStaticFunction(_onConnect));
	}
	
	public inline function accept(client:Stream<Handle>) {
		return Uv.accept(cast handle, cast client.handle);
	}
	
	public inline function readStart() {
		return Uv.read_start(cast handle, Callable.fromStaticFunction(_onAlloc), Callable.fromStaticFunction(_onRead));
	}
	
	override function finalize() {
		Stdlib.free((cast handle:Pointer<Stream_t>));
		loop = null;
		handle = null;
	}
	
	static function _onConnect<Handle:StreamHandle>(stream:Star<Stream_t>, status:Int):Void {
		var stream:Stream<Handle> = untyped __cpp__('(hx::Object*){0}->data', stream);
		var client = cast new Tcp(stream.loop); // TODO: should be new Stream?
		stream.accept(client); // TODO: handle error
		stream.onConnect.emit(client);
	}
	
	static function _onAlloc<Handle:StreamHandle>(stream:Star<Handle_t>, suggestedSize:Size_t, buf:Star<Buf_t>):Void {
		var stream:Stream<Handle> = untyped __cpp__('(hx::Object*){0}->data', stream);
		var suggestedSize:Int = cast suggestedSize;
		var buf:BufHandle = cast buf;
		var arr = NativeArray.create(suggestedSize);
		var base:Pointer<Char> = NativeArray.address(arr, 0);
		buf.base = cast base;
		buf.len = suggestedSize;
	}
	
	static function _onRead<Handle:StreamHandle>(stream:Star<Stream_t>, nread:Long, buf:ConstStar<Buf_t>):Void {
		var stream:Stream<Handle> = untyped __cpp__('(hx::Object*){0}->data', stream);
		var nread:Int = cast nread;
		var buf:BufHandle = cast buf;
		
		if(nread > 0) {
			var bytes = Bytes.alloc(nread);
			Stdlib.memcpy(NativeArray.address(bytes.getData(), 0), cast buf.base, nread);
			stream.onRead.emit(bytes);
		}
		
		if(nread < 0) {
			if(nread != Uv.EOF) {
				trace('error: $nread');
				// TODO: emit error
			}
			
			var handle:Pointer<Stream_t> = cast stream.handle;
			var handle:Pointer<Handle_t> = handle.reinterpret();
			Uv.close(cast handle.ref, null);
			stream.onEnd.emit();
		}
	}
}