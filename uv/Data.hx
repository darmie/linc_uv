package uv;

#if !macro
import cpp.*;

abstract Data<T>(RawPointer<cpp.Void>) {
	@:from public inline static function fromPointer<T>(v:Pointer<T>):Data<T> return cast v.raw;
	@:to public inline function toPointer():Pointer<T> return Pointer.fromRaw(this).reinterpret();
	
	@:from public inline static function fromAny<T>(v:T):Data<T> return untyped __cpp__('{0}.GetPtr()', v);
	@:to public inline function toAny():T return untyped __cpp__('(hx::Object*){0}', this);
}
#else
import haxe.macro.Context;

class Data {
	public static function inject() {
		return Context.getBuildFields().concat((macro class {
			public inline function setData<T>(v:Data<T>) this.value.data = cast v;
			public inline function getData<T>():Data<T> return untyped __cpp__('{0}.data', this.value);
		}).fields);
	}
}
#end