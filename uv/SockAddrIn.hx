package uv;

import uv.Uv;
import cpp.*;

@:unreflective
class SockAddrIn extends Finalizable {
	var handle:Pointer<SockAddrInHandle>;
	
	public static function ip4Addr(ip:String, port:Int):SockAddrIn {
		var handle:Pointer<SockAddrInHandle> = Stdlib.malloc(Stdlib.sizeof(SockAddrInHandle));
		Uv.ip4_addr(ip, port, cast handle);
		return new SockAddrIn(handle);
	}
	
	inline function new(handle) {
		super();
		this.handle = handle;
	}
	
	override function finalize() {
		Stdlib.free(handle);
		handle = null;
	}
}

