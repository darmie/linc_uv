package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract Idle(Pointer<Idle_t>) from Pointer<Idle_t> to Pointer<Idle_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Idle_t));
    public inline function destroy() return Stdlib.free(this);
    
    @:to public inline function asRaw():RawPointer<Idle_t> return this.raw;

    public inline function init(loop):Int return Uv.idle_init(loop, asRaw()); 
    public inline function start(cb):Int return Uv.idle_start(asRaw(), cb); 
    public inline function stop():Int return Uv.idle_stop(asRaw()); 
}