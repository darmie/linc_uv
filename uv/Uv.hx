package uv;
import cpp.Callable;
@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end

extern class Uv {
/*
 * This flag can be used with uv_fs_symlink() on Windows to specify whether
 * path argument points to a directory.
 */
	@:native("UV_FS_SYMLINK_DIR")
	public static var FS_SYMLINK_DIR;
/*
 * This flag can be used with uv_fs_symlink() on Windows to specify whether
 * the symlink is to be created using junction points.
 */
	@:native("UV_FS_SYMLINK_JUNCTION")
	public static var FS_SYMLINK_JUNCTION;
	
	@:native("uv_strerror")
	public static function strerror(err:Int):String;
	
	@:native("uv_err_name")
	public static function err_name(err:Int):String;
	
	@:native("uv_translate_sys_error")
	public static function translate_sys_error(sys_errno:Int):Int;

} //Uv

@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end
extern class Shutdown{
		
	@:native('uv_shutdown')
	public static function shutdown(req:Shutdown_t, handle:Stream, cb:Callable < Shutdown_t->Int->Void >):Int;
} 
//typedef void (*uv_shutdown_cb)(uv_shutdown_t* req, int status);

@:native('::cpp::Reference<uv_shutdown_t>')
@:include('linc_uv.h')
extern class Shutdown_t extends Shutdown {}

@:include("linc_uv.h")
@:unreflective
@:native("cpp::Struct<uv_fs_event_flags>")
extern class EventFlags { }


@:enum
abstract UVFsEventFlags(EventFlags)
from EventFlags to EventFlags {
	
	inline public function new(i:EventFlags) { this = i; }

	@:to(EventFlags)
	@:unreflective
	inline public function toNative() return untyped __cpp__("((UVFsEventFlags_Impl_)({0}))", this);

	@:from(EventFlags)
	@:unreflective
	inline static public function fromNative(value:EventFlags) return new UVFsEventFlags(untyped value);
	
  /*
   * By default, if the fs event watcher is given a directory name, we will
   * watch for all events in that directory. This flags overrides this behavior
   * and makes fs_event report only changes to the directory entry itself. This
   * flag does not affect individual files watched.
   * This flag is currently not implemented yet on any backend.
   */	
    public static var UV_FS_EVENT_WATCH_ENTRY      = new UVFsEventFlags(untyped __cpp__("UV_FS_EVENT_WATCH_ENTRY"));
	
 /*
   * By default uv_fs_event will try to use a kernel interface such as inotify
   * or kqueue to detect events. This may not work on remote filesystems such
   * as NFS mounts. This flag makes fs_event fall back to calling stat() on a
   * regular interval.
   * This flag is currently not implemented yet on any backend.
   */	
    public static var UV_FS_EVENT_STAT             = new UVFsEventFlags(untyped __cpp__("UV_FS_EVENT_STAT"));

  /*
   * By default, event watcher, when watching directory, is not registering
   * (is ignoring) changes in it's subdirectories.
   * This flag will override this behaviour on platforms that support it.
   */	
    public static var UV_FS_EVENT_RECURSIVE        = new UVFsEventFlags(untyped __cpp__("UV_FS_EVENT_RECURSIVE"));  
} //UVFsEventFlags



@:include("linc_uv.h")
@:unreflective
@:native("cpp::Struct<uv_handle_type>")
extern class HandleType { }

@:enum
abstract UVHandleType(HandleType)
from HandleType to HandleType {
	
	inline public function new(i:HandleType) { this = i; }

	@:to(HandleType)
	@:unreflective
	inline public function toNative() return untyped __cpp__("((UVHandleType_Impl_)({0}))", this);

	@:from(HandleType)
	@:unreflective
	inline static public function fromNative(value:HandleType) return new UVHandleType(untyped value);
	
	
	public static var UV_UNKNOWN_HANDLE = new UVHandleType(untyped __cpp__("UV_UNKNOWN_HANDLE"));
	public static var UV_FILE = new UVHandleType(untyped __cpp__("UV_FILE"));
	public static var UV_HANDLE_TYPE_MAX = new UVHandleType(untyped __cpp__("UV_HANDLE_TYPE_MAX"));
}


@:include("linc_uv.h")
@:unreflective
@:native("cpp::Struct<uv_req_type>")
extern class ReqType { }


