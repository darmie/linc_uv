package uv;

import uv.Uv;
import cpp.*;

@:dce
abstract Write(Pointer<Write_t>) from Pointer<Write_t> to Pointer<Write_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Write_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Write_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:from public static inline function fromRaw(r:RawPointer<Write_t>):Write return Pointer.fromRaw(r);
	
	public inline function setDataPointer<T, P:Pointer<T>>(v:P) this.value.data = untyped __cpp__('{0}', v);
	public inline function getDataPointer<T, P:Pointer<T>>():P return untyped __cpp__('{0}.data', this.value);
}
