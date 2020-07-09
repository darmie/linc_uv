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
	// fs open mode
	@:native("UV_FS_O_APPEND")
	public static var FS_O_APPEND:Int;
	@:native("UV_FS_O_CREAT")
	public static var FS_O_CREAT:Int;
	@:native("UV_FS_O_DIRECT")
	public static var FS_O_DIRECT:Int;
	@:native("UV_FS_O_DIRECTORY")
	public static var FS_O_DIRECTORY:Int;
	@:native("UV_FS_O_DSYNC")
	public static var FS_O_DSYNC:Int;
	@:native("UV_FS_O_EXCL")
	public static var FS_O_EXCL:Int;
	@:native("UV_FS_O_EXLOCK")
	public static var FS_O_EXLOCK:Int;
	@:native("UV_FS_O_NOATIME")
	public static var FS_O_NOATIME:Int;
	@:native("UV_FS_O_NOCTTY")
	public static var FS_O_NOCTTY:Int;
	@:native("UV_FS_O_NOFOLLOW")
	public static var FS_O_NOFOLLOW:Int;
	@:native("UV_FS_O_NONBLOCK")
	public static var FS_O_NONBLOCK:Int;
	@:native("UV_FS_O_RDONLY")
	public static var FS_O_RDONLY:Int;
	@:native("UV_FS_O_RDWR")
	public static var FS_O_RDWR:Int;
	@:native("UV_FS_O_SYMLINK")
	public static var FS_O_SYMLINK:Int;
	@:native("UV_FS_O_SYNC")
	public static var FS_O_SYNC:Int;
	@:native("UV_FS_O_TRUNC")
	public static var FS_O_TRUNC:Int;
	@:native("UV_FS_O_WRONLY")
	public static var FS_O_WRONLY:Int;
	@:native("UV_FS_O_RANDOM")
	public static var FS_O_RANDOM:Int;
	@:native("UV_FS_O_SHORT_LIVED")
	public static var FS_O_SHORT_LIVED:Int;
	@:native("UV_FS_O_SEQUENTIAL")
	public static var FS_O_SEQUENTIAL:Int;
	@:native("UV_FS_O_TEMPORARY")
	public static var FS_O_TEMPORARY:Int;
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
	@:native("uv_loop_close")
	public static function loop_close(loop:RawPointer<Loop_t>):Int;
	@:native("uv_loop_alive")
	public static function loop_alive(loop:RawConstPointer<Loop_t>):Int;
	@:native("uv_loop_fork")
	public static function loop_fork(loop:RawPointer<Loop_t>):Int;
	@:native("uv_loop_size")
	public static function loop_size():SizeT;
	@:native("uv_run")
	public static function run(loop:RawPointer<Loop_t>, mode:RunMode):Int;
	@:native("uv_stop")
	public static function stop(loop:RawPointer<Loop_t>):Void;
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

	@:native("uv_tcp_init_ex")
	public static function tcp_init_ex(loop:RawPointer<Loop_t>, handle:RawPointer<Tcp_t>, flags:Int):Int;

	@:native("uv_tcp_open")
	public static function tcp_open(handle:RawPointer<Tcp_t>, sock:Int):Int;

	@:native("uv_tcp_bind")
	public static function tcp_bind(handle:RawPointer<Tcp_t>, addr:RawConstPointer<SockAddr_s>, flags:Int):Int;

	@:native("uv_tcp_nodelay")
	public static function tcp_nodelay(handle:RawPointer<Tcp_t>, enable:Int):Int;

	@:native("uv_tcp_simultaneous_accepts")
	public static function tcp_simultaneous_accepts(handle:RawPointer<Tcp_t>, enable:Int):Int;

	@:native("uv_tcp_keepalive")
	public static function tcp_keepalive(handle:RawPointer<Tcp_t>, enable:Int, delay:Int):Int;

	@:native("uv_tcp_connect")
	public static function tcp_connect(req:RawPointer<Connect_t>, handle:RawPointer<Tcp_t>, addr:RawConstPointer<SockAddr_s>,
		cb:Callable<ConnectCallback>):Int;

	@:native("uv_tty_init")
	public static function tty_init(loop:RawPointer<Loop_t>, handle:RawPointer<Tty_t>, fd:Int, readable:Int):Int;
	@:native("uv_tty_set_mode")
	public static function tty_set_mode(handle:RawPointer<Tty_t>, mode:TTyMode):Int;

	@:native("uv_tty_reset_mode")
	public static function tty_reset_mode():Int;

	public static inline function tty_get_winsize(handle:RawPointer<Tty_t>):{width:Int,height:Int} 
	{
		var w = 0;
		var h = 0;
		untyped __cpp__("uv_tty_get_winsize({0}, &{1}, &{2})", handle, w, h);

		return {
			width: w,
			height: h
		};
	}

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
	public static function write(req:RawPointer<Write_t>, handle:RawPointer<Stream_t>, bufs:RawConstPointer<Buf_t>, nbufs:UInt32,
		cb:Callable<WriteCallback>):Int;
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
	@:native("uv_fs_open")
	public static function fs_open(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, path:ConstCharStar, flags:Int, mode:Int, cb:Callable<FsCallback>):Int;
	@:native("uv_fs_close")
	public static function fs_close(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, file:File, cb:Callable<FsCallback>):Int;
	@:native("uv_fs_read")
	public static function fs_read(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, file:File, bufs:RawConstPointer<Buf_t>, nbufs:UInt32, offset:UInt64,
		cb:Callable<FsCallback>):Int;
	@:native("uv_fs_unlink")
	public static function fs_unlink(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, path:ConstCharStar, cb:Callable<FsCallback>):Int;
	@:native("uv_fs_write")
	public static function fs_write(loop:RawPointer<Loop_t>, req:RawPointer<Fs_t>, file:File, bufs:RawConstPointer<Buf_t>, nbufs:UInt32, offset:UInt64,
		cb:Callable<FsCallback>):Int;
	// pipe
	@:native("uv_pipe_init")
	public static function pipe_init(loop:RawPointer<Loop_t>, handle:RawPointer<Pipe_t>, ipc:Int):Int;
	@:native("uv_pipe_open")
	public static function pipe_open(handle:RawPointer<Pipe_t>, file:File):Int;
	// dns
	@:native("uv_getaddrinfo")
	public static function getaddrinfo(loop:RawPointer<Loop_t>, req:RawPointer<GetAddrInfo_t>, getaddrinfo_cb:Callable<GetAddrInfoCallback>,
		node:ConstCharStar, service:ConstCharStar, hints:RawConstPointer<AddrInfo_s>):Int;
	@:native("uv_freeaddrinfo")
	public static function freeaddrinfo(ai:RawPointer<AddrInfo_s>):Void;
	@:native("uv_getnameinfo")
	public static function getnameinfo(loop:RawPointer<Loop_t>, req:RawPointer<GetNameInfo_t>, getnameinfo_cb:Callable<GetNameInfoCallback>,
		addr:RawConstPointer<SockAddr_s>, flags:Int):Int;
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
	// signal
	@:native("uv_signal_init")
	public static function signal_init(loop:RawPointer<Loop_t>, handle:RawPointer<Signal_t>):Int;
	@:native("uv_signal_start")
	public static function signal_start(handle:RawPointer<Signal_t>, cb:Callable<SignalCallback>, signum:Int):Int;
	@:native("uv_signal_start_oneshot")
	public static function signal_start_oneshot(handle:RawPointer<Signal_t>, cb:Callable<SignalCallback>, signum:Int):Int;
	@:native("uv_signal_stop")
	public static function signal_stop(handle:RawPointer<Signal_t>):Int;
	@:native("uv_loadavg")
	public static function loadavg(avg:Array<Float>):Void;
	@:native("uv_process_kill")
	public static function process_kill(handle:RawPointer<Process_t>, signum:Int):Int;
	@:native("uv_spawn")
	public static function spawn(loop:RawPointer<Loop_t>, handle:RawPointer<Process_t>, options:RawPointer<ProcessOptions_t>):Int;
	@:native("uv_process_get_pid")
	public static function process_get_pid(handle:RawPointer<Process_t>):Int;
	@:native("uv_queue_work")
	public static function queue_work(loop:RawPointer<Loop_t>, req:RawPointer<Work_t>, work_cb:Callable<WorkCallback>, after_work_cb:Callable<AfterWorkCallback>):Int;
	@:native("uv_cancel")
	public static function cancel(req:RawPointer<Req_t>):Int;

	@:native("uv_poll_init")
	public static function poll_init(loop:RawPointer<Loop_t>, handle:RawPointer<Poll_t>, fd:Int):Int;
	@:native("uv_poll_start")
	public static function poll_start( handle:RawPointer<Poll_t>, events:PollEvent, cb:Callable<PollCallback>):Int;

	@:native("uv_poll_stop")
	public static function poll_stop( handle:RawPointer<Poll_t>):Int;

	@:native("uv_poll_init_socket")
	public static function poll_init_socket(loop:RawPointer<Loop_t>, handle:RawPointer<Poll_t>, socket:Int):Int;
	@:native("uv_prepare_init")
	public static function prepare_init(loop:RawPointer<Loop_t>, handle:RawPointer<Prepare_t>):Int;

	@:native("uv_prepare_start")
	public static function prepare_start(prepare:RawPointer<Prepare_t>, cb:Callable<PrepareCallback>):Int;

	@:native("uv_prepare_stop")
	public static function prepare_stop( handle:RawPointer<Prepare_t>):Int;


	@:native("uv_check_init")
	public static function check_init(loop:RawPointer<Loop_t>, handle:RawPointer<Check_t>):Int;

	@:native("uv_check_start")
	public static function check_start(prepare:RawPointer<Check_t>, cb:Callable<CheckCallback>):Int;

	@:native("uv_check_stop")
	public static function check_stop( handle:RawPointer<Check_t>):Int;

	@:native("uv_idle_init")
	public static function idle_init(loop:RawPointer<Loop_t>, handle:RawPointer<Idle_t>):Int;

	@:native("uv_idle_start")
	public static function idle_start(prepare:RawPointer<Idle_t>, cb:Callable<IdleCallback>):Int;

	@:native("uv_idle_stop")
	public static function idle_stop( handle:RawPointer<Idle_t>):Int;

	@:native("uv_async_init")
	public static function async_init(loop:RawPointer<Loop_t>, prepare:RawPointer<Async_t>, cb:Callable<AsyncCallback>):Int;

	@:native("uv_async_send")
	public static function async_stop( handle:RawPointer<Async_t>):Int;

	@:native("uv_upd_init")
	public static function udp_init(loop:RawPointer<Loop_t>, handle:RawPointer<Udp_t>):Int;

	@:native("uv_udp_init_ex")
	public static function udp_init_ex(loop:RawPointer<Loop_t>, handle:RawPointer<Udp_t>, flags:Int):Int;

	@:native("uv_udp_open")
	public static function udp_open(handle:RawPointer<Udp_t>, sock:Int):Int;

	@:native("uv_udp_bind")
	public static function udp_bind(handle:RawPointer<Udp_t>, addr:RawConstPointer<SockAddr_s>, flags:Int):Int;


	public static inline function udp_getsockname(handle:RawConstPointer<Udp_t>, name:RawConstPointer<SockAddr_s>):Int {
		var namelen:Null<Int> = null;
		untyped __cpp__("uv_udp_getsockname({0}, {1}, &{2})", handle, name, namelen);
		return namelen;
	}
	@:native("uv_udp_set_membership")
	public static function udp_set_membership(handle:RawPointer<Udp_t>, multicast_addr:String, interface_addr:String, membership:UvMembership):Int;

	@:native("uv_udp_set_multicast_loop")
	public static function udp_set_multicast_loop(handle:RawPointer<Udp_t>, on:Int):Int;

	@:native("uv_udp_set_multicast_ttl")
	public static function udp_set_multicast_ttl(handle:RawPointer<Udp_t>, ttl:Int):Int;

	@:native("uv_udp_set_multicast_interface")
	public static function udp_set_multicast_interface(handle:RawPointer<Udp_t>, interface_addr:String):Int;

	@:native("uv_udp_set_broadcast")
	public static function udp_set_broadcast(handle:RawPointer<Udp_t>, on:Int):Int;

	@:native("uv_udp_set_ttl")
	public static function udp_set_ttl(handle:RawPointer<Udp_t>, ttl:Int):Int;

	@:native("uv_udp_send")
	public static function udp_send(req:RawPointer<UdpSend_t>,handle:RawPointer<Udp_t>, bufs:Array<Buf_t>, nbufs:Int, addr:RawConstPointer<SockAddr_s>, send_cb:Callable<UdpSendCallback>):Int;

	@:native("uv_udp_try_send")
	public static function udp_try_send(handle:RawPointer<Udp_t>, bufs:Array<Buf_t>, nbufs:Int, addr:RawConstPointer<SockAddr_s>, send_cb:Callable<UdpSendCallback>):Int;

	@:native("uv_udp_recv_start")
	public static function udp_recv_start(handle:RawPointer<Udp_t>, alloc_cb:Callable<AllocCallback>,recv_cb:Callable<UdpSendCallback>):Int;

	@:native("uv_udp_recv_stop")
	public static function udp_recv_stop(handle:RawPointer<Udp_t>):Int;

	@:native("uv_udp_get_send_queue_size")
	public static function udp_get_send_queue_size(handle:RawPointer<Udp_t>):SizeT;
	@:native("uv_udp_get_send_queue_count")
	public static function udp_get_send_queue_count(handle:RawPointer<Udp_t>):SizeT;
}

