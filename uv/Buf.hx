package uv;

import uv.Uv;
import cpp.*;
using cpp.NativeArray;

@:dce @:forward
abstract Buf(Pointer<Buf_t>) from Pointer<Buf_t> to Pointer<Buf_t> {
	public inline function new() {
		this = Stdlib.malloc(Stdlib.sizeof(Buf_t));
	}
	public inline function alloc(size:Int) {
		this.value.base = untyped __cpp__('(char*){0}', Stdlib.nativeMalloc(size));
		this.value.len = size;
	}
	public inline function destroy() {
		Stdlib.nativeFree(cast this.value.base);
		Stdlib.free(this);
	}
	@:to public inline function asRaw():RawPointer<Buf_t> return this.raw;
	@:from public static inline function fromRaw(r:RawPointer<Buf_t>):Buf return Pointer.fromRaw(r);
	@:from public static inline function fromRawConst(r:RawConstPointer<Buf_t>):Buf return Pointer.fromRaw(cast r);
	
	public inline function copyFromAddress(src:CastCharStar, size:Int) Stdlib.nativeMemcpy(cast this.value.base, cast src, size);
	public inline function copyFrom(src:RawConstPointer<Buf_t>, size:Int) copyFromAddress(src[0].base, size);
	public inline function copyFromBytes(bytes:haxe.io.Bytes, size:Int) {
		var raw = bytes.getData().address(0).constRaw;
		copyFromAddress(untyped __cpp__('(char*){0}', raw), size);
	}
	public inline function copyToAddress(dest:CastCharStar, size:Int) Stdlib.nativeMemcpy(cast dest, cast this.value.base, size);
	public inline function copyToBytes(bytes:haxe.io.Bytes, size:Int) {
		var raw = bytes.getData().address(0).constRaw;
		copyToAddress(untyped __cpp__('(char*){0}', raw), size);
	}
	public static inline function unmanaged(b:RawConstPointer<Buf_t>):UnmanagedBuf return b;
}

// buf created internally by uv (unmanaged by "us")
// we should not free the struct, but only the memory base
@:dce
abstract UnmanagedBuf(RawConstPointer<Buf_t>) from RawConstPointer<Buf_t> to RawConstPointer<Buf_t> {
	public inline function free() Stdlib.nativeFree(cast this[0].base);
	public inline function copyToAddress(dest:CastCharStar, size:Int) Stdlib.nativeMemcpy(cast dest, cast this[0].base, size);
	public inline function copyToBytes(bytes:haxe.io.Bytes, size:Int) {
		var raw = bytes.getData().address(0).constRaw;
		copyToAddress(untyped __cpp__('(char*){0}', raw), size);
	}
}