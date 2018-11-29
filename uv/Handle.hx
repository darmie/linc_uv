package uv;

import uv.Uv;
import cpp.*;

@:dce
abstract Handle(Pointer<Handle_t>) from Pointer<Handle_t> to Pointer<Handle_t> {
	@:to public inline function asRaw():RawPointer<Handle_t> return this.raw;
	
	public inline function close(cb) Uv.close(asRaw(), cb);
}