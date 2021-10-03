package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const const_57:String = "RODSUE_DIMMER_STATE";
       
      
      private var var_1111:int;
      
      private var _color:uint;
      
      private var var_1110:int;
      
      private var var_1935:int;
      
      private var var_37:int;
      
      public function RoomObjectDimmerStateUpdateEvent(param1:int, param2:String, param3:int, param4:int, param5:int, param6:uint, param7:int, param8:Boolean = false, param9:Boolean = false)
      {
         super(const_57,param1,param2,param8,param9);
         var_37 = param3;
         var_1935 = param4;
         var_1111 = param5;
         _color = param6;
         var_1110 = param7;
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
