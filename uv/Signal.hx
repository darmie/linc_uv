package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Signal(Pointer<Signal_t>) from Pointer<Signal_t> to Pointer<Signal_t> {

    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Signal_t));

    public inline function init(loop) return Uv.signal_init(loop, asRaw());

    public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<Signal_t> return this.raw;

    @:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);


    public  inline function start(cb, signum):Int return Uv.signal_start(asRaw(), cb, signum);

    public  inline function startOneshot(cb, signum):Int return Uv.signal_start_oneshot(asRaw(), cb, signum);


    public  inline function stop():Int return Uv.signal_stop(asRaw());

    @:from public static inline function fromRaw(r:RawPointer<Signal_t>):Signal return Pointer.fromRaw(r);
}