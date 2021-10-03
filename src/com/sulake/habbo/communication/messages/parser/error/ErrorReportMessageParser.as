package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1418:int;
      
      private var var_1260:int;
      
      private var var_1417:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1418;
      }
      
      public function flush() : Boolean
      {
         var_1260 = 0;
         var_1418 = 0;
         var_1417 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1260;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1418 = param1.readInteger();
         var_1260 = param1.readInteger();
         var_1417 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1417;
      }
   }
}
