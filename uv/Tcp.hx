package uv;

import uv.Uv;
import uv.EventEmitter;
import cpp.*;
import haxe.io.Bytes;

@:access(uv)
@:unreflective
class Tcp extends Stream<TcpHandle> {
	
	public function new(loop:Loop) {
		var handle = cast Stdlib.malloc(Stdlib.sizeof(Tcp_t));
		Uv.tcp_init(loop.handle, handle);
		handle.data = untyped __cpp__('this');
		super(loop, handle);
	}
	
	public function bind(addr:SockAddrIn, flags:Int) {
		var addr:Pointer<SockAddrHandle> = addr.handle.reinterpret();
		return Uv.tcp_bind(cast handle, cast addr, flags);
	}
}