package uv;
import cpp.Callable;
import cpp.Char;
import uv.Handle.Handle_t;
import uv.Loop.Loop_t;

@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end

/**
 * ...
 * @author Darmie Akinlaja
 */

extern class Fsevent extends Handle_t
{
	@:native("uv_fs_event_init")
	public static function init(loop:Loop_t, handle:Fsevent_t):Int;
	
	@:native("uv_fs_event_start")
	public static function start(handle:Fsevent_t, cb:Callable< Fsevent_t->String->Int->Int >, path:String, flag:Int):Int;	

	@:native("uv_fs_event_stop")
	public static function stop(handle:Fsevent_t):Int;
	
	@:native("uv_fs_event_getpath")
	public static function getpath(handle:Fsevent_t, buffer:Char, size:Int):Int;		
	
}


@:native('::cpp::Reference<uv_fs_event_t>')
@:include('linc_uv.h')
extern class Fsevent_t extends Fsevent {}