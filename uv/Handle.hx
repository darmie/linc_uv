package uv;

import cpp.Callable;
import cpp.Void;
import uv.Loop.Loop_t;
import uv.Uv;

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
extern class Handle 
{
	@:native("uv_handle_size")
	public static function size (type:UVHandleType):Int;
	
	@:native("uv_is_active")
	public static function is_active(handle:Handle_t):Int;
	
	@:native("uv_close")
	public static function close(handle:Handle_t, close_cb:Callable < Handle_t->Void > ):Void;
	
	@:native('uv_walk')
	public static function walk(loop:Loop_t, walk_cb:Callable<Handle_t->Dynamic>):Int;
	
}


@:native('::cpp::Reference<uv_handle_t>')
@:include('linc_uv.h')
extern class Handle_t extends Handle {}