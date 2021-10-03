package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1803:Number = 1.0;
      
      private var var_154:Number = 1.0;
      
      private var var_2220:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2220 = param1;
         var_154 = param2;
         var_1803 = param3;
      }
      
      public function get scale() : Number
      {
         return var_154;
      }
      
      public function get heightScale() : Number
      {
         return var_1803;
      }
   }
}
