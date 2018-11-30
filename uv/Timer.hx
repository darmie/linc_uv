package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Timer(Pointer<Timer_t>) from Pointer<Timer_t> to Pointer<Timer_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Timer_t));
	public inline function init(loop) return Uv.timer_init(loop, asRaw());
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Timer_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:from public static inline function fromRaw(r:RawPointer<Timer_t>):Timer return Pointer.fromRaw(r);
	
	public inline function start(cb, timeout, repeat) return Uv.timer_start(asRaw(), cb, timeout, repeat);
	public inline function stop() return Uv.timer_stop(asRaw());
}