@:enum
abstract UVReqType(ReqType)
from ReqType to ReqType {
	
	inline public function new(i:ReqType) { this = i; }

	@:to(ReqType)
	@:unreflective
	inline public function toNative() return untyped __cpp__("((UVReqType_Impl_)({0}))", this);

	@:from(ReqType)
	@:unreflective
	inline static public function fromNative(value:ReqType) return new UVReqType(untyped value);	
	public static var UV_UNKNOWN_REQ = new UVHandleType(untyped __cpp__("UV_UNKNOWN_REQ"));
	public static var UV_REQ_TYPE_PRIVATE = new UVHandleType(untyped __cpp__("UV_REQ_TYPE_PRIVATE"));
	public static var UV_REQ_TYPE_MAX = new UVHandleType(untyped __cpp__("UV_REQ_TYPE_MAX"));
}


@:include("linc_uv.h")
@:unreflective
@:native("cpp::Struct<uv_dirent_type_t>")
extern class DirentType { }

@:enum
abstract UVDirentType(DirentType)
from DirentType to DirentType{
	
	inline public function new(i:DirentType) { this = i; }

	@:to(DirentType)
	@:unreflective
	inline public function toNative() return untyped __cpp__("((UVDirentType_Impl_)({0}))", this);

	@:from(DirentType)
	@:unreflective
	inline static public function fromNative(value:DirentType) return new UVDirentType(untyped value);
	
  public static var UV_DIRENT_UNKNOWN = new UVFsType(untyped __cpp__("UV_DIRENT_UNKNOWN"));
  public static var UV_DIRENT_FILE = new UVFsType(untyped __cpp__("UV_DIRENT_FILE"));
  public static var UV_DIRENT_DIR = new UVFsType(untyped __cpp__("UV_DIRENT_DIR"));
  public static var UV_DIRENT_LINK = new UVFsType(untyped __cpp__("UV_DIRENT_LINK"));
  public static var UV_DIRENT_FIFO = new UVFsType(untyped __cpp__("UV_DIRENT_FIFO"));
  public static var UV_DIRENT_SOCKET = new UVFsType(untyped __cpp__("UV_DIRENT_SOCKET"));
  public static var UV_DIRENT_CHAR = new UVFsType(untyped __cpp__("UV_DIRENT_CHAR"));
  public static var UV_DIRENT_BLOCK = new UVFsType(untyped __cpp__("UV_DIRENT_BLOCK"));
	
}


@:include("linc_uv.h")
@:unreflective
@:native("cpp::Struct<uv_fs_event>")
extern class FsEvent { }
@:enum
abstract UVFsEvent(FsEvent)
from FsEvent to FsEvent{
	inline public function new(i:FsEvent) { this = i; }

	@:to(FsEvent)
	@:unreflective
	inline public function toNative() return untyped __cpp__("((UVFsEvent_Impl_)({0}))", this);

	@:from(FsEvent)
	@:unreflective
	inline static public function fromNative(value:FsEvent) return new UVFsEvent(untyped value);	
	
	
	public static var UV_RENAME = new UVFsEvent(untyped __cpp__("UV_RENAME"));
	public static var UV_CHANGE = new UVFsEvent(untyped __cpp__("UV_CHANGE"));
}


@:include("linc_uv.h")
@:unreflective
@:native("cpp::Struct<uv_fs_type>")
extern class FsType { }

