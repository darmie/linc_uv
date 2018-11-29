package uv;

import uv.Uv;
import cpp.*;

abstract Stream(Pointer<Stream_t>) from Pointer<Stream_t> to Pointer<Stream_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Stream_t));
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<Stream_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	
	public inline function listen(backlog, onConnection) return Uv.listen(asRaw(), backlog, onConnection);
	public inline function accept(client) return Uv.accept(asRaw(), client);
	public inline function readStart(onAlloc, onRead) return Uv.read_start(asRaw(), onAlloc, onRead);
}