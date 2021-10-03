package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1768:String;
      
      private var var_677:String;
      
      private var var_1695:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1695 = param1.readInteger();
         var_1768 = param1.readString();
         var_677 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_677;
      }
      
      public function get figureString() : String
      {
         return var_1768;
      }
      
      public function get slotId() : int
      {
         return var_1695;
      }
   }
}
