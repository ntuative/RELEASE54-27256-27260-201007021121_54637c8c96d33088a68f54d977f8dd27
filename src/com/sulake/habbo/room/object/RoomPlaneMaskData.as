package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1782:Number = 0.0;
      
      private var var_1784:Number = 0.0;
      
      private var var_1783:Number = 0.0;
      
      private var var_1785:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1784 = param1;
         var_1783 = param2;
         var_1782 = param3;
         var_1785 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1784;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1782;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1783;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1785;
      }
   }
}
