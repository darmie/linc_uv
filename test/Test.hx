
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
		trace(addr.ip4Addr('0.0.0.0', 7000));
		var server = new Tcp();
		server.init(loop);
		server.bind(addr, 0);
		addr.destroy();
		
		server.asStream().listen(128, Callable.fromStaticFunction(onConnection));
		
		var client = new Tcp();
		client.init(loop);
		var connect = new Connect();
		var dest = new SockAddrIn();
		dest.ip4Addr('127.0.0.1', 7000);
		client.connect(connect, dest, Callable.fromStaticFunction(onConnect));
		
		// DNS
		var hint = new AddrInfo();
		var resolver = new GetAddrInfo();
		trace(resolver.get(loop, Callable.fromStaticFunction(onResolve), 'example.com', '80', hint));

		// signal
		signal(loop);

		loop.run(Uv.RUN_DEFAULT);
		trace('quit');
	}
	
	static function onConnection(stream:RawPointer<Stream_t>, status:Int) {
		trace('connected');
		var server:Tcp = stream;
		var client = new Tcp();
		client.init(Loop.DEFAULT);
		if(server.asStream().accept(client) == 0) {
			trace('accepted');
			trace(client.getPeerAddress());
			trace(client.getSockAddress());
			trace(client.asStream().readStop());
			client.asStream().readStart(Callable.fromStaticFunction(onAlloc), Callable.fromStaticFunction(onRead));
		} else {
			client.asHandle().close(null);
		}
	}
	
	static function onAlloc(handle:RawPointer<Handle_t>, suggestedSize:SizeT, buf:RawPointer<Buf_t>) {
		var suggestedSize:Int = cast suggestedSize;
		var base:Pointer<Char> = cast Stdlib.nativeMalloc(suggestedSize);
		buf[0].base = cast base;
		buf[0].len = suggestedSize;
	}
	
	static function onRead(handle:RawPointer<Stream_t>, nread:SSizeT, buf:RawConstPointer<Buf_t>) {
		var client:Tcp = handle;
		var nread:Int = cast nread;
		if(nread > 0) {
			var req = new Write();
			var writeBuf = new Buf();
			writeBuf.alloc(nread);
			req.setData(writeBuf);
			writeBuf.copyFrom(buf, nread);
			client.asStream().write(req, writeBuf, 1, Callable.fromStaticFunction(onWrite));
		}
		if(nread < 0) {
			if(nread != Uv.EOF) trace('read error $nread');
			client.asHandle().close(null);
		}
		Buf.unmanaged(buf).free();
	}
	
	static function onWrite(handle:RawPointer<Write_t>, status:Int) {
		var write:Write = handle;
		var buf:Buf = write.getData();
		buf.destroy();
		write.destroy();
	}
	
	static function onConnect(req:RawPointer<Connect_t>, status:Int) {
		var addr = Tcp.fromStream(Connect.fromRaw(req).handle).getPeerAddress();
		trace('onconnect $status ${addr.host.toString()} ${addr.port}');
		// var stream = Connect.fromRaw(req).handle;
		
	}
	
	static function onResolve(resolver:RawPointer<GetAddrInfo_t>, status:Int, res:RawPointer<AddrInfo_s>) {
		trace('resolve $status');
		var addr = AddrInfo.fromRaw(res);
		var client = new Tcp();
		client.init(Loop.DEFAULT);
		var connect = new Connect();
		client.connect(connect, addr, Callable.fromStaticFunction(onConnect));
		addr.destroy();
	}


	/**
	 * Signal test
	 * two signal handlers in one loop
	 */

	static function signal(loop){

		var signal1 = new Signal();
		
		signal1.init(loop);
		
		Uv.ref(signal1.asHandle().asRaw());

		signal1.start(Callable.fromStaticFunction(onStart), SIGUSR1);
	}

	static function onStart(signal:RawPointer<Signal_t>, signum:Int) {
		trace('Signal recieved: $signum');
		var _signal = Signal.fromRaw(signal);
		_signal.stop();
		Uv.unref(_signal.asHandle().asRaw());
	}
}