// enums
@:include('linc_uv.h')
@:native("uv_membership")
@:scalar @:coreType @:notNull
extern abstract UvMembership from(Int) to(Int) {}

@:include('linc_uv.h')
@:native("uv_run_mode")
@:scalar @:coreType @:notNull
extern abstract RunMode from(Int) to(Int) {}

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
@:native('uv_tty_t')
@:unreflective
@:structAccess
extern class Tty_t extends Stream_t {}

@:include('linc_uv.h')
@:native('uv_pipe_t')
@:unreflective
@:structAccess
extern class Pipe_t extends Stream_t {}

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
@:native('uv_signal_t')
@:unreflective
@:structAccess
extern class Signal_t extends Handle_t {}

@:include('linc_uv.h')
@:native('uv_buf_t')
@:unreflective
@:structAccess
extern class Buf_t {
	var base:CastCharStar;
	var len:Int;
}


@:include('linc_uv.h')
@:native('uv_udp_t')
@:unreflective
@:structAccess
extern class Udp_t extends Handle_t {
	var send_queue_size:SizeT;
	var send_queue_count:SizeT;
}

@:include('linc_uv.h')
@:native('uv_udp_send_t')
@:unreflective
@:structAccess
extern class UdpSend_t extends Req_t {
	var handle:RawPointer<Udp_t>;
	var cb:UdpSendCallback;
}

