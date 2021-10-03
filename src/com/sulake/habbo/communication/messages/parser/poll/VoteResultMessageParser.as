package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1218:int;
      
      private var var_1140:String;
      
      private var var_808:Array;
      
      private var var_1033:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_808.slice();
      }
      
      public function flush() : Boolean
      {
         var_1140 = "";
         var_1033 = [];
         var_808 = [];
         var_1218 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1218;
      }
      
      public function get question() : String
      {
         return var_1140;
      }
      
      public function get choices() : Array
      {
         return var_1033.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1140 = param1.readString();
         var_1033 = [];
         var_808 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1033.push(param1.readString());
            var_808.push(param1.readInteger());
            _loc3_++;
         }
         var_1218 = param1.readInteger();
         return true;
      }
   }
}
