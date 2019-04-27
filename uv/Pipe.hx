package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Pipe(Pointer<Pipe_t>) from Pointer<Pipe_t> to Pointer<Pipe_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Pipe_t));
	public inline function init(loop, ipc) return Uv.pipe_init(loop, asRaw(), ipc);
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Pipe_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:to public inline function asStream():Stream return (this.reinterpret():Pointer<Stream_t>);
	@:to public inline function asRawStream():RawPointer<Stream_t> return asStream();
	@:from public static inline function fromStream(s:Stream):Pipe return fromRawStream(s);
	@:from public static inline function fromRawStream(r:RawPointer<Stream_t>):Pipe return (Pointer.fromRaw(r).reinterpret():Pointer<Pipe_t>);
	
	public inline function open(file) return Uv.pipe_open(asRaw(), file);
}