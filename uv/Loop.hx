package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Loop(Pointer<Loop_t>) from Pointer<Loop_t> to Pointer<Loop_t> {
	public static var DEFAULT(get, null):Loop;
	static inline function get_DEFAULT() return Pointer.fromRaw(Uv.default_loop());
	
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Loop_t));
	public inline function init() return Uv.loop_init(asRaw());
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<Loop_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	
	public inline function run(mode) return Uv.run(asRaw(), mode);
	
	// fs stuff (they use the loop handle as context)
	public inline function open(req, path, flags, mode, cb) return Uv.fs_open(asRaw(), req, path, flags, mode, cb);
	public inline function close(req, file, cb) return Uv.fs_close(asRaw(), req, file, cb);
	public inline function read(req, file, bufs, nbufs, offset, cb) return Uv.fs_read(asRaw(), req, file, bufs, nbufs, offset, cb);
	public inline function unlink(req, path, cb) return Uv.fs_unlink(asRaw(), req, path, cb);
	public inline function write(req, file, bufs, nbufs, offset, cb) return Uv.fs_write(asRaw(), req, file, bufs, nbufs, offset, cb);
}