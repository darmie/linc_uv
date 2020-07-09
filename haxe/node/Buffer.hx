package haxe.node;

import haxe.io.Bytes;
import haxe.io.UInt8Array;

@:forward
abstract Buffer(UInt8Array) from UInt8Array to UInt8Array {
    inline function new(n:Int) this = UInt8Array.fromBytes(Bytes.alloc(n));
    public static function alloc(size:Int):Buffer {
        return new Buffer(size);
    }

    public inline function readUInt8(offset = 0) {
        return this.get(offset);
    }

    public inline function readInt8(offset = 0) {
        return complement8(this.get(offset));
    }

    inline function complement8(value){
        return value < 0x80 ? value : value - 0x100;
    }

    inline function complement16(value){
        return value < 0x8000 ? value : value - 0x10000;
    }

    public inline function readUInt16LE(offset = 0) {
        return this.get(offset + 1) << 8 | this.get(offset);
    }

    public inline function readUInt16BE(offset = 0) {
        return this.get(offset) << 8 | this.get(offset + 1);
    }

    public inline function readInt16LE(offset = 0) {
        return complement16(readUInt16LE(offset));
    }

    public inline function readInt16BE(offset = 0) {
        return complement16(readUInt16BE(offset));
    }

    public inline function readUInt32LE(offset = 0) {
        return this.get(offset + 3) << 24 | this.get(offset + 2) << 16 | this.get(offset + 1) << 8 | this.get(offset);
    }

    public inline function readUInt32BE(offset = 0) {
        return this.get(offset) << 24 | this.get(offset + 1) << 16 | this.get(offset + 2) << 8 | this.get(offset + 3);
    }

    public inline function readInt32LE(offset = 0) {
        return return readUInt32LE(offset);
    }

    public inline function readInt32BE(offset = 0) {
        return readUInt32BE(offset);
    }

    public inline function readUInt64LE(offset = 0) {
        var left = readUInt32LE(offset);
        var right = readUInt32LE(offset + 4);

        var combined = left + Math.pow(2,32)*right;
        return combined;
    }

    public  function readUInt64BE(offset = 0) {
        var left = readUInt32BE(offset);
        var right = readUInt32BE(offset + 4);

        var combined = Math.pow(2,32)*left + right;
        return combined;
    }

    public inline function writeUInt8(offset, value) {
        this.set(offset, value);
    }

    public inline function writeInt8(offset, value) {
        writeUInt8(offset, value);
    }

    public inline function writeUInt16LE(offset, value) {
        this.set(offset, value >> 0);
        this.set(offset + 1, value >> 8);
    }

    public inline function writeUInt16BE(offset, value) {
        this.set(offset, value >> 8);
        this.set(offset + 1, value >> 0);
    }

    public inline function writeInt16LE(offset, value) {
        this.set(offset, value >> 0);
        this.set(offset + 1, value >> 8);
    }

    public inline function writeInt16BE(offset, value) {
        this.set(offset, value >> 8);
        this.set(offset + 1, value >> 0);
    }

    public inline function writeUInt32LE(offset, value) {
        this.set(offset, value >> 0);
        this.set(offset + 1, value >> 8);
        this.set(offset + 2, value >> 16);
        this.set(offset + 3, value >> 24);
    }

    public inline function writeUInt32BE(offset, value) {
        this.set(offset, value >> 24);
        this.set(offset + 1, value >> 16);
        this.set(offset + 2, value >> 8);
        this.set(offset + 3, value >> 0);
    }

    public inline function writeInt32LE(offset, value) {
        writeUInt32LE(offset, value);
    }

    public inline function writeInt32BE(offset, value) {
        writeUInt32BE(offset, value);
    }
}