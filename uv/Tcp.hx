package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract Tcp(Pointer<Tcp_t>) from Pointer<Tcp_t> to Pointer<Tcp_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Tcp_t));
	public inline function init(loop) return Uv.tcp_init(loop, asRaw());
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Tcp_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:to public inline function asStream():Stream return (this.reinterpret():Pointer<Stream_t>);
	@:to public inline function asRawStream():RawPointer<Stream_t> return asStream();
	
	@:from public static inline function fromRawStream(r:RawPointer<Stream_t>):Tcp return (Pointer.fromRaw(r).reinterpret():Pointer<Tcp_t>);
	
	public inline function connect(connect, dest, cb) return Uv.tcp_connect(connect, asRaw(), dest, cb);
	public inline function bind(addr, flags) return Uv.tcp_bind(asRaw(), addr, flags);
}