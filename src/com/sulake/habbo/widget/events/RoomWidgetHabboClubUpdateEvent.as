package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_213:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2315:Boolean = false;
      
      private var var_2316:int = 0;
      
      private var var_2314:int = 0;
      
      private var var_1895:int;
      
      private var var_2313:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_213,param6,param7);
         var_2313 = param1;
         var_2314 = param2;
         var_2316 = param3;
         var_2315 = param4;
         var_1895 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1895;
      }
      
      public function get pastPeriods() : int
      {
         return var_2316;
      }
      
      public function get periodsLeft() : int
      {
         return var_2314;
      }
      
      public function get daysLeft() : int
      {
         return var_2313;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2315;
      }
   }
}
