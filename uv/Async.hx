package uv;

/**
 * ...
 * @author Darmie Akinlaja
 */

import cpp.Callable;
import uv.Handle.Handle_t;
import uv.Loop.Loop_t;

@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end

extern class Async extends Handle_t
{
	@:native('uv_async_init')
	public function init(loop:Loop_t, async:Async_t, async_cb:Callable<Async_t->Void>):Int;	
	
	@:native('uv_async_send')
	public function send(async:Async_t):Int;
	
}

@:native('::cpp::Reference<uv_async_t>')
@:include('linc_uv.h')
extern class Async_t extends Async {}