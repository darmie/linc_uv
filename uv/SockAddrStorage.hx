package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract SockAddrStorage(Pointer<SockAddrStorage_s>) from Pointer<SockAddrStorage_s> to Pointer<SockAddrStorage_s> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(SockAddrStorage_s));
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<SockAddrStorage_s> return this.raw;
	@:to public inline function asRawConst():RawConstPointer<SockAddrStorage_s> return this.constRaw;
	@:to public inline function asRawSockAddr():RawPointer<SockAddr_s> return (this.reinterpret():Pointer<SockAddr_s>).raw;
	@:to public inline function asRawSockAddrIn():RawPointer<SockAddrIn_s> return (this.reinterpret():Pointer<SockAddrIn_s>).raw;
	@:to public inline function asSockAddrIn():SockAddrIn return Pointer.fromRaw(asRawSockAddrIn());
	
	public inline function sizeof() return Stdlib.sizeof(SockAddrStorage_s);
}