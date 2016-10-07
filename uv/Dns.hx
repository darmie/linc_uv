package uv;
import cpp.Callable;
import cpp.ConstCharStar;
import cpp.Pointer;
import uv.Uv.Req_t;

import uv.Loop.Loop_t;

/**
 * ...
 * @author Darmie Akinlaja
 */
extern class Dns 
{
	@:native('uv_getaddrinfo')
	public function getaddressinfo(loop:Loop_t, req:Getaddressinfo, get_addrinfo_cb:Callable<Getaddressinfo->Int->Addrinfo>, node:ConstCharStar, service:String, hints:Addrinfo):Int;

	@:native('uv_getnameinfo')
	public function getnameinfo(loop:Loop_t, req:Getnameinfo, get_nameinfo_cb:Callable<Getnameinfo->Int->String->String>, addr:Sockaddr, flags:Int):Int;	
}


@:native('::cpp::Reference<uv_getaddressinfo_t>')
@:include('linc_uv.h')
extern class Getaddressinfo extends Req_t {}

@:native('::cpp::Reference<uv_getnameinfo_t>')
@:include('linc_uv.h')
extern class Getnameinfo extends Req_t {}

@:native('::cpp::Reference<addrinfo>')
@:include('linc_uv.h')
extern class Addrinfo {}

@:native('::cpp::Reference<sockaddr>')
@:include('linc_uv.h')
extern class Sockaddr {}