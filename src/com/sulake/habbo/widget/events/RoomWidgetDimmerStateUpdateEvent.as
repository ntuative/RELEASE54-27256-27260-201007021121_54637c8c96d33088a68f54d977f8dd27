package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_57:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1111:int;
      
      private var _color:uint;
      
      private var var_1110:int;
      
      private var var_1935:int;
      
      private var var_37:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_57,param6,param7);
         var_37 = param1;
         var_1935 = param2;
         var_1111 = param3;
         _color = param4;
         var_1110 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1110;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1111;
      }
      
      public function get state() : int
      {
         return var_37;
      }
      
      public function get presetId() : int
      {
         return var_1935;
      }
   }
}
