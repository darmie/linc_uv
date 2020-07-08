package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Write(Pointer<Write_t>) from Pointer<Write_t> to Pointer<Write_t> {
	public var handle(get, never):Stream;
	inline function get_handle() return Stream.fromRaw(this.value.handle);
	
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Write_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Write_t> return this.raw;
	@:to public inline function asReq():Req return (this.reinterpret():Pointer<Req_t>);
	@:from public static inline function fromRaw(r:RawPointer<Write_t>):Write return Pointer.fromRaw(r);
}
