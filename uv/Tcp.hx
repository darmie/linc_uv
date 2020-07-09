package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Tcp(Pointer<Tcp_t>) from Pointer<Tcp_t> to Pointer<Tcp_t> {
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Tcp_t));
	public inline function init(loop) return Uv.tcp_init(loop, asRaw());
	public inline function init_ex(loop, flags) return Uv.tcp_init_ex(loop, asRaw(), flags);
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<Tcp_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	@:to public inline function asStream():Stream return (this.reinterpret():Pointer<Stream_t>);
	@:to public inline function asRawStream():RawPointer<Stream_t> return asStream();
	@:from public static inline function fromStream(s:Stream):Tcp return fromRawStream(s);
	@:from public static inline function fromRawStream(r:RawPointer<Stream_t>):Tcp return (Pointer.fromRaw(r).reinterpret():Pointer<Tcp_t>);
	
	public inline function connect(req, dest, cb) return Uv.tcp_connect(req, asRaw(), dest, cb);
	public inline function open(addr, sock) return Uv.tcp_open(asRaw(), sock);
	public inline function bind(addr, flags) return Uv.tcp_bind(asRaw(), addr, flags);
	public inline function nodelay(enable) return Uv.tcp_nodelay(asRaw(), enable);
	public inline function keepalive(enable, delay) return Uv.tcp_keepalive(asRaw(), enable, delay);
	public inline function simultaneous_accepts(enable) return Uv.tcp_simultaneous_accepts(asRaw(), enable);

	public inline function getSockAddress() {
		var name = new SockAddrStorage();
		var namelen = name.sizeof();
		Uv.tcp_getsockname(asRaw(), name, cast Pointer.addressOf(namelen));
		var ret = name.asSockAddrIn().getAddress();
		name.destroy();
		return ret;
	}
	public inline function getPeerAddress() {
		var name = new SockAddrStorage();
		var namelen = name.sizeof();
		Uv.tcp_getpeername(asRaw(), name, cast Pointer.addressOf(namelen));
		var ret = name.asSockAddrIn().getAddress();
		name.destroy();
		return ret;
	}
}