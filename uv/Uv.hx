package uv;

import cpp.*;

@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end
extern class Uv {
	
	// error
	@:native("UV_E2BIG")
	public static var E2BIG:Int;
	@:native("UV_EACCES")
	public static var EACCES:Int;
	@:native("UV_EADDRINUSE")
	public static var EADDRINUSE:Int;
	@:native("UV_EADDRNOTAVAIL")
	public static var EADDRNOTAVAIL:Int;
	@:native("UV_EAFNOSUPPORT")
	public static var EAFNOSUPPORT:Int;
	@:native("UV_EAGAIN")
	public static var EAGAIN:Int;
	@:native("UV_EAI_ADDRFAMILY")
	public static var EAI_ADDRFAMILY:Int;
	@:native("UV_EAI_AGAIN")
	public static var EAI_AGAIN:Int;
	@:native("UV_EAI_BADFLAGS")
	public static var EAI_BADFLAGS:Int;
	@:native("UV_EAI_BADHINTS")
	public static var EAI_BADHINTS:Int;
	@:native("UV_EAI_CANCELED")
	public static var EAI_CANCELED:Int;
	@:native("UV_EAI_FAIL")
	public static var EAI_FAIL:Int;
	@:native("UV_EAI_FAMILY")
	public static var EAI_FAMILY:Int;
	@:native("UV_EAI_MEMORY")
	public static var EAI_MEMORY:Int;
	@:native("UV_EAI_NODATA")
	public static var EAI_NODATA:Int;
	@:native("UV_EAI_NONAME")
	public static var EAI_NONAME:Int;
	@:native("UV_EAI_OVERFLOW")
	public static var EAI_OVERFLOW:Int;
	@:native("UV_EAI_PROTOCOL")
	public static var EAI_PROTOCOL:Int;
	@:native("UV_EAI_SERVICE")
	public static var EAI_SERVICE:Int;
	@:native("UV_EAI_SOCKTYPE")
	public static var EAI_SOCKTYPE:Int;
	@:native("UV_EALREADY")
	public static var EALREADY:Int;
	@:native("UV_EBADF")
	public static var EBADF:Int;
	@:native("UV_EBUSY")
	public static var EBUSY:Int;
	@:native("UV_ECANCELED")
	public static var ECANCELED:Int;
	@:native("UV_ECHARSET")
	public static var ECHARSET:Int;
	@:native("UV_ECONNABORTED")
	public static var ECONNABORTED:Int;
	@:native("UV_ECONNREFUSED")
	public static var ECONNREFUSED:Int;
	@:native("UV_ECONNRESET")
	public static var ECONNRESET:Int;
	@:native("UV_EDESTADDRREQ")
	public static var EDESTADDRREQ:Int;
	@:native("UV_EEXIST")
	public static var EEXIST:Int;
	@:native("UV_EFAULT")
	public static var EFAULT:Int;
	@:native("UV_EFBIG")
	public static var EFBIG:Int;
	@:native("UV_EHOSTUNREACH")
	public static var EHOSTUNREACH:Int;
	@:native("UV_EINTR")
	public static var EINTR:Int;
	@:native("UV_EINVAL")
	public static var EINVAL:Int;
	@:native("UV_EIO")
	public static var EIO:Int;
	@:native("UV_EISCONN")
	public static var EISCONN:Int;
	@:native("UV_EISDIR")
	public static var EISDIR:Int;
	@:native("UV_ELOOP")
	public static var ELOOP:Int;
	@:native("UV_EMFILE")
	public static var EMFILE:Int;
	@:native("UV_EMSGSIZE")
	public static var EMSGSIZE:Int;
	@:native("UV_ENAMETOOLONG")
	public static var ENAMETOOLONG:Int;
	@:native("UV_ENETDOWN")
	public static var ENETDOWN:Int;
	@:native("UV_ENETUNREACH")
	public static var ENETUNREACH:Int;
	@:native("UV_ENFILE")
	public static var ENFILE:Int;
	@:native("UV_ENOBUFS")
	public static var ENOBUFS:Int;
	@:native("UV_ENODEV")
	public static var ENODEV:Int;
	@:native("UV_ENOENT")
	public static var ENOENT:Int;
	@:native("UV_ENOMEM")
	public static var ENOMEM:Int;
	@:native("UV_ENONET")
	public static var ENONET:Int;
	@:native("UV_ENOPROTOOPT")
	public static var ENOPROTOOPT:Int;
	@:native("UV_ENOSPC")
	public static var ENOSPC:Int;
	@:native("UV_ENOSYS")
	public static var ENOSYS:Int;
	@:native("UV_ENOTCONN")
	public static var ENOTCONN:Int;
	@:native("UV_ENOTDIR")
	public static var ENOTDIR:Int;
	@:native("UV_ENOTEMPTY")
	public static var ENOTEMPTY:Int;
	@:native("UV_ENOTSOCK")
	public static var ENOTSOCK:Int;
	@:native("UV_ENOTSUP")
	public static var ENOTSUP:Int;
	@:native("UV_EPERM")
	public static var EPERM:Int;
	@:native("UV_EPIPE")
	public static var EPIPE:Int;
	@:native("UV_EPROTO")
	public static var EPROTO:Int;
	@:native("UV_EPROTONOSUPPORT")
	public static var EPROTONOSUPPORT:Int;
	@:native("UV_EPROTOTYPE")
	public static var EPROTOTYPE:Int;
	@:native("UV_ERANGE")
	public static var ERANGE:Int;
	@:native("UV_EROFS")
	public static var EROFS:Int;
	@:native("UV_ESHUTDOWN")
	public static var ESHUTDOWN:Int;
	@:native("UV_ESPIPE")
	public static var ESPIPE:Int;
	@:native("UV_ESRCH")
	public static var ESRCH:Int;
	@:native("UV_ETIMEDOUT")
	public static var ETIMEDOUT:Int;
	@:native("UV_ETXTBSY")
	public static var ETXTBSY:Int;
	@:native("UV_EXDEV")
	public static var EXDEV:Int;
	@:native("UV_UNKNOWN")
	public static var UNKNOWN:Int;
	@:native("UV_EOF")
	public static var EOF:Int;
	@:native("UV_ENXIO")
	public static var ENXIO:Int;
	@:native("UV_EMLINK")
	public static var EMLINK:Int;
	
	// uv_run_mode
	@:native("UV_RUN_DEFAULT")
	public static var RUN_DEFAULT:RunMode;
    @:native("UV_RUN_ONCE")
	public static var RUN_ONCE:RunMode;
    @:native("UV_RUN_NOWAIT")
	public static var RUN_NOWAIT:RunMode;
	
	// misc
	@:native("AF_INET")
	public static var AF_INET:Int;
	@:native("AF_INET6")
	public static var AF_INET6:Int;
	
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
	public static function timer_start(timer:RawPointer<Timer_t>, cb:Callable<TimerCallback>, timeout:UInt64, repeat:UInt64):Int;
	@:native("uv_timer_stop")
	public static function timer_stop(timer:RawPointer<Timer_t>):Int;
	
	// tcp
	@:native("uv_tcp_init")
	public static function tcp_init(loop:RawPointer<Loop_t>, handle:RawPointer<Tcp_t>):Int;
	@:native("uv_tcp_bind")
	public static function tcp_bind(handle:RawPointer<Tcp_t>, addr:RawConstPointer<SockAddr_s>, flags:Int):Int;
	@:native("uv_tcp_connect")
	public static function tcp_connect(req:RawPointer<Connect_t>, handle:RawPointer<Tcp_t>, addr:RawConstPointer<SockAddr_s>, cb:Callable<ConnectCallback>):Int;
	@:native("uv_tcp_getsockname")
	public static function tcp_getsockname(handle:RawConstPointer<Tcp_t>, name:RawPointer<SockAddr_s>, namelen:RawPointer<Int>):Int;
	@:native("uv_tcp_getpeername")
	public static function tcp_getpeername(handle:RawConstPointer<Tcp_t>, name:RawPointer<SockAddr_s>, namelen:RawPointer<Int>):Int;
	
	// stream
	@:native("uv_shutdown")
	public static function shutdown(req:RawPointer<Shutdown_t>, handle:RawPointer<Stream_t>, cb:Callable<ShutdownCallback>):Int;
	@:native("uv_listen")
	public static function listen(handle:RawPointer<Stream_t>, backlog:Int, cb:Callable<ConnectionCallback>):Int;
	@:native("uv_accept")
	public static function accept(handle:RawPointer<Stream_t>, client:RawPointer<Stream_t>):Int;
	@:native("uv_read_start")
	public static function read_start(handle:RawPointer<Stream_t>, alloc_cb:Callable<AllocCallback>, read_cb:Callable<ReadCallback>):Int;
	@:native("uv_read_stop")
	public static function read_stop(handle:RawPointer<Stream_t>):Int;
	@:native("uv_write")
	public static function write(req:RawPointer<Write_t>, handle:RawPointer<Stream_t>, bufs:RawConstPointer<Buf_t>, nbufs:UInt32, cb:Callable<WriteCallback>):Int;
	@:native("uv_is_readable")
	public static function is_readable(handle:RawConstPointer<Stream_t>):Int;
	@:native("uv_is_writable")
	public static function is_writable(handle:RawConstPointer<Stream_t>):Int;
	
	// handle
	@:native("uv_is_active")
	public static function is_active(handle:RawConstPointer<Handle_t>):Int;
	@:native("uv_is_closing")
	public static function is_closing(handle:RawConstPointer<Handle_t>):Int;
	@:native("uv_close")
	public static function close(handle:RawPointer<Handle_t>, close_cb:Callable<CloseCallback>):Void;
	@:native("uv_ref")
	public static function ref(handle:RawPointer<Handle_t>):Void;
	@:native("uv_unref")
	public static function unref(handle:RawPointer<Handle_t>):Void;
	@:native("uv_has_ref")
	public static function has_ref(handle:RawConstPointer<Handle_t>):Int;
	@:native("uv_handle_size")
	public static function handle_size(type:HandleType):SizeT;
	
	// fs
	// @:native("uv_fs_close")
	// public static function fs_close(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, file:File_s, cb:Callable<FsCallback>):Void;
	// @:native("uv_fs_open")
	// public static function fs_open(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, path:ConstCharStar, flags:Int, cb:Callable<FsCallback>):Void;
	
	// dns
	@:native("uv_getaddrinfo")
	public static function getaddrinfo(loop:RawPointer<Loop_t>, req:RawPointer<GetAddrInfo_t>, getaddrinfo_cb:Callable<GetAddrInfoCallback>, node:ConstCharStar, service:ConstCharStar, hints:RawConstPointer<AddrInfo_s>):Int;
	@:native("uv_freeaddrinfo")
	public static function freeaddrinfo(ai:RawPointer<AddrInfo_s>):Void;
	@:native("uv_getnameinfo")
	public static function getnameinfo(loop:RawPointer<Loop_t>, req:RawPointer<GetNameInfo_t>, getnameinfo_cb:Callable<GetNameInfoCallback>, addr:RawConstPointer<SockAddr_s>, flags:Int):Int;
	
	// misc
	@:native("uv_buf_init")
	public static function buf_init(base:RawPointer<Char>, len:UInt32):Buf_t;
	@:native("uv_ip4_addr")
	public static function ip4_addr(ip:String, port:Int, addr:RawPointer<SockAddrIn_s>):Int;
	@:native("uv_ip4_name")
	public static function ip4_name(src:RawConstPointer<SockAddrIn_s>, dst:RawPointer<Char>, size:SizeT):Int;
	@:native("uv_hrtime")
	public static function hrtime():UInt64;
	@:native("uv_inet_ntop")
	public static function inet_ntop(af:Int, src:RawConstPointer<cpp.Void>, dst:RawPointer<Char>, size:SizeT):Int;
	@:native("uv_inet_pton")
	public static function inet_pton(af:Int, src:ConstCharStar, dst:RawPointer<cpp.Void>):Int;
}

