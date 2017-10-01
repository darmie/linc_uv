package node;
import uv.Loop.Loop_t;
import uv.Uv;
import uv.Uv.UVRunMode;

/**
 * ...
 * @author Damilare Akinlaja
 */

 
/*!
 *  Class that represents the loop instance.
 */
 
class Loop 
{
	private var uv_loop_:Loop_t;
	
        /*!
         *  Default constructor
         *  @param use_default indicates whether to use default loop or create a new loop.
         */	
	public function new(use_default:Bool=false) 
	{
		this.uv_loop_ = use_default ? uv.Loop.default_loop() : uv.Loop.create();
	}
	
	
	/**
	 * Destructor
	 **/
	public function destroy(){
		if (this.uv_loop_ != null){
			uv.Loop.delete(this.uv_loop_);
			this.uv_loop_ = null;
		}
	}
	
	
	/**
	 * Returns the internal handle for libuv functions
	 * @return Loop_t
	 */
	
	public function get():Loop_t
	{
		return this.uv_loop_;
	}
	
	/**
	 * Starts the loop 
	 * Internally, this function just calls uv_run() function.
	 */
	
	public function run():Bool
	{
		return uv.Loop.run(this.uv_loop_, UVRunMode.UV_RUN_DEFAULT) == 0;
	}
	
	/**
	 * Polls for new events without blocking.
	 * Internally, this function just calls uv_run_once() function.
	 */
	public function run_once():Bool
	{
		return uv.Loop.run(this.uv_loop_, UVRunMode.UV_RUN_ONCE) == 0;
	}
	
	public function update_time():Void
	{
		uv.Loop.update_time(this.uv_loop_);
	}
	
	
	public function now():Int64_t
	{
		return uv.Loop.now(this.uv_loop_);
	}
	
	
	/**
	 * Starts the default loop
	 * @return Int
	 */
	
	public static inline function Run():Int
	{
		return uv.Loop.run(uv.Loop.default_loop(), UVRunMode.UV_RUN_DEFAULT);
	}
	
	
	
	/**
	 * Polls for new events without blocking for the default loop.
	 * @return Int
	 */
	
	public static inline function RunOnce():Int
	{
		return uv.Loop.run(uv.Loop.default_loop(), UVRunMode.UV_RUN_ONCE);
	}	
	
	
}