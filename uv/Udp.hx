package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Udp(Pointer<Udp_t>) from Pointer<Udp_t> to Pointer<Udp_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Udp_t));
	public inline function init(loop) return Uv.udp_init(loop, asRaw());
	public inline function init_ex(loop, flags) return Uv.udp_init_ex(loop, asRaw(), flags);
    public inline function destroy() return Stdlib.free(this);
    
    @:to public inline function asRaw():RawPointer<Udp_t> return this.raw;
    @:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);

    @:from public static inline function fromRaw(r:RawPointer<Udp_t>):Udp return Pointer.fromRaw(r);    

    public inline function bind(addr, flags) return Uv.udp_bind(asRaw(), addr, flags);
    public inline function open(sock) return Uv.udp_open(asRaw(), sock);
    public inline function set_membership(multicast_addr, interface_addr, membership) return Uv.udp_set_membership(asRaw(), multicast_addr, interface_addr, membership);
    public inline function set_multicast_loop(on) return Uv.udp_set_multicast_loop(asRaw(), on);
    public inline function set_multicast_ttl(ttl) return Uv.udp_set_multicast_ttl(asRaw(), ttl);
    public inline function set_multicast_interface(interface_addr) return Uv.udp_set_multicast_interface(asRaw(), interface_addr);
    public inline function set_broadcast(on) return Uv.udp_set_broadcast(asRaw(), on);
    public inline function set_ttl(ttl) return Uv.udp_set_ttl(asRaw(), ttl);
    public inline function send(req, bufs, nbufs, addr, send_cb) return Uv.udp_send(req, asRaw(), bufs, nbufs, addr, send_cb); 
    public inline function try_send(bufs, nbufs, addr, send_cb) return Uv.udp_try_send(asRaw(), bufs, nbufs, addr, send_cb); 
    public inline function recv_start(alloc_cb, recv_cb) return Uv.udp_recv_start(asRaw(), alloc_cb, recv_cb);
    public inline function recv_stop() return Uv.udp_recv_stop(asRaw());
    public inline function get_send_queue_size() return Uv.udp_get_send_queue_size(asRaw());
    public inline function get_send_queue_count() return Uv.udp_get_send_queue_size(asRaw());
}

@:dce
@:build(uv.Data.inject())
abstract UdpSend(Pointer<UdpSend_t>) from Pointer<UdpSend_t> to Pointer<UdpSend_t>{
    public var handle(get, never):Udp;
    public var cb(get, never):UdpSendCallback;
    inline function get_handle() return Udp.fromRaw(this.value.handle);
    inline function get_cb() return this.value.cb;
	
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(UdpSend_t));
	public inline function destroy() return Stdlib.free(this);
	
	@:to public inline function asRaw():RawPointer<UdpSend_t> return this.raw;
	@:to public inline function asReq():Req return (this.reinterpret():Pointer<Req_t>);
	@:from public static inline function fromRaw(r:RawPointer<UdpSend_t>):UdpSend return Pointer.fromRaw(r);    
}