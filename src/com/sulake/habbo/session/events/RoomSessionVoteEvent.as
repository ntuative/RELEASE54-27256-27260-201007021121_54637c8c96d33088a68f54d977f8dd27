package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_138:String = "RSPE_VOTE_RESULT";
      
      public static const const_126:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1218:int = 0;
      
      private var var_1140:String = "";
      
      private var var_808:Array;
      
      private var var_1033:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1033 = [];
         var_808 = [];
         super(param1,param2,param7,param8);
         var_1140 = param3;
         var_1033 = param4;
         var_808 = param5;
         if(var_808 == null)
         {
            var_808 = [];
         }
         var_1218 = param6;
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