@:enum
abstract UVFsType(FsType)
from FsType to FsType{
	
	inline public function new(i:FsType) { this = i; }

	@:to(FsType)
	@:unreflective
	inline public function toNative() return untyped __cpp__("((UVFsType_Impl_)({0}))", this);

	@:from(FsType)
	@:unreflective
	inline static public function fromNative(value:FsType) return new UVFsType(untyped value);	
	
	
	public static var UV_FS_UNKNOWN = new UVFsType(untyped __cpp__("UV_FS_UNKNOWN"));
	public static var  UV_FS_CUSTOM = new UVFsType(untyped __cpp__("UV_FS_CUSTOM"));
	public static var  UV_FS_OPEN = new UVFsType(untyped __cpp__("UV_FS_OPEN"));
	public static var  UV_FS_CLOSE = new UVFsType(untyped __cpp__("UV_FS_CLOSE"));
	public static var  UV_FS_READ = new UVFsType(untyped __cpp__("UV_FS_READ"));
	public static var  UV_FS_WRITE = new UVFsType(untyped __cpp__("UV_FS_WRITE"));
	public static var  UV_FS_SENDFILE = new UVFsType(untyped __cpp__("UV_FS_SENDFILE"));
	public static var  UV_FS_STAT = new UVFsType(untyped __cpp__("UV_FS_STAT"));
	public static var  UV_FS_LSTAT = new UVFsType(untyped __cpp__("UV_FS_LSTAT"));
	public static var  UV_FS_FSTAT = new UVFsType(untyped __cpp__("UV_FS_FSTAT"));
	public static var  UV_FS_FTRUNCATE = new UVFsType(untyped __cpp__("UV_FS_FTRUNCATE"));
	public static var  UV_FS_UTIME = new UVFsType(untyped __cpp__("UV_FS_UTIME"));
	public static var  UV_FS_FUTIME = new UVFsType(untyped __cpp__("UV_FS_FUTIME"));
	public static var  UV_FS_ACCESS = new UVFsType(untyped __cpp__("UV_FS_ACCESS"));
	public static var  UV_FS_CHMOD = new UVFsType(untyped __cpp__("UV_FS_CHMOD"));
	public static var  UV_FS_FCHMOD  = new UVFsType(untyped __cpp__("UV_FS_FCHMOD"));
	public static var  UV_FS_FSYNC  = new UVFsType(untyped __cpp__("UV_FS_FSYNC"));
	public static var  UV_FS_FDATASYNC = new UVFsType(untyped __cpp__("UV_FS_FDATASYNC"));
	public static var  UV_FS_UNLINK = new UVFsType(untyped __cpp__("UV_FS_UNLINK"));
	public static var  UV_FS_RMDIR = new UVFsType(untyped __cpp__("UV_FS_RMDIR"));
	public static var  UV_FS_MKDIR = new UVFsType(untyped __cpp__("UV_FS_MKDIR"));
	public static var  UV_FS_MKDTEMP = new UVFsType(untyped __cpp__("UV_FS_MKDTEMP"));
	public static var  UV_FS_RENAME = new UVFsType(untyped __cpp__("UV_FS_RENAME"));
	public static var  UV_FS_SCANDIR = new UVFsType(untyped __cpp__("UV_FS_SCANDIR"));
	public static var  UV_FS_LINK = new UVFsType(untyped __cpp__("UV_FS_LINK"));
	public static var  UV_FS_SYMLINK = new UVFsType(untyped __cpp__("UV_FS_SYMLINK"));
	public static var  UV_FS_READLINK = new UVFsType(untyped __cpp__("UV_FS_READLINK"));
	public static var  UV_FS_CHOWN = new UVFsType(untyped __cpp__("UV_FS_CHOWN"));
	public static var  UV_FS_FCHOWN = new UVFsType(untyped __cpp__("UV_FS_FCHOWN"));
	public static var  UV_FS_REALPATH = new UVFsType(untyped __cpp__("UV_FS_REALPATH"));
} 

@:native('::cpp::Reference<uv_dirent_t>')
@:include('linc_uv.h')
private extern class Uv_Dirent_t {}



@:native("::cpp::Reference<uv_gid_t>")
extern class Uv_gid_t {}


@:native("::cpp::Reference<uv_uid_t>")
extern class Uv_uid_t {	}

@:native('::cpp::Reference<int64_t>')
@:include('linc_uv.h')
extern class Int64_t{}


@:include("linc_uv.h")
@:unreflective
@:native("cpp::Struct<uv_run_mode>")
extern class RunMode { }

abstract UVRunMode(RunMode) from RunMode to RunMode
{
	inline public function new(i:RunMode) { this = i; }

	@:to(RunMode)
	@:unreflective
	inline public function toNative() return untyped __cpp__("((UVRunMode_Impl_)({0}))", this);

	@:from(RunMode)
	@:unreflective
	inline static public function fromNative(value:RunMode) return new UVRunMode(untyped value);

	public static var UV_RUN_DEFAULT(default, null) = new UVRunMode(untyped __cpp__("UV_RUN_DEFAULT"));
	public static var UV_RUN_ONCE(default, null) = new UVRunMode(untyped __cpp__("UV_RUN_ONCE"));
	public static var UV_RUN_NOWAIT(default, null) = new UVRunMode(untyped __cpp__("UV_RUN_NOWAIT"));
}



@:native('::cpp::Reference<uv_req_t>')
@:include('linc_uv.h')
extern class Req_t{}


@:include("linc_uv.h")
@:unreflective
@:native("cpp::Struct<uv_poll_event>")
extern class PollEvent { }

abstract Uv_poll_event(PollEvent) from PollEvent to PollEvent
{
	inline public function new(i:PollEvent) { this = i; }

	@:to(PollEvent)
	@:unreflective
	inline public function toNative() return untyped __cpp__("((Uv_poll_event_Impl_)({0}))", this);

	@:from(PollEvent)
	@:unreflective
	inline static public function fromNative(value:PollEvent) return new Uv_poll_event(untyped value);

	public static var UV_READABLE(default, null) = new Uv_poll_event(untyped __cpp__("UV_READABLE"));
	public static var UV_WRITABLE(default, null) = new Uv_poll_event(untyped __cpp__("UV_WRITABLE"));
	public static var UV_DISCONNECT(default, null) = new Uv_poll_event(untyped __cpp__("UV_DISCONNECT"));
}