package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_442:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_454:int = 0;
      
      public static const const_844:int = 2;
      
      public static const const_919:int = 1;
      
      public static const const_552:Boolean = false;
      
      public static const const_605:String = "";
      
      public static const const_509:int = 0;
      
      public static const const_384:int = 0;
      
      public static const const_400:int = 0;
       
      
      private var var_1979:int = 0;
      
      private var var_1939:String = "";
      
      private var var_1607:int = 0;
      
      private var var_1981:int = 0;
      
      private var var_1983:Number = 0;
      
      private var var_1980:int = 255;
      
      private var var_1982:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1979;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1607 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1983;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1981 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1979 = param1;
      }
      
      public function get tag() : String
      {
         return var_1939;
      }
      
      public function get alpha() : int
      {
         return var_1980;
      }
      
      public function get ink() : int
      {
         return var_1607;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1983 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1981;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1982 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1982;
      }
      
      public function set tag(param1:String) : void
      {
         var_1939 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1980 = param1;
      }
   }
}
