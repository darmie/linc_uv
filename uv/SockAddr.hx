package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract SockAddr(Pointer<SockAddr_s>) from Pointer<SockAddr_s> to Pointer<SockAddr_s> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(SockAddr_s));
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<SockAddr_s> return this.raw;
	@:from public static inline function fromRaw(r:RawPointer<SockAddr_s>):SockAddr return Pointer.fromRaw(r);
	
}