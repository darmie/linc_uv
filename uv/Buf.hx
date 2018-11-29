package uv;

import uv.Uv;
import cpp.*;

@:dce @:forward
abstract Buf(Pointer<Buf_t>) from Pointer<Buf_t> to Pointer<Buf_t> {
	public inline function new(size:Int) {
		this = Stdlib.malloc(Stdlib.sizeof(Buf_t));
		this.value.base = untyped __cpp__('(char*){0}', Stdlib.nativeMalloc(size));
		this.value.len = size;
	}
	public inline function destroy() {
		Stdlib.nativeFree(cast this.value.base);
		Stdlib.free(this);
	}
	@:to public inline function asRaw():RawPointer<Buf_t> return this.raw;
	
	public inline function copyFrom(src:RawConstPointer<Buf_t>) Stdlib.nativeMemcpy(cast this.value.base, cast src[0].base, this.value.len);
	public static inline function unmanaged(b:RawConstPointer<Buf_t>):UnmanagedBuf return b;
}

@:dce
abstract UnmanagedBuf(RawConstPointer<Buf_t>) from RawConstPointer<Buf_t> to RawConstPointer<Buf_t> {
	public inline function free() Stdlib.nativeFree(cast this[0].base);
}