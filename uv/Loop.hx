package uv;
import cpp.Callable;
import cpp.UInt16;
import cpp.UInt64;
import cpp.Void;
import uv.Handle.Handle_t;
import uv.Uv.UVRunMode;


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

extern class Loop extends Handle_t
{
	
	@:native('uv_default_loop')
	public static function default_loop():Loop_t;

	@:native('uv_loop_init')
	public static function init(loop:Loop_t):Int;
	
	@:native('uv_loop_new')
	public static function create():Loop_t;
	
	@:native('uv_loop_delete')
	public static function delete(loop:Loop_t):Int;
	
	@:native('uv_loop_size')
	public static function size():Int;
	
	@:native('uv_run')
	public static function run(loop:Loop_t, mode:UVRunMode):Int;
	
	@:native('uv_stop')
	public static function stop(loop:Loop_t):Void;
	
	@:native('uv_loop_alive')
	public static function alive(loop:Loop_t):Int;
	
	//@:native('uv_loop_configure')
	//public function configure(loop:Star<Loop_t>, option:Uv_loop_option, ...);
	@:native('uv_update_time')
	public static function update_time(loop:Loop_t):Void;
	
	@:native('uv_now')
	public static function now(loop:Loop_t):UInt64;
	
	@:native('uv_backend_fd')
	public static function backend_fd(loop:Loop_t):Int;
	
	@:native('uv_backend_timeout')
	public static function backend_timeout(loop:Loop_t):Int;
		
}


@:native('::cpp::Reference<uv_loop_t>')
@:include('linc_uv.h')
extern class Loop_t extends Loop {}

/*@:native('::cpp::Reference<uv_handle_t>')
@:include('linc_uv.h')
extern class Handle_t {}*/