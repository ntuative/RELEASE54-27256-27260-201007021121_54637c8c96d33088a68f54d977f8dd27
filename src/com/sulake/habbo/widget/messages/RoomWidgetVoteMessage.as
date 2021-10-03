package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_134:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1406:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_134);
         var_1406 = param1;
      }
      
      public function get vote() : int
      {
         return var_1406;
      }
   }
}
