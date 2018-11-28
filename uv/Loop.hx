package uv;

import uv.Uv;
import cpp.*;

@:unreflective
class Loop extends Finalizable {
	var handle:LoopHandle;
	
	public function new() {
		super();
		handle = cast Stdlib.malloc(Stdlib.sizeof(Loop_t));
		Uv.loop_init(handle);
	}
	
	public inline function run(mode) {
		return Uv.run(handle, mode);
	}
	
	public inline function close() {
		Uv.loop_close(handle);
	}
	
	override function finalize() {
		Stdlib.free((cast handle:Pointer<Loop_t>));
		handle = null;
	}
}
