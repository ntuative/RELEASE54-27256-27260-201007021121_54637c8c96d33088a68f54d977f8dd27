package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_532:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1939:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_532);
         var_1939 = param1;
      }
      
      public function get tag() : String
      {
         return var_1939;
      }
   }
}
