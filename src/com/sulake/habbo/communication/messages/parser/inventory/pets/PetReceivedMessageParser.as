package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1064:PetData;
      
      private var var_1539:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1539 = param1.readBoolean();
         var_1064 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1539 + ", " + var_1064.id + ", " + var_1064.name + ", " + pet.figure + ", " + var_1064.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1539;
      }
      
      public function get pet() : PetData
      {
         return var_1064;
      }
   }
}
