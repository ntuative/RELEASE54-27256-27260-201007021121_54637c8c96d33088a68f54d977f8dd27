package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_138:String = "RWPUE_VOTE_RESULT";
      
      public static const const_126:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1218:int;
      
      private var var_1140:String;
      
      private var var_808:Array;
      
      private var var_1033:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1140 = param2;
         var_1033 = param3;
         var_808 = param4;
         if(var_808 == null)
         {
            var_808 = [];
         }
         var_1218 = param5;
      }
      
      public function get votes() : Array
      {
         return var_808.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1218;
      }
      
      public function get question() : String
      {
         return var_1140;
      }
      
      public function get choices() : Array
      {
         return var_1033.slice();
      }
   }
}