// enums

@:include('linc_uv.h')
@:native('uv_run_mode')
@:unreflective
extern class RunMode {}

@:include('linc_uv.h')
@:native('uv_handle_type')
@:unreflective
extern class HandleType {}

// handles

@:include('linc_uv.h')
@:native('uv_req_t')
@:unreflective
@:structAccess
extern class Req_t {
	var data:RawPointer<cpp.Void>;
}

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
@:native('uv_buf_t')
@:unreflective
@:structAccess
extern class Buf_t {
	var base:CastCharStar;
	var len:Int;
}

// req

@:include('linc_uv.h')
@:native('uv_shutdown_t')
@:unreflective
@:structAccess
extern class Shutdown_t extends Handle_t {
	var handle:RawPointer<Stream_t>;
}

@:include('linc_uv.h')
@:native('uv_connect_t')
@:unreflective
@:structAccess
extern class Connect_t extends Handle_t {
	var handle:RawPointer<Stream_t>;
}

@:include('linc_uv.h')
@:native('uv_write_t')
@:unreflective
@:structAccess
extern class Write_t extends Handle_t {
	var handle:RawPointer<Stream_t>;
}

@:include('linc_uv.h')
@:native('uv_getaddrinfo_t')
@:unreflective
@:structAccess
extern class GetAddrInfo_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_getnameinfo_t')
@:unreflective
@:structAccess
extern class GetNameInfo_t extends Handle_t {}



