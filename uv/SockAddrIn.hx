package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract SockAddrIn(Pointer<SockAddrIn_s>) from Pointer<SockAddrIn_s> to Pointer<SockAddrIn_s> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(SockAddrIn_s));
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<SockAddrIn_s> return this.raw;
	@:to public inline function asRawConst():RawConstPointer<SockAddrIn_s> return this.constRaw;
	@:to public inline function asRawConstSockAddr():RawConstPointer<SockAddr_s> return (this.reinterpret():Pointer<SockAddr_s>).constRaw;
	
	public function ip4Addr(host:String, port:Int) return Uv.ip4_addr(host, port, asRaw());
	
	public inline function getAddress():{host:sys.net.Host, port:Int} {
		// ref: std/cpp/_std/sys/net/Host.hx (haxe)
		// ref: hx/libs/std/Socket.cpp (hxcpp)
		var host = new sys.net.Host('127.0.0.1');
		untyped host.ip = __cpp__('*(int*)&{0}.sin_addr', this.value);
		return {
			host: host,
			port: untyped __cpp__('ntohs({0}.sin_port)', this.value),
		}
	}
}