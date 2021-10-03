package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_46:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_1943:Number = -1.0;
      
      private var var_852:IGraphicAsset = null;
      
      private var var_1944:Number = 1.0;
      
      private var var_1945:Number = -1.0;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1.0, param3:Number = 1.0, param4:Number = -1.0, param5:Number = 1.0)
      {
         super();
         var_1943 = param2;
         _normalMaxX = param3;
         var_1945 = param4;
         var_1944 = param5;
         var_852 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1944;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_1943;
      }
      
      public function get normalMinY() : Number
      {
         return var_1945;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_852;
      }
      
      public function dispose() : void
      {
         var_852 = null;
      }
   }
}
