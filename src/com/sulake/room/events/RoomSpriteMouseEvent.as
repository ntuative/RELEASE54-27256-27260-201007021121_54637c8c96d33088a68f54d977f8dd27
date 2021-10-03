package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2151:Boolean = false;
      
      private var var_2153:Boolean = false;
      
      private var var_2245:String = "";
      
      private var _type:String = "";
      
      private var var_2150:Boolean = false;
      
      private var var_2132:Number = 0;
      
      private var var_2273:Number = 0;
      
      private var var_2274:Number = 0;
      
      private var var_2275:String = "";
      
      private var var_2135:Number = 0;
      
      private var var_2152:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2275 = param2;
         var_2245 = param3;
         var_2273 = param4;
         var_2274 = param5;
         var_2132 = param6;
         var_2135 = param7;
         var_2152 = param8;
         var_2153 = param9;
         var_2150 = param10;
         var_2151 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2152;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2151;
      }
      
      public function get localX() : Number
      {
         return var_2132;
      }
      
      public function get localY() : Number
      {
         return var_2135;
      }
      
      public function get canvasId() : String
      {
         return var_2275;
      }
      
      public function get altKey() : Boolean
      {
         return var_2153;
      }
      
      public function get spriteTag() : String
      {
         return var_2245;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2273;
      }
      
      public function get screenY() : Number
      {
         return var_2274;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2150;
      }
   }
}
