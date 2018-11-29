
package;

import cpp.*;
import uv.*;
import uv.Uv;
import haxe.io.Bytes;

class Test {
	static function main() {
		Foo.foo();
	}
}

class Foo {
	public static function foo() {
		var loop = Loop.DEFAULT;
		
		var addr = new SockAddrIn();
		addr.ip4Addr('0.0.0.0', 7000);
		var server = new Tcp();
		server.init(loop);
		server.bind(addr, 0);
		addr.destroy();
		
		server.asStream().listen(128, Callable.fromStaticFunction(onConnection));
		
		
		// var loop = new Loop();
		// var server = new Tcp(loop);
		
		// var addr = SockAddrIn.ip4Addr("0.0.0.0", 7000);
		
		// server.bind(addr, 0);
		
		// server.onConnect.add(function(client) {
		// 	trace('connected');
		// 	var total = 0;
		// 	client.onEnd.add(function() {
		// 		trace('ended');
		// 		trace(total);
		// 	});
		// 	client.onRead.add(function(bytes) {
		// 		trace('readed');
		// 		trace(bytes.length);
		// 		if(bytes.length < 1000) trace(bytes.toString());
		// 		total += bytes.length;
		// 	});
		// 	client.readStart();
		// });
		
		// server.listen(128);

		// // uv_tcp_bind(&server, (const struct sockaddr*)&addr, 0);
		// // int r = uv_listen((uv_stream_t*) &server, DEFAULT_BACKLOG, on_new_connection);
		// // if (r) {
		// // 	fprintf(stderr, "Listen error %s\n", uv_strerror(r));
		// // 	return 1;
		// // }
		// trace('run');
		// return loop.run(Uv.RUN_DEFAULT);
		
		loop.run(Uv.RUN_DEFAULT);
		trace('quit');
	}
	
	static function onConnection(stream:RawPointer<Stream_t>, status:Int) {
		var server:Tcp = stream;
		var client = new Tcp();
		client.init(Loop.DEFAULT);
		var r = server.asStream().accept(client);
		client.asStream().readStart(Callable.fromStaticFunction(onAlloc), Callable.fromStaticFunction(onRead));
	}
	
	static function onAlloc(handle:RawPointer<Handle_t>, suggestedSize:Size_t, buf:RawPointer<Buf_t>) {
		var suggestedSize:Int = cast suggestedSize;
		var base:Pointer<Char> = cast Stdlib.nativeMalloc(suggestedSize);
		buf[0].base = cast base;
		buf[0].len = suggestedSize;
	}
	
	static function onRead(stream:RawPointer<Stream_t>, nread:Long, buf:RawConstPointer<Buf_t>) {
		var nread:Int = cast nread;
		trace('read $nread');
	}
}