// Process 
@:include('linc_uv.h')
@:native('uv_process_t')
@:unreflective
@:structAccess
extern class Process_t extends Handle_t {
	var pid:Int;
	var exit_cb:ExitCallback;
}

@:include('linc_uv.h')
@:native('uv_process_options_t')
@:unreflective
@:structAccess
extern class ProcessOptions_t {
	var exit_cb:ExitCallback;
	var file:String;
	var args:Array<String>;
	var env:Array<String>;
	var cwd:String;
	var flags:ProcessFlags;
	var stdio_count:Int;
	var stdio:StdioContainer_t;
	var uid:Int;
	var gid:Int;
}

@:include('linc_uv.h')
@:native('uv_stdio_container_t')
@:unreflective
@:structAccess
extern class StdioContainer_t {
	var flags:StdioFlags;
}

enum abstract StdioFlags(Int) from Int to Int {
	var UV_IGNORE         = 0x00;
	var UV_CREATE_PIPE    = 0x01;
	var UV_INHERIT_FD     = 0x02;
	var UV_INHERIT_STREAM = 0x04;
  
	/*
	 * When UV_CREATE_PIPE is specified, UV_READABLE_PIPE and UV_WRITABLE_PIPE
	 * determine the direction of flow, from the child process' perspective. Both
	 * flags may be specified to create a duplex data stream.
	 */
	 var UV_READABLE_PIPE  = 0x10;
	 var UV_WRITABLE_PIPE  = 0x20;
  
