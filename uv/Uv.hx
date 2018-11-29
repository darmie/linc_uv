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
	public static function default_loop():LoopHandle;
	@:native("uv_loop_init")
	public static function loop_init(loop:LoopHandle):Int;
	@:native("uv_run")
	public static function run(loop:LoopHandle, mode:RunMode):Int;
	
	// timer
	@:native("uv_timer_init")
	public static function timer_init(loop:LoopHandle, timer:TimerHandle):Int;
	@:native("uv_timer_start")
	public static function timer_start(timer:TimerHandle, cb:TimerCallback, timeout:UInt64_t, repeat:UInt64_t):Int;
	@:native("uv_timer_stop")
	public static function timer_stop(timer:TimerHandle):Int;
	
	// tcp
	@:native("uv_tcp_init")
	public static function tcp_init(loop:LoopHandle, tcp:TcpHandle):Int;
	@:native("uv_tcp_bind")
	public static function tcp_bind(tcp:TcpHandle, addr:SockAddrHandle, flags:Int):Int;
	
	// stream
	@:native("uv_listen")
	public static function listen(stream:StreamHandle, backlog:Int, cb:ConnectionCallback):Int;
	@:native("uv_accept")
	public static function accept(stream:StreamHandle, client:StreamHandle):Int;
	@:native("uv_read_start")
	public static function read_start(stream:StreamHandle, alloc_cb:AllocCallback, read_cb:ReadCallback):Int;
	@:native("uv_read_stop")
	public static function read_stop(stream:StreamHandle):Int;
	@:native("uv_close")
	public static function close(stream:Handle, cb:CloseCallback):Int;
	
	// misc
	@:native("uv_ip4_addr")
	public static function ip4_addr(ip:String, port:Int, addr:SockAddrInHandle):Int;
	@:native("uv_hrtime")
	public static function hrtime():UInt64_t;
}



@:include('linc_uv.h')
@:native('uv_run_mode')
extern class RunMode {}


@:include('linc_uv.h')
@:native('cpp::Reference<uv_handle_t>')
extern class Handle {
	var data:Star<cpp.Void>;
}

@:include('linc_uv.h')
@:native('uv_handle_t')
extern class Handle_t {}

@:include('linc_uv.h')
@:native('cpp::Reference<uv_loop_t>')
extern class LoopHandle extends Handle {}

@:include('linc_uv.h')
@:native('uv_loop_t')
extern class Loop_t {}

@:include('linc_uv.h')
@:native('cpp::Reference<uv_tcp_t>')
extern class TcpHandle extends StreamHandle {}

@:include('linc_uv.h')
@:native('uv_tcp_t')
extern class Tcp_t {}

@:include('linc_uv.h')
@:native('cpp::Reference<uv_timer_t>')
extern class TimerHandle extends Handle {}

@:include('linc_uv.h')
@:native('uv_timer_t')
extern class Timer_t {}

@:include('linc_uv.h')
@:native('cpp::Reference<uv_stream_t>')
extern class StreamHandle extends Handle {}

@:include('linc_uv.h')
@:native('uv_stream_t')
extern class Stream_t {}

@:include('linc_uv.h')
@:native('cpp::Reference<uv_buf_t>')
extern class BufHandle extends Handle {
	var base:Star<Char>;
	var len:Int;
}

@:include('linc_uv.h')
@:native('uv_buf_t')
extern class Buf_t {}

@:include('linc_uv.h')
@:native('cpp::Reference<sockaddr>')
extern class SockAddrHandle {}

@:include('linc_uv.h')
@:native('cpp::Reference<sockaddr_in>')
extern class SockAddrInHandle {}

@:include('linc_uv.h')
@:native('sockaddr_in')
extern class SockAddrIn {}

@:include('linc_uv.h')
@:native('size_t')
extern class Size_t {}

@:include('linc_uv.h')
@:native('ssize_t')
extern class SSize_t {}

@:include('linc_uv.h')
@:native('uint64_t')
extern class UInt64_t {}

@:include('linc_uv.h')
@:native('long')
extern class Long {}

typedef ConnectionCallback = Callable<Star<Stream_t>->Int->Void>;
typedef AllocCallback = Callable<Star<Handle_t>->Size_t->Star<Buf_t>->Void>;
typedef ReadCallback = Callable<Star<Stream_t>->Long->ConstStar<Buf_t>->Void>;
typedef CloseCallback = Callable<Star<Handle_t>->Void>;
typedef TimerCallback = Callable<Star<Timer_t>->Void>;