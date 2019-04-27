package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract GetAddrInfo(Pointer<GetAddrInfo_t>) from Pointer<GetAddrInfo_t> to Pointer<GetAddrInfo_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(GetAddrInfo_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<GetAddrInfo_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:from public static inline function fromRaw(r:RawPointer<GetAddrInfo_t>):GetAddrInfo return Pointer.fromRaw(r);
	
	public inline function get(loop, cb, host, port, hints) return Uv.getaddrinfo(loop, asRaw(), cb, host, port, hints);
}