	/*
	 * Open the child pipe handle in overlapped mode on Windows.
	 * On Unix it is silently ignored.
	 */
	 var UV_OVERLAPPED_PIPE = 0x40;
}

// req

@:include('linc_uv.h')
@:native('uv_shutdown_t')
@:unreflective
@:structAccess
extern class Shutdown_t extends Req_t {
	var handle:RawPointer<Stream_t>;
}

@:include('linc_uv.h')
@:native('uv_connect_t')
@:unreflective
@:structAccess
extern class Connect_t extends Req_t {
	var handle:RawPointer<Stream_t>;
}

@:include('linc_uv.h')
@:native('uv_write_t')
@:unreflective
@:structAccess
extern class Write_t extends Req_t {
	var handle:RawPointer<Stream_t>;
}

@:include('linc_uv.h')
@:native('uv_getaddrinfo_t')
@:unreflective
@:structAccess
extern class GetAddrInfo_t extends Req_t {}

@:include('linc_uv.h')
@:native('uv_getnameinfo_t')
@:unreflective
@:structAccess
extern class GetNameInfo_t extends Req_t {}

@:include('linc_uv.h')
@:native('uv_fs_t')
@:unreflective
@:structAccess
extern class Fs_t extends Req_t {
	var result:Int;
}
@:include('linc_uv.h')
@:native('uv_work_t')
@:unreflective
@:structAccess
extern class Work_t extends  Req_t {
	var loop:Pointer<Loop_t>;
	var work_cb:WorkCallback;
	var after_work_cb:AfterWorkCallback;
}

