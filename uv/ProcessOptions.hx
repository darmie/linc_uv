package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract ProcessOptions(Pointer<ProcessOptions_t>) from Pointer<ProcessOptions_t> to Pointer<ProcessOptions_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(ProcessOptions_t));
    public inline function destroy() return Stdlib.free(this);
    @:to public inline function asRaw():RawPointer<ProcessOptions_t> return this.raw;
}