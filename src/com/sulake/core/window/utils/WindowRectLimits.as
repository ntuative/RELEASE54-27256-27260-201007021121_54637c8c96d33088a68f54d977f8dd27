package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_418:int = -2.147483648E9;
      
      private var var_417:int = 2.147483647E9;
      
      private var var_416:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      private var var_419:int = -2.147483648E9;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_417;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_419 == int.MIN_VALUE && var_417 == int.MAX_VALUE && var_418 == int.MIN_VALUE && var_416 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_417 = param1;
         if(var_417 < int.MAX_VALUE && true && _target.width > var_417)
         {
            _target.width = var_417;
         }
      }
      
      public function setEmpty() : void
      {
         var_419 = int.MIN_VALUE;
         var_417 = int.MAX_VALUE;
         var_418 = int.MIN_VALUE;
         var_416 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_416 = param1;
         if(var_416 < int.MAX_VALUE && true && _target.height > var_416)
         {
            _target.height = var_416;
         }
      }
      
      public function get minHeight() : int
      {
         return var_418;
      }
      
      public function get minWidth() : int
      {
         return var_419;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_419 = var_419;
         _loc2_.var_417 = var_417;
         _loc2_.var_418 = var_418;
         _loc2_.var_416 = var_416;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_419 = param1;
         if(var_419 > int.MIN_VALUE && true && _target.width < var_419)
         {
            _target.width = var_419;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_418 = param1;
         if(var_418 > int.MIN_VALUE && true && _target.height < var_418)
         {
            _target.height = var_418;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_416;
      }
   }
}
