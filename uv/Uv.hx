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
	
	@:native("UV_TCP")
	public static var TCP:Int;
	@:native("UV_NAMED_PIPE")
	public static var NAMED_PIPE:Int;
	@:native("UV_TTY")
	public static var TTY:Int;
	
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
	public static function tcp_init(loop:RawPointer<Loop_t>, handle:RawPointer<Tcp_t>):Int;
	@:native("uv_tcp_bind")
	public static function tcp_bind(handle:RawPointer<Tcp_t>, addr:RawConstPointer<SockAddr_s>, flags:Int):Int;
	@:native("uv_tcp_connect")
	public static function tcp_connect(req:RawPointer<Connect_t>, handle:RawPointer<Tcp_t>, addr:RawConstPointer<SockAddr_s>, cb:ConnectCallback):Int;
	@:native("uv_tcp_getsockname")
	public static function tcp_getsockname(handle:RawConstPointer<Tcp_t>, name:RawPointer<SockAddr_s>, namelen:RawPointer<Int>):Int;
	@:native("uv_tcp_getpeername")
	public static function tcp_getpeername(handle:RawConstPointer<Tcp_t>, name:RawPointer<SockAddr_s>, namelen:RawPointer<Int>):Int;
	
	// stream
	@:native("uv_listen")
	public static function listen(handle:RawPointer<Stream_t>, backlog:Int, cb:ConnectionCallback):Int;
	@:native("uv_accept")
	public static function accept(handle:RawPointer<Stream_t>, client:RawPointer<Stream_t>):Int;
	@:native("uv_read_start")
	public static function read_start(handle:RawPointer<Stream_t>, alloc_cb:AllocCallback, read_cb:ReadCallback):Int;
	@:native("uv_read_stop")
	public static function read_stop(handle:RawPointer<Stream_t>):Int;
	@:native("uv_write")
	public static function write(req:RawPointer<Write_t>, handle:RawPointer<Stream_t>, bufs:RawConstPointer<Buf_t>, nbufs:UInt32, cb:WriteCallback):Int;
	
	// handle
	@:native("uv_is_active")
	public static function is_active(handle:RawConstPointer<Handle_t>):Int;
	@:native("uv_is_closing")
	public static function is_closing(handle:RawConstPointer<Handle_t>):Int;
	@:native("uv_close")
	public static function close(handle:RawPointer<Handle_t>, close_cb:CloseCallback):Void;
	@:native("uv_ref")
	public static function ref(handle:RawPointer<Handle_t>):Void;
	@:native("uv_unref")
	public static function unref(handle:RawPointer<Handle_t>):Void;
	@:native("uv_has_ref")
	public static function has_ref(handle:RawConstPointer<Handle_t>):Int;
	@:native("uv_handle_size")
	public static function handle_size(type:HandleType):Size_t;
	
	// fs
	// @:native("uv_fs_close")
	// public static function fs_close(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, file:File_s, cb:FsCallback):Void;
	// @:native("uv_fs_open")
	// public static function fs_open(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, path:ConstCharStar, flags:Int, cb:FsCallback):Void;
	
	
	// misc
	@:native("uv_buf_init")
	public static function buf_init(base:RawPointer<Char>, len:UInt32):Buf_t;
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
@:native('uv_handle_type')
@:unreflective
extern class HandleType {}

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
@:native('uv_fs_t')
@:unreflective
@:structAccess
extern class Fs_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_stream_t')
@:unreflective
@:structAccess
extern class Stream_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_connect_t')
@:unreflective
@:structAccess
extern class Connect_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_write_t')
@:unreflective
@:structAccess
extern class Write_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_buf_t')
@:unreflective
@:structAccess
extern class Buf_t {
	var base:CastCharStar;
	var len:Int;
}

@:include('linc_uv.h')
@:native('file')
@:unreflective
@:structAccess
extern class File_s {}

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
@:native('sockaddr_storage')
@:unreflective
@:structAccess
extern class SockAddrStorage_s {}

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

typedef ConnectCallback = Callable<RawPointer<Connect_t>->Int->Void>;
typedef ConnectionCallback = Callable<RawPointer<Stream_t>->Int->Void>;
typedef AllocCallback = Callable<RawPointer<Handle_t>->Size_t->RawPointer<Buf_t>->Void>;
typedef ReadCallback = Callable<RawPointer<Stream_t>->SSize_t->RawConstPointer<Buf_t>->Void>;
typedef WriteCallback = Callable<RawPointer<Write_t>->Int->Void>;
typedef CloseCallback = Callable<RawPointer<Handle_t>->Void>;
typedef TimerCallback = Callable<RawPointer<Timer_t>->Void>;