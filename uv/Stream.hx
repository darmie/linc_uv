package uv;
import cpp.Callable;
import uv.Handle.Handle_t;

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

extern class Stream extends Handle_t
{
	@:native("uv_listen")
	public static function listen(stream:Stream_t, backlog:Int, cb:Callable < Stream_t->Int > ):Int;
	
	@:native("uv_accept")
	public static function accept(server:Stream_t, server:Stream_t):Int;
	
	@:native("uv_stop")
	public static function stop(stream:Stream_t):Int;
		
	@:native("uv_read_start")
	public static function read_start(stream:Stream_t, alloc_cb:Callable<Handle_t->Int->Buffer>, read_cb:Callable<Stream_t->Int->Buffer>):Int;
}


@:native('::cpp::Reference<uv_stream_t>')
@:include('linc_uv.h')
extern class Stream_t extends Stream{}