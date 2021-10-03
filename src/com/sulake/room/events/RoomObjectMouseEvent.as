package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1611:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1549:String = "ROE_MOUSE_ENTER";
      
      public static const const_380:String = "ROE_MOUSE_MOVE";
      
      public static const const_1677:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_233:String = "ROE_MOUSE_CLICK";
      
      public static const const_422:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2150:Boolean;
      
      private var var_2151:Boolean;
      
      private var var_2153:Boolean;
      
      private var var_2152:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2153 = param4;
         var_2152 = param5;
         var_2150 = param6;
         var_2151 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2151;
      }
      
      public function get altKey() : Boolean
      {
         return var_2153;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2152;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2150;
      }
   }
}
