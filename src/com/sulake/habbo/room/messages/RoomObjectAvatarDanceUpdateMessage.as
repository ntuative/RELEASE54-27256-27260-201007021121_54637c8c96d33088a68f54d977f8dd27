package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarDanceUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1669:int;
      
      public function RoomObjectAvatarDanceUpdateMessage(param1:int = 0)
      {
         super();
         var_1669 = param1;
      }
      
      public function get danceStyle() : int
      {
         return var_1669;
      }
   }
}
