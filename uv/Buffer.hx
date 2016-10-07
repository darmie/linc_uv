package uv;

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

@:native('::cpp::Reference<buf_t>')
@:include('linc_uv.h')
extern class Buffer {}