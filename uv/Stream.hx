package uv;

import uv.Uv;
import cpp.*;

@:dce
abstract Stream(Pointer<Stream_t>) from Pointer<Stream_t> to Pointer<Stream_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Stream_t));
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<Stream_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:from public static inline function fromRaw(r:RawPointer<Stream_t>):Stream return Pointer.fromRaw(r);
	@:from public static inline function fromRawHandle(r:RawPointer<Handle_t>):Stream return (Pointer.fromRaw(r).reinterpret():Pointer<Stream_t>);
	
	public inline function setData<T>(v:Data<T>) this.value.data = cast v;
	public inline function getData<T>():Data<T> return untyped __cpp__('{0}.data', this.value);
	
	public inline function listen(backlog, onConnection) return Uv.listen(asRaw(), backlog, onConnection);
	public inline function accept(client) return Uv.accept(asRaw(), client);
	public inline function readStart(onAlloc, onRead) return Uv.read_start(asRaw(), onAlloc, onRead);
	public inline function readStop() return Uv.read_stop(asRaw());
	public inline function write(req, bufs, nbufs, cb) return Uv.write(req, asRaw(), bufs, nbufs, cb);
}