// misc

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
@:native('addrinfo')
@:unreflective
@:structAccess
extern class AddrInfo_s {
	var ai_flags:Int;
	var ai_family:Int;
	var ai_socktype:Int;
	var ai_protocol:Int;
	// var ai_addrlen:socklen_t;
	var ai_addr:RawPointer<SockAddr_s>;
	var ai_canonname:RawPointer<Char>;
	var ai_next:RawPointer<AddrInfo>;
}

@:native("ssize_t")
@:scalar @:coreType @:notNull
extern abstract SSizeT from(Int) to(Int) {}

@:native("long")
@:scalar @:coreType @:notNull
extern abstract Long from(Int) to(Int) {}

typedef ShutdownCallback = RawPointer<Shutdown_t>->Int->Void;
typedef ConnectCallback = RawPointer<Connect_t>->Int->Void;
typedef ConnectionCallback = RawPointer<Stream_t>->Int->Void;
typedef AllocCallback = RawPointer<Handle_t>->SizeT->RawPointer<Buf_t>->Void;
typedef ReadCallback = RawPointer<Stream_t>->SSizeT->RawConstPointer<Buf_t>->Void;
typedef WriteCallback = RawPointer<Write_t>->Int->Void;
typedef CloseCallback = RawPointer<Handle_t>->Void;
typedef TimerCallback = RawPointer<Timer_t>->Void;
typedef GetAddrInfoCallback = RawPointer<GetAddrInfo_t>->Int->RawPointer<AddrInfo_s>->Void;
typedef GetNameInfoCallback = RawPointer<GetNameInfo_t>->Int->ConstCharStar->ConstCharStar->Void;