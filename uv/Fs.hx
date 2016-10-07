package uv;
import cpp.Callable;
import cpp.Char;
import cpp.UInt16;
import cpp.Void;
import uv.Handle.Handle_t;
import uv.Uv.Req_t;
import uv.Uv.UVDirentType;
import uv.Uv.Uv_gid_t;
import uv.Uv.Uv_uid_t;

import uv.Buffer;
import uv.Uv.Int64_t;
import uv.Loop.Loop_t;


/**
 * ...
 * @author Darmie Akinlaja
 */


@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end


//@:native('::cpp::Reference<uv_file>')
typedef Uv_file = Int;


extern class Fs extends Req_t
{
	public static inline var UV_FS_SYMLINK_DIR    	= 0x0001;
	public static inline var UV_FS_SYMLINK_JUNCTION = 0x0002;
	
	@:native('uv_fs_req_cleanup')
	public static function req_cleanup(req:Fs_t):Void;
	
	@:native('uv_fs_close')
	public static function close(loop:Loop_t , req:Fs_t , file:Uv_file, cb:Callable< Fs_t -> Void > ):Int;	
	
	@:native('uv_fs_open')
	public static function open(loop:Loop_t, req:Fs_t, path:String, flag:Int, mode:Int, cb:Callable< Fs_t -> Void >):Int;

	@:native('uv_fs_read')
	public static function read(loop:Loop_t, req:Fs_t, file:Uv_file, bufs:Array< Buffer >, nbufs:UInt16, offset:Int64_t, cb:Callable< Fs_t -> Void >):Int;
	
	@:native('uv_fs_unlink')
	public static function unlink(loop:Loop_t, req:Fs_t , path:String, cb:Callable< Fs_t -> Void > ):Int;

	@:native('uv_fs_write')
	public static function write(loop:Loop_t, req:Fs_t, file:Uv_file, bufs:Array< Buffer >, nbufs:UInt16, offset:Int64_t, cb:Callable< Fs_t -> Void >):Int;	

	@:native('uv_fs_mkdir')
	public static function mkdir(loop:Loop_t, req:Fs_t, path:String, mode:Int, cb:Callable<Fs_t->Void>):Int;		

	@:native('uv_fs_mkdtemp')
	public static function mkdtemp(loop:Loop_t, req:Fs_t, tpl:String, cb:Callable<Fs_t->Void>):Int;		
	
	@:native('uv_fs_rmdir')
	public static function rmdir(loop:Loop_t, req:Fs_t, path:String, cb:Callable < Fs_t->Void > ):Int;	
	
	@:native('uv_fs_scandir')
	public static function scandir(loop:Loop_t, req:Fs_t, path:String, flags:Int, cb:Callable < Fs_t->Void > ):Int;	

	@:native('uv_fs_scandir_next')
	public static function scandir_next(loop:Loop_t, ent:UVDirentType):Int;	
	
	@:native('uv_fs_stat')
	public static function stat(loop:Loop_t, req:Fs_t, path:String, cb:Callable < Fs_t->Void > ):Int;
	
	@:native('uv_fs_fstat')
	public static function fstat(loop:Loop_t, req:Fs_t, file:Uv_file, cb:Callable < Fs_t->Void > ):Int;
	
	
	@:native('uv_fs_rename')
	public static function rename(loop:Loop_t, req:Fs_t, path:String, new_path:String, cb:Callable < Fs_t->Void > ):Int;	

	@:native('uv_fs_fsync')
	public static function fsync(loop:Loop_t, req:Fs_t, file:Uv_file, cb:Callable < Fs_t->Void > ):Int;
	
	@:native('uv_fs_fdatasync')
	public static function fdatasync(loop:Loop_t, req:Fs_t, file:Uv_file, cb:Callable < Fs_t->Void > ):Int;
		
	@:native('uv_fs_ftruncate')
	public static function ftruncate(loop:Loop_t, req:Fs_t, file:Uv_file, offset:Int64_t, cb:Callable < Fs_t->Void > ):Int;
	
	@:native('uv_fs_sendfile')
	public static function sendfile(loop:Loop_t, req:Fs_t, out_fd:Uv_file, in_fd:Uv_file, offset:Int64_t, length:Int, cb:Callable < Fs_t->Void > ):Int;	

	
	@:native('uv_fs_access')
	public static function access(loop:Loop_t, req:Fs_t, path:String, mode:Int, cb:Callable < Fs_t->Void > ):Int;
	
	@:native('uv_fs_chmod')
	public static function chmod(loop:Loop_t, req:Fs_t, path:String, mode:Int, cb:Callable < Fs_t->Void > ):Int;	
	
	@:native('uv_fs_futime')
	public static function futime(loop:Loop_t, req:Fs_t, file:Uv_file, atime:Float, mtime:Float, cb:Callable < Fs_t->Void > ):Int;	

	@:native('uv_fs_utime')
	public static function utime(loop:Loop_t, req:Fs_t, path:String, atime:Float, mtime:Float, cb:Callable < Fs_t->Void > ):Int;	

	
	@:native('uv_fs_lstat')
	public static function lstat(loop:Loop_t, req:Fs_t, path:String, cb:Callable < Fs_t->Void > ):Int;	
	
	@:native('uv_fs_link')
	public static function link(loop:Loop_t, req:Fs_t, path:String, new_path:String, cb:Callable < Fs_t->Void > ):Int;		
	
	@:native('uv_fs_symlink')
	public static function symlink(loop:Loop_t, req:Fs_t, path:String, new_path:String, flags:Int, cb:Callable < Fs_t->Void > ):Int;		
	
	@:native('uv_fs_readlink')
	public static function readlink(loop:Loop_t, req:Fs_t, path:String, cb:Callable < Fs_t->Void > ):Int;
	
	@:native('uv_fs_realpath')
	public static function realpath(loop:Loop_t, req:Fs_t, path:String, cb:Callable < Fs_t->Void > ):Int;	
	
	@:native('uv_fs_fchmod')
	public static function fchmod(loop:Loop_t, req:Fs_t, file:Uv_file, mode:Int, cb:Callable < Fs_t->Void > ):Int;

	@:native('uv_fs_chown')
	public static function chown(loop:Loop_t, req:Fs_t, path:String, uid:Uv_uid_t, gid:Uv_gid_t, cb:Callable < Fs_t->Void > ):Int;
	
	@:native('uv_fs_fchown')
	public static function fchown(loop:Loop_t, req:Fs_t, file:Uv_file, uid:Uv_uid_t, gid:Uv_gid_t, cb:Callable < Fs_t->Void > ):Int;
	
	
}

@:native('::cpp::Reference<uv_fs_t>')
@:include('linc_uv.h')
extern class Fs_t extends Fs {}