// misc

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

@:include('linc_uv.h')
@:native('uv_poll_t')
@:unreflective
@:structAccess
extern class Poll_t {
	var poll_cb:PollCallback;
}

@:include('linc_uv.h')
@:native('uv_prepare_t')
@:unreflective
@:structAccess
extern class Prepare_t {}

@:include('linc_uv.h')
@:native('uv_check_t')
@:unreflective
@:structAccess
extern class Check_t {}

@:include('linc_uv.h')
@:native('uv_idle_t')
@:unreflective
@:structAccess
extern class Idle_t {}

@:include('linc_uv.h')
@:native('uv_async_t')
@:unreflective
@:structAccess
extern class Async_t {}

@:include('linc_uv.h')
@:native("uv_file")
@:scalar @:coreType @:notNull
extern abstract File from(Int) to(Int) {}

@:include('linc_uv.h')
@:native("ssize_t")
@:scalar @:coreType @:notNull
extern abstract SSizeT from(Int) to(Int) {}

@:include('linc_uv.h')
@:native("long")
@:scalar @:coreType @:notNull
extern abstract Long from(Int) to(Int) {}


@:include('linc_uv.h')
@:native("uv_tty_mode_t")
@:scalar @:coreType @:notNull
extern abstract TTyMode from(Int) to(Int) {}


enum abstract ProcessFlags(Int) from Int to Int {
  /*
   * Set the child process' user id. The user id is supplied in the `uid` field
   * of the options struct. This does not work on windows; setting this flag
   * will cause uv_spawn() to fail.
   */
   var UV_PROCESS_SETUID = (1 << 0);
   /*
	* Set the child process' group id. The user id is supplied in the `gid`
	* field of the options struct. This does not work on windows; setting this
	* flag will cause uv_spawn() to fail.
	*/
	var UV_PROCESS_SETGID = (1 << 1);
   /*
	* Do not wrap any arguments in quotes, or perform any other escaping, when
	* converting the argument list into a command line string. This option is
	* only meaningful on Windows systems. On Unix it is silently ignored.
	*/
	var UV_PROCESS_WINDOWS_VERBATIM_ARGUMENTS = (1 << 2);
   /*
	* Spawn the child process in a detached state - this will make it a process
	* group leader, and will effectively enable the child to keep running after
	* the parent exits.  Note that the child process will still keep the
	* parent's event loop alive unless the parent process calls uv_unref() on
	* the child's process handle.
	*/
	var UV_PROCESS_DETACHED = (1 << 3);
   /*
	* Hide the subprocess window that would normally be created. This option is
	* only meaningful on Windows systems. On Unix it is silently ignored.
	*/
	var UV_PROCESS_WINDOWS_HIDE = (1 << 4);
   /*
	* Hide the subprocess console window that would normally be created. This 
	* option is only meaningful on Windows systems. On Unix it is silently
	* ignored.
	*/
	var UV_PROCESS_WINDOWS_HIDE_CONSOLE = (1 << 5);
   /*
	* Hide the subprocess GUI window that would normally be created. This 
	* option is only meaningful on Windows systems. On Unix it is silently
	* ignored.
	*/
	var UV_PROCESS_WINDOWS_HIDE_GUI = (1 << 6);
}

