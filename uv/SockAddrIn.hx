package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract SockAddrIn(Pointer<SockAddrIn_s>) from Pointer<SockAddrIn_s> to Pointer<SockAddrIn_s> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(SockAddrIn_s));
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<SockAddrIn_s> return this.raw;
	@:to public inline function asRawConst():RawConstPointer<SockAddrIn_s> return this.constRaw;
	@:to public inline function asRawSockAddr():RawConstPointer<SockAddr_s> return (this.reinterpret():Pointer<SockAddr_s>).raw;
	@:to public inline function asRawConstSockAddr():RawConstPointer<SockAddr_s> return (this.reinterpret():Pointer<SockAddr_s>).constRaw;
	@:from public static inline function fromRaw(r:RawPointer<SockAddrIn_s>):SockAddrIn return Pointer.fromRaw(r);
	
	public inline function ip4Addr(host:String, port:Int) return Uv.ip4_addr(host, port, asRaw());
	
	public function getAddress():{host:String, port:Int} {
		// ref: std/cpp/_std/sys/net/Host.hx (haxe)
		// ref: hx/libs/std/Socket.cpp (hxcpp)
		untyped __cpp__('char addr[17] = {\'\\0\'}');
		Uv.ip4_name(asRaw(), untyped __cpp__('addr'), cast 16);
		return {
			host: untyped __cpp__('::String(addr)'),
			port: untyped __cpp__('ntohs({0}.sin_port)', this.value),
		}
	}
}