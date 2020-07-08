package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract Check(Pointer<Check_t>) from Pointer<Check_t> to Pointer<Check_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Check_t));
    public inline function destroy() return Stdlib.free(this);
    
    @:to public inline function asRaw():RawPointer<Check_t> return this.raw;

    public inline function init(loop):Int return Uv.check_init(loop, asRaw()); 
    public inline function start(cb):Int return Uv.check_start(asRaw(), cb); 
    public inline function stop():Int return Uv.check_stop(asRaw()); 
}