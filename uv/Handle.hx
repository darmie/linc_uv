package uv;

import uv.Uv;
import cpp.*;

@:dce
abstract Handle(Pointer<Handle_t>) from Pointer<Handle_t> to Pointer<Handle_t> {
	@:to public inline function asRaw():RawPointer<Handle_t> return this.raw;
	@:from public static inline function fromRaw(r:RawPointer<Handle_t>):Handle return Pointer.fromRaw(r);
	
	public inline function close(cb) Uv.close(asRaw(), cb);
	public inline function isClosing() return Uv.is_closing(asRaw()) != 0;
}