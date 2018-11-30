package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract AddrInfo(Pointer<AddrInfo_s>) from Pointer<AddrInfo_s> to Pointer<AddrInfo_s> {
	public inline function new() {
		this = Stdlib.malloc(Stdlib.sizeof(AddrInfo_s));
		untyped __cpp__('{0}.ai_family = PF_INET;{0}.ai_socktype = SOCK_STREAM;{0}.ai_protocol = IPPROTO_TCP;{0}.ai_flags = 0;', this.value);
	}
	public inline function destroy() return Uv.freeaddrinfo(asRaw());
	@:to public inline function asRaw():RawPointer<AddrInfo_s> return this.raw;
	@:to public inline function asRawConst():RawConstPointer<AddrInfo_s> return this.constRaw;
	@:to public inline function asRawSockAddrIn():RawPointer<SockAddrIn_s> return (Pointer.fromRaw(this.value.ai_addr).reinterpret():Pointer<SockAddrIn_s>).raw;
	@:to public inline function asSockAddrIn():SockAddrIn return asRawSockAddrIn();
	@:to public inline function asRawSockAddr():RawPointer<SockAddr_s> return this.value.ai_addr;
	@:to public inline function asSockAddr():SockAddr return asRawSockAddr();
	@:from public static inline function fromRaw(r:RawPointer<AddrInfo_s>):AddrInfo return Pointer.fromRaw(r);
}