package uv;

import uv.Uv;
import cpp.*;

abstract Tcp(Pointer<Tcp_t>) from Pointer<Tcp_t> to Pointer<Tcp_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Tcp_t));
	public inline function init(loop:Loop) {
		var r = Uv.tcp_init(loop, asRaw());
		this.value.data = untyped __cpp__('{0}', this);
		return r;
	} 
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Tcp_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:to public inline function asStream():Stream return (this.reinterpret():Pointer<Stream_t>);
	@:to public inline function asRawStream():RawPointer<Stream_t> return asStream();
	
	// assuming the Pointer ref is stored in the `data` field
	@:from public static inline function fromRawStream(s:RawPointer<Stream_t>):Tcp return untyped __cpp__('{0}->data', s);
	
	public inline function bind(addr, flags) return Uv.tcp_bind(asRaw(), addr, flags);
}