package uv;

import uv.Uv;
import cpp.*;

@:dce
abstract Req(Pointer<Req_t>) from Pointer<Req_t> to Pointer<Req_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Req_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Req_t> return this.raw;
	@:from public static inline function fromRaw(r:RawPointer<Req_t>):Req return Pointer.fromRaw(r);
	
	public inline function setData<T>(v:Data<T>) this.value.data = cast v;
	public inline function getData<T>():Data<T> return untyped __cpp__('{0}.data', this.value);

	public inline function cancel() return Uv.cancel(asRaw());
}