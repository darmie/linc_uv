package uv;

import uv.Uv;
import cpp.*;

@:dce 
@:build(uv.Data.inject())
abstract Work(Pointer<Work_t>) from Pointer<Work_t> to Pointer<Work_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Work_t));
    public inline function destroy() return Stdlib.free(this);
    @:to public inline function asRaw():RawPointer<Work_t> return this.raw;
	@:to public inline function asReq():Req return (this.reinterpret():Pointer<Req_t>);
    @:from public static inline function fromRaw(r:RawPointer<Work_t>):Work_t return Pointer.fromRaw(r);
    
    public inline function cancel():Int return Uv.cancel(asReq().asRaw());
    public inline function queue(loop, work_cb, after_work_cb) return Uv.queue_work(loop, asRaw(), work_cb, after_work_cb);
}
