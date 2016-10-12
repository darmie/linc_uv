package uv;

@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end

class Uv {

	

} //Uv


@:enum
abstract UVFsEventFlags(Int)
from Int to Int {
  /*
   * By default, if the fs event watcher is given a directory name, we will
   * watch for all events in that directory. This flags overrides this behavior
   * and makes fs_event report only changes to the directory entry itself. This
   * flag does not affect individual files watched.
   * This flag is currently not implemented yet on any backend.
   */	
    var UV_FS_EVENT_WATCH_ENTRY      = 1;
	
 /*
   * By default uv_fs_event will try to use a kernel interface such as inotify
   * or kqueue to detect events. This may not work on remote filesystems such
   * as NFS mounts. This flag makes fs_event fall back to calling stat() on a
   * regular interval.
   * This flag is currently not implemented yet on any backend.
   */	
    var UV_FS_EVENT_STAT             = 2;

  /*
   * By default, event watcher, when watching directory, is not registering
   * (is ignoring) changes in it's subdirectories.
   * This flag will override this behaviour on platforms that support it.
   */	
    var UV_FS_EVENT_RECURSIVE        = 4;  
} //UVFsEventFlags





@:enum
abstract UVHandleType(Int)
from Int to Int {
	var UV_UNKNOWN_HANDLE = 0;
	var UV_FILE = 1;
	var UV_HANDLE_TYPE_MAX = 2;
}


@:enum
abstract UVReqType(Int)
from Int to Int {
	var UV_UNKNOWN_REQ = 0;
	var UV_REQ_TYPE_PRIVATE = 1;
	var UV_REQ_TYPE_MAX = 2;
}

@:enum
abstract UVDirentType(Int)
from Int to Int{

  var UV_DIRENT_UNKNOWN = 0;
  var UV_DIRENT_FILE = 1;
  var UV_DIRENT_DIR = 2;
  var UV_DIRENT_LINK = 3;
  var UV_DIRENT_FIFO = 4;
  var UV_DIRENT_SOCKET = 5;
  var UV_DIRENT_CHAR = 6;
  var UV_DIRENT_BLOCK = 7;
	
}

@:enum
abstract UVFsType(Int)
from Int to Int{
	var  UV_FS_UNKNOWN = -1;
	var  UV_FS_CUSTOM = 0;
	var  UV_FS_OPEN = 1;
	var  UV_FS_CLOSE = 2;
	var  UV_FS_READ = 3;
	var  UV_FS_WRITE = 4;
	var  UV_FS_SENDFILE = 5;
	var  UV_FS_STAT = 6;
	var  UV_FS_LSTAT = 7;
	var  UV_FS_FSTAT = 8;
	var  UV_FS_FTRUNCATE = 9;
	var  UV_FS_UTIME = 10;
	var  UV_FS_FUTIME = 11;
	var  UV_FS_ACCESS = 12;
	var  UV_FS_CHMOD = 13;
	var  UV_FS_FCHMOD  = 14;
	var  UV_FS_FSYNC  = 15;
	var  UV_FS_FDATASYNC = 16;
	var  UV_FS_UNLINK = 17;
	var  UV_FS_RMDIR = 18;
	var  UV_FS_MKDIR = 19;
	var  UV_FS_MKDTEMP = 20;
	var  UV_FS_RENAME = 21;
	var  UV_FS_SCANDIR = 22;
	var  UV_FS_LINK = 23;
	var  UV_FS_SYMLINK = 24;
	var  UV_FS_READLINK = 25;
	var  UV_FS_CHOWN = 26;
	var  UV_FS_FCHOWN = 27;
	var  UV_FS_REALPATH = 28;
} 

@:native('::cpp::Reference<uv_dirent_t>')
@:include('linc_uv.h')
private extern class Dirent_t {}



@:native("::cpp::Reference<uv_gid_t>")
extern class Uv_gid_t {}


@:native("::cpp::Reference<uv_uid_t>")
extern class Uv_uid_t {	}

@:native('::cpp::Reference<int64_t>')
@:include('linc_uv.h')
extern class Int64_t{}

@:enum
abstract UVRunMode(Int)
from Int to Int{
	var UV_RUN_DEFAULT = 0;
	var UV_RUN_ONCE = 1;
	var UV_RUN_NOWAIT = 2;
}


@:native('::cpp::Reference<uv_req_t>')
@:include('linc_uv.h')
extern class Req_t{}


@:enum 
abstract Uv_poll_event(Int)
from Int to Int{
	var UV_READABLE = 1;
	var UV_WRITABLE = 2;
	var UV_DISCONNECT = 4;
}