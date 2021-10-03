package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1066:int;
      
      private var var_1275:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1066 = param1;
         var_1275 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1066;
      }
      
      public function get itemName() : String
      {
         return var_1275;
      }
   }
}
