package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PublicSpaceCastLibsMessageParser implements IMessageParser
   {
       
      
      private var var_2330:int;
      
      private var var_2398:String;
      
      private var var_1336:int;
      
      public function PublicSpaceCastLibsMessageParser()
      {
         super();
      }
      
      public function get unitPort() : int
      {
         return var_2330;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get castLibs() : String
      {
         return var_2398;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1336 = param1.readInteger();
         this.var_2398 = param1.readString();
         this.var_2330 = param1.readInteger();
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1336;
      }
   }
}
