package uv;

/**
 * ...
 * @author Darmie Akinlaja
 */

import cpp.Pointer;
import uv.Handle.Handle_t;
 
@:keep
@:include('linc_uv.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('uv'))
#end

extern class Check extends Handle_t
{
	
	
	@:native('uv_check_init')
	public function init(loop:Pointer<Loop.Loop_t>, check:cpp.Callable<Pointer<Check_t>->Void>):Int;
	
	@:native('uv_check_start')
	public function start(check:Pointer<Check_t>, cb:cpp.Callable<Pointer<Check_t>->Void>>):Int;
	
	@:native('uv_check_stop')
	public function start(check:Pointer<Check_t>):Int;	
	
}

@:native('::cpp::Reference<uv_check_t>')
@:include('linc_uv.h')
extern class Check_t extends Check {}