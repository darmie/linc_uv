package uv;

class EventEmitter0 {
	var listeners:Array<Void->Void> = [];
	public function new() {}
	public function add(v):Void->Void {
		listeners.push(v);
		return function() listeners.remove(v);
	}
	public function emit()
		for(cb in listeners) cb();
}

class EventEmitter1<T1> {
	var listeners:Array<T1->Void> = [];
	public function new() {}
	public function add(v):Void->Void {
		listeners.push(v);
		return function() listeners.remove(v);
	}
	public function emit(v:T1)
		for(cb in listeners) cb(v);
}

class EventEmitter2<T1, T2> {
	var listeners:Array<T1->T2->Void> = [];
	public function new() {}
	public function add(v):Void->Void {
		listeners.push(v);
		return function() listeners.remove(v);
	}
	public function emit(v1:T1, v2:T2)
		for(cb in listeners) cb(v1, v2);
}