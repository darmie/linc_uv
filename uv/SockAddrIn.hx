package uv;

import uv.Uv;
import cpp.*;

@:dce
abstract SockAddrIn(Pointer<SockAddrIn_s>) from Pointer<SockAddrIn_s> to Pointer<SockAddrIn_s> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(SockAddrIn_s));
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRawPointer():RawPointer<SockAddrIn_s> return this.raw;
	@:to public inline function asRawConstPointer():RawConstPointer<SockAddrIn_s> return this.constRaw;
	@:to public inline function asRawConstPointerSockAddr():RawConstPointer<SockAddr_s> return (this.reinterpret():Pointer<SockAddr_s>).constRaw;
	
	public function ip4Addr(host:String, port:Int) return Uv.ip4_addr(host, port, asRawPointer());
	// public function ip4Name(host:String, port:Int) return Uv.ip4_addr(host, port, toRaw());
}