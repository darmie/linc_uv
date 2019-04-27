package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Connect(Pointer<Connect_t>) from Pointer<Connect_t> to Pointer<Connect_t> {
	public var handle(get, never):Stream;
	inline function get_handle() return Stream.fromRaw(this.value.handle);
	
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Connect_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Connect_t> return this.raw;
	@:to public inline function asReq():Req return (this.reinterpret():Pointer<Req_t>);
	@:from public static inline function fromRaw(r:RawPointer<Connect_t>):Connect return Pointer.fromRaw(r);
}
