package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2359:int;
      
      private var var_2357:String;
      
      private var var_1655:IActionDefinition;
      
      private var var_2360:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2356:String;
      
      private var var_2358:String;
      
      private var var_1828:Boolean;
      
      private var var_2355:ColorTransform;
      
      private var var_2142:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2357 = param1;
         var_2356 = param2;
         var_2359 = param3;
         _color = param4;
         _frames = param5;
         var_1655 = param6;
         var_1828 = param7;
         var_2142 = param8;
         var_2358 = param9;
         var_2360 = param10;
         var_2355 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1828;
      }
      
      public function get partType() : String
      {
         return var_2356;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2142;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2360;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2359;
      }
      
      public function get flippedPartType() : String
      {
         return var_2358;
      }
      
      public function get bodyPartId() : String
      {
         return var_2357;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1655;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2355;
      }
   }
}
