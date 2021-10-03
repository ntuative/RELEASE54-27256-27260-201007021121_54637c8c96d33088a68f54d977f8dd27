package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1771:int;
      
      private var var_1235:PetData;
      
      private var var_1772:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1771;
      }
      
      public function get petData() : PetData
      {
         return var_1235;
      }
      
      public function flush() : Boolean
      {
         var_1235 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1772;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1771 = param1.readInteger();
         var_1772 = param1.readInteger();
         var_1235 = new PetData(param1);
         return true;
      }
   }
}
