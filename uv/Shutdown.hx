package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Shutdown(Pointer<Shutdown_t>) from Pointer<Shutdown_t> to Pointer<Shutdown_t> {
	public var handle(get, never):Stream;
	inline function get_handle() return Stream.fromRaw(this.value.handle);
	
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Shutdown_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Shutdown_t> return this.raw;
	@:to public inline function asReq():Req return (this.reinterpret():Pointer<Req_t>);
	@:from public static inline function fromRaw(r:RawPointer<Shutdown_t>):Shutdown return Pointer.fromRaw(r);
}
