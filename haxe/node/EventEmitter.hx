package haxe.node;

import haxe.macro.Expr;
import haxe.Constraints.Function;

private typedef EmitterCallback = (args:Array<Dynamic>)->Void;


/**
 * See also https://nodejs.org/api/events.html
 */
class EventEmitter {
    public function new() {}

    public function once(name:String, callback:EmitterCallback):EventEmitter {
        return this;
    }

    public function on(name:String, callback:EmitterCallback):EventEmitter {
        return this;
    }

    public function listeners(name:String):Array<EmitterCallback> {
      return []; 
    }

    public  function addListener(name:String, callback:EmitterCallback):EventEmitter {
        return this;
    }

    macro public function emit(name:Expr, args:Array<Expr>){
        
        return macro null;
    }

    public function eventNames():Array<String> {
        return [];
    }

    public function getMaxListeners():Int {
        return 0;
    }

    public function setMaxListeners(n:Int):EventEmitter {
        return this;
    }

    public function listenerCount(name:String):Int {
        return 0;
    }

    public function rawListeners(name:String):Array<EmitterCallback> {
        return [];
    }

    public function off(name:String, listener:EmitterCallback):EventEmitter {
        return this.removeListener(name, listener);
    }

    public function removeListener(name:String, listener:EmitterCallback):EventEmitter {
        return this;
    }

    public function prependListener(name:String, listener:EmitterCallback):EventEmitter {
        return this;
    }

    public function prependOnceListener(name:String, listener:EmitterCallback):EventEmitter {
        return this;
    }

    public function removeAllListeners(?name:String):EventEmitter {
        return this;
    }


}