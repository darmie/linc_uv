package uv;

import cpp.*;

@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end
extern class Uv {
	
	@:native("UV_EOF")
	public static var EOF:Int;
	
	@:native("UV_RUN_DEFAULT")
	public static var RUN_DEFAULT:RunMode;
	
	// error
	@:native("uv_strerror")
	public static function strerror(code:Int):ConstCharStar;
	@:native("uv_err_name")
	public static function err_name(code:Int):ConstCharStar;
	
	// loop
	@:native("uv_default_loop")
	public static function default_loop():RawPointer<Loop_t>;
	@:native("uv_loop_init")
	public static function loop_init(loop:RawPointer<Loop_t>):Int;
	@:native("uv_run")
	public static function run(loop:RawPointer<Loop_t>, mode:RunMode):Int;
	
	// timer
	@:native("uv_timer_init")
	public static function timer_init(loop:RawPointer<Loop_t>, timer:RawPointer<Timer_t>):Int;
	@:native("uv_timer_start")
	public static function timer_start(timer:RawPointer<Timer_t>, cb:TimerCallback, timeout:UInt64_t, repeat:UInt64_t):Int;
	@:native("uv_timer_stop")
	public static function timer_stop(timer:RawPointer<Timer_t>):Int;
	
	// tcp
	@:native("uv_tcp_init")
	public static function tcp_init(loop:RawPointer<Loop_t>, tcp:RawPointer<Tcp_t>):Int;
	@:native("uv_tcp_bind")
	public static function tcp_bind(tcp:RawPointer<Tcp_t>, addr:RawConstPointer<SockAddr_s>, flags:Int):Int;
	
	// stream
	@:native("uv_listen")
	public static function listen(stream:RawPointer<Stream_t>, backlog:Int, cb:ConnectionCallback):Int;
	@:native("uv_accept")
	public static function accept(stream:RawPointer<Stream_t>, client:RawPointer<Stream_t>):Int;
	@:native("uv_read_start")
	public static function read_start(stream:RawPointer<Stream_t>, alloc_cb:AllocCallback, read_cb:ReadCallback):Int;
	@:native("uv_read_stop")
	public static function read_stop(stream:RawPointer<Stream_t>):Int;
	@:native("uv_close")
	public static function close(stream:RawPointer<Handle_t>, cb:CloseCallback):Int;
	
	// misc
	@:native("uv_ip4_addr")
	public static function ip4_addr(ip:String, port:Int, addr:RawPointer<SockAddrIn_s>):Int;
	@:native("uv_hrtime")
	public static function hrtime():UInt64_t;
}



@:include('linc_uv.h')
@:native('uv_run_mode')
@:unreflective
extern class RunMode {}

@:include('linc_uv.h')
@:native('uv_handle_t')
@:unreflective
@:structAccess
extern class Handle_t {
	var data:RawPointer<cpp.Void>;
}

@:include('linc_uv.h')
@:native('uv_loop_t')
@:unreflective
@:structAccess
extern class Loop_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_tcp_t')
@:unreflective
@:structAccess
extern class Tcp_t extends Stream_t {}

@:include('linc_uv.h')
@:native('uv_timer_t')
@:unreflective
@:structAccess
extern class Timer_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_stream_t')
@:unreflective
@:structAccess
extern class Stream_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_buf_t')
@:unreflective
@:structAccess
extern class Buf_t {
	var base:RawPointer<Char>;
	var len:Int;
}

@:include('linc_uv.h')
@:native('sockaddr')
@:unreflective
@:structAccess
extern class SockAddr_s {}

@:include('linc_uv.h')
@:native('sockaddr_in')
@:unreflective
@:structAccess
extern class SockAddrIn_s {}

@:include('linc_uv.h')
@:native('size_t')
@:unreflective
extern class Size_t {}

@:include('linc_uv.h')
@:native('ssize_t')
@:unreflective
extern class SSize_t {}

@:include('linc_uv.h')
@:native('uint64_t')
@:unreflective
extern class UInt64_t {}

@:include('linc_uv.h')
@:native('long')
@:unreflective
extern class Long {}

typedef ConnectionCallback = Callable<RawPointer<Stream_t>->Int->Void>;
typedef AllocCallback = Callable<RawPointer<Handle_t>->Size_t->RawPointer<Buf_t>->Void>;
typedef ReadCallback = Callable<RawPointer<Stream_t>->Long->RawConstPointer<Buf_t>->Void>;
typedef CloseCallback = Callable<RawPointer<Handle_t>->Void>;
typedef TimerCallback = Callable<RawPointer<Timer_t>->Void>;