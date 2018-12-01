package uv;

import uv.Uv;
import cpp.*;

@:dce
abstract Handle(Pointer<Handle_t>) from Pointer<Handle_t> to Pointer<Handle_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Handle_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Handle_t> return this.raw;
	@:from public static inline function fromRaw(r:RawPointer<Handle_t>):Handle return Pointer.fromRaw(r);
	
	public inline function setData<T>(v:Data<T>) this.value.data = cast v;
	public inline function getData<T>():Data<T> return untyped __cpp__('{0}.data', this.value);
	
	public inline function close(cb) Uv.close(asRaw(), cb);
	public inline function isClosing() return Uv.is_closing(asRaw()) != 0;
}