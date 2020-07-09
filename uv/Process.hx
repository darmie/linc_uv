package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Process(Pointer<Process_t>) from Pointer<Process_t> to Pointer<Process_t> {
    public var exit_cb(get, never):ExitCallback;
    inline function get_exit_cp() return this.value.exit_cb;
     
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Process_t));

    public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<Process_t> return this.raw;

    @:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);

    public inline function kill(signum:Int) return Uv.process_kill(asRaw(), signum);
    public inline function get_pid():Int return Uv.process_get_pid(asRaw());
    public inline function spawn(loop, options) return Uv.spawn(loop, asRaw(), options);
}