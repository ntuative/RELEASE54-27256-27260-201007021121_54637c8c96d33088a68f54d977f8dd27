package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1172:Boolean;
      
      private var var_1441:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1172 = param1.readInteger() > 0;
         var_1441 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1172;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1441;
      }
      
      public function flush() : Boolean
      {
         var_1172 = false;
         var_1441 = false;
         return true;
      }
   }
}
