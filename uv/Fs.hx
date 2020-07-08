package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Fs(Pointer<Fs_t>) from Pointer<Fs_t> to Pointer<Fs_t> {
	public var result(get, never):Int;
	inline function get_result() return this.value.result;
	
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Fs_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Fs_t> return this.raw;
	@:to public inline function asReq():Req return (this.reinterpret():Pointer<Req_t>);
	@:from public static inline function fromRaw(r:RawPointer<Fs_t>):Fs return Pointer.fromRaw(r);

	public inline function open(req, path, flags, mode, cb) return Uv.fs_open(loop, asRaw(), path, flags, mode, cb);
	public inline function close(req, file, cb) return Uv.fs_close(loop, asRaw(), file, cb);
	public inline function read(req, file, bufs, nbufs, offset, cb) return Uv.fs_read(loop, asRaw(), file, bufs, nbufs, offset, cb);
	public inline function unlink(req, path, cb) return Uv.fs_unlink(loop, asRaw(), path, cb);
	public inline function write(req, file, bufs, nbufs, offset, cb) return Uv.fs_write(loop, asRaw(), file, bufs, nbufs, offset, cb);
}
