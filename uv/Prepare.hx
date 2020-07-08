package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract Prepare(Pointer<Prepare_t>) from Pointer<Prepare_t> to Pointer<Prepare_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Prepare_t));
    public inline function destroy() return Stdlib.free(this);
    
    @:to public inline function asRaw():RawPointer<Prepare_t> return this.raw;

    public inline function init(loop):Int return Uv.prepare_init(loop, asRaw()); 
    public inline function start(cb):Int return Uv.prepare_start(asRaw(), cb); 
    public inline function stop():Int return Uv.prepare_stop(asRaw()); 
}