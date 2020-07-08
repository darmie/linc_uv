package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract Poll(Pointer<Poll_t>) from Pointer<Poll_t> to Pointer<Poll_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Poll_t));
    public inline function destroy() return Stdlib.free(this);
    
    @:to public inline function asRaw():RawPointer<Poll_t> return this.raw;

    public inline function init(loop, fd) return Uv.poll_init(loop, asRaw(), fd);
    public inline function init_socket(loop, socket) return Uv.poll_init_socket(loop, asRaw(), socket);
    public inline function start(events, cb) return Uv.poll_start(asRaw(), events, cb);
    public inline function stop() return Uv.poll_stop(asRaw());
}