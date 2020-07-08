package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Fs(Pointer<Fs_t>) from Pointer<Fs_t> to Pointer<Fs_t> {
	public var result(get, never):Int;
	inline function get_result() return this.value.result;
	
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Fs_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Fs_t> return this.raw;
	@:to public inline function asReq():Req return (this.reinterpret():Pointer<Req_t>);
	@:from public static inline function fromRaw(r:RawPointer<Fs_t>):Fs return Pointer.fromRaw(r);
}
