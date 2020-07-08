package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Tty(Pointer<Tty_t>) from Pointer<Tty_t> to Pointer<Tty_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Tty_t));
	public inline function init(loop, fd, readable) return Uv.tty_init(loop, asRaw(), fd, readable);
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Tty_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:to public inline function asStream():Stream return (this.reinterpret():Pointer<Stream_t>);
	@:to public inline function asRawStream():RawPointer<Stream_t> return asStream();
	@:from public static inline function fromStream(s:Stream):Tty return fromRawStream(s);
    @:from public static inline function fromRawStream(r:RawPointer<Stream_t>):Tty return (Pointer.fromRaw(r).reinterpret():Pointer<Tty_t>);
    
    public inline function set_mode(mode:TTyMode) return Uv.tty_set_mode(asRaw(), mode);
    public inline function reset_mode() return Uv.tty_reset_mode();
    public inline function get_winsize():{width:Int, height:Int} return Uv.tty_get_winsize(asRaw());
}