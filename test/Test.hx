
package;



import uv.*;
import uv.Uv;
import haxe.io.Bytes;

class Test {
	static function main() {
		// var loop = new Loop();
		// loop.run(Uv.UV_RUN_DEFAULT);
		// loop.close();
		
		
		var loop = new Loop();
		var server = new Tcp(loop);
		
		var addr = SockAddrIn.ip4Addr("0.0.0.0", 7000);
		
		server.bind(addr, 0);
		
		server.onConnect.add(function(client) {
			trace('connected');
			var total = 0;
			client.onEnd.add(function() {
				trace('ended');
				trace(total);
			});
			client.onRead.add(function(bytes) {
				trace('readed');
				trace(bytes.length);
				if(bytes.length < 1000) trace(bytes.toString());
				total += bytes.length;
			});
			client.readStart();
		});
		
		server.listen(128);

		// uv_tcp_bind(&server, (const struct sockaddr*)&addr, 0);
		// int r = uv_listen((uv_stream_t*) &server, DEFAULT_BACKLOG, on_new_connection);
		// if (r) {
		// 	fprintf(stderr, "Listen error %s\n", uv_strerror(r));
		// 	return 1;
		// }
		trace('run');
		return loop.run(Uv.RUN_DEFAULT);
	}

}

