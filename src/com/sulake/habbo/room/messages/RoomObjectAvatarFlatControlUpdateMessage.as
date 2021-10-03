package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2219:String;
      
      private var var_2218:Boolean = false;
      
      public function RoomObjectAvatarFlatControlUpdateMessage(param1:String)
      {
         super();
         var_2219 = param1;
         if(param1 != null && param1.indexOf("useradmin") != -1)
         {
            var_2218 = true;
         }
      }
      
      public function get rawData() : String
      {
         return var_2219;
      }
      
      public function get isAdmin() : Boolean
      {
         return var_2218;
      }
   }
}
