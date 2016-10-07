package uv;
import cpp.Callable;
import uv.Handle.Handle_t;
import uv.Loop.Loop_t;

/**
 * ...
 * @author Darmie Akinlaja
 */

 
extern class Poll extends Handle_t
{

	@:native("uv_poll_init")
	public static function (loop:Loop_t, handle:Poll_t, fd:Int):Int;
	
	//Todo:: @:native("uv_poll_init_socket")
	
	@:native("uv_poll_start")
	public static function (handle:Poll_t, events:Int, cb:Callable < Poll_t->Int->Int > ):Int;
	
	@:native("uv_poll_stop")
	public static function(handle:Poll_t):Int;
	
}


@:native('::cpp::Reference<uv_poll_t>')
@:include('linc_uv.h')
extern class Poll_t extends Poll{}