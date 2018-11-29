
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
		
		
		loop.run(Uv.RUN_DEFAULT);
		trace('quit');
	}
	
	static function onConnection(stream:RawPointer<Stream_t>, status:Int) {
		var server:Tcp = stream;
		var client = new Tcp();
		client.init(Loop.DEFAULT);
		if(server.asStream().accept(client) == 0) {
			client.asStream().readStart(Callable.fromStaticFunction(onAlloc), Callable.fromStaticFunction(onRead));
		} else {
			client.asHandle().close(null);
		}
	}
	
	static function onAlloc(handle:RawPointer<Handle_t>, suggestedSize:Size_t, buf:RawPointer<Buf_t>) {
		var suggestedSize:Int = cast suggestedSize;
		var base:Pointer<Char> = cast Stdlib.nativeMalloc(suggestedSize);
		buf[0].base = cast base;
		buf[0].len = suggestedSize;
	}
	
	static function onRead(handle:RawPointer<Stream_t>, nread:SSize_t, buf:RawConstPointer<Buf_t>) {
		var client:Tcp = handle;
		var nread:Int = cast nread;
		if(nread > 0) {
			var req = new Write();
			var writeBuf = new Buf(nread);
			req.setDataPointer(writeBuf);
			writeBuf.copyFrom(buf);
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
		var buf:Buf = write.getDataPointer();
		buf.destroy();
		write.destroy();
	}
}