enum abstract SIG(Int) from (Int) to (Int) {
	var SIGHUP = 1; /* hangup */
	var SIGINT; /* interrupt */
	var SIGQUIT; /* quit */
	var SIGILL; /* illegal instruction (not reset when caught) */
	var SIGTRAP; /* trace trap (not reset when caught) */
	var SIGABRT; /* abort() */
	#if !mac var SIGPOLL; /* pollable event ([XSR] generated, not supported) */
	#elseif mac /* (!_POSIX_C_SOURCE || _DARWIN_C_SOURCE) */ var SIGIOT = SIGABRT; /* compatibility */
	var SIGEMT; /* EMT instruction */
	#end /* (!_POSIX_C_SOURCE || _DARWIN_C_SOURCE) */ var SIGFPE; /* floating point exception */
	var SIGKILL; /* kill (cannot be caught or ignored) */
	var SIGBUS; /* bus error */
	var SIGSEGV; /* segmentation violation */
	var SIGSYS; /* bad argument to system call */
	var SIGPIPE; /* write on a pipe with no one to read it */
	var SIGALRM; /* alarm clock */
	var SIGTERM; /* software termination signal from kill */
	var SIGURG; /* urgent condition on IO channel */
	var SIGSTOP; /* sendable stop signal not from tty */
	var SIGTSTP; /* stop signal from tty */
	var SIGCONT; /* continue a stopped process */
	var SIGCHLD; /* to parent on child stop or exit */
	var SIGTTIN; /* to readers pgrp upon background tty read */
	var SIGTTOU; /* like TTIN for output if (tp->t_local&LTOSTOP) */
	var SIGIO; /* input/output possible signal */
	var SIGXCPU; /* exceeded CPU time limit */
	var SIGXFSZ; /* exceeded file size limit */
	var SIGVTALRM; /* virtual time alarm */
	var SIGPROF; /* profiling time alarm */
	var SIGWINCH; /* window size changes */
	var SIGINFO; /* information request */
	var SIGUSR1; /* user defined signal 1 */
	var SIGUSR2; /* user defined signal 2 */
}

enum abstract PollEvent(Int) from Int to Int {
	var UV_READABLE = 1;
	var UV_WRITABLE = 2;
	var UV_DISCONNECT = 4;
	var UV_PRIORITIZED = 8;
}


enum abstract UDPFlags(Int) from Int to Int {
	  /* Disables dual stack mode. */
	  var UV_UDP_IPV6ONLY = 1;
	  /*
	   * Indicates message was truncated because read buffer was too small. The
	   * remainder was discarded by the OS. Used in uv_udp_recv_cb.
	   */
	  var UV_UDP_PARTIAL = 2;
	  /*
	   * Indicates if SO_REUSEADDR will be set when binding the handle.
	   * This sets the SO_REUSEPORT socket flag on the BSDs and OS X. On other
	   * Unix platforms, it sets the SO_REUSEADDR flag.  What that means is that
	   * multiple threads or processes can bind to the same address without error
	   * (provided they all set the flag) but only the last one to bind will receive
	   * any traffic, in effect "stealing" the port from the previous listener.
	   */
	  var UV_UDP_REUSEADDR = 4;
}

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
typedef FsCallback = RawPointer<Fs_t>->Void;
typedef SignalCallback = RawPointer<Signal_t>->Int->Void;
typedef ExitCallback = (handle:RawPointer<Process_t>, exit_status:haxe.Int64, term_signal:Int)->Void;
typedef WorkCallback = (req:RawPointer<Work_t>)->Void;
typedef AfterWorkCallback = (req:RawPointer<Work_t>, status:Int)->Void;
typedef PollCallback = (handle:RawPointer<Poll_t>, status:haxe.Int64, events:Int)->Void;
typedef PrepareCallback = (handle:RawPointer<Prepare_t>)->Void;
typedef CheckCallback = (handle:RawPointer<Check_t>)->Void;
typedef IdleCallback = (handle:RawPointer<Idle_t>)->Void;
typedef AsyncCallback = (handle:RawPointer<Async_t>)->Void;
typedef UdpSendCallback = (req:RawPointer<UdpSend_t>, status:Int)->Void;
typedef UdpRecvCallback = (handle:RawPointer<Udp_t>, nread:SizeT, buf:RawConstPointer<Buf_t>, addr:RawConstPointer<SockAddr_s>, flags:Int)->Void;