package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Stream(Pointer<Stream_t>) from Pointer<Stream_t> to Pointer<Stream_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Stream_t));
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<Stream_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:from public static inline function fromRaw(r:RawPointer<Stream_t>):Stream return Pointer.fromRaw(r);
	@:from public static inline function fromRawHandle(r:RawPointer<Handle_t>):Stream return (Pointer.fromRaw(r).reinterpret():Pointer<Stream_t>);
	
	public inline function shutdown(req, cb) return Uv.shutdown(req, asRaw(), cb);
	public inline function listen(backlog, cb) return Uv.listen(asRaw(), backlog, cb);
	public inline function accept(client) return Uv.accept(asRaw(), client);
	public inline function readStart(alloc_cb, read_cb) return Uv.read_start(asRaw(), alloc_cb, read_cb);
	public inline function readStop() return Uv.read_stop(asRaw());
	public inline function write(req, bufs, nbufs, cb) return Uv.write(req, asRaw(), bufs, nbufs, cb);
	public inline function isWritable() return Uv.is_writable(asRaw()) != 0;
	public inline function isReadable() return Uv.is_readable(asRaw()) != 0;
}