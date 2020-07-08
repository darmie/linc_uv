package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract Async(Pointer<Async_t>) from Pointer<Async_t> to Pointer<Async_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Async_t));
    public inline function destroy() return Stdlib.free(this);
    
    @:to public inline function asRaw():RawPointer<Async_t> return this.raw;

    public inline function init(loop, cb):Int return Uv.async_init(loop, asRaw(), cb); 
    public inline function send():Int return Uv.async_send(asRaw()); 
}