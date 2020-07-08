package uv;
import uv.Stream;
import uv.Uv;
import cpp.*;

@:dce @:forward
abstract StdioContainer(Pointer<StdioContainer_t>) from Pointer<StdioContainer_t> to Pointer<StdioContainer_t> {
    public inline function new() this = Stdlib.malloc(Stdlib.sizeof(StdioContainer_t));
    public inline function destroy() return Stdlib.free(this);
    @:to public inline function asRaw():RawPointer<StdioContainer_t> return this.raw;

    public inline function data():StdioContainerData {
        var stream:Stream = untyped __cpp__("{0}.data.stream");
        var fd:Int = untyped __cpp__("{0}.data.fd");

        return {
            stream: stream,
            fd: fd
        };
    }
}

private typedef StdioContainerData = {
    var stream:Stream;
    var fd:Int;
}