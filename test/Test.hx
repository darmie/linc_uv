
package;
import uv.Uv.UVRunMode;
import uv.Loop;
import uv.Loop.Loop_t;
import uv.Fs.Uv_file;
import uv.Fs.Fs_t;

class Test {

    static function main() {
		    var file:Uv_file;
	var fs_t:Fs_t;  
	var enumType:UVRunMode;
	   var loop_t = Loop.create();
       Loop.now(loop_t);
	   trace(Loop.size());

    }

}