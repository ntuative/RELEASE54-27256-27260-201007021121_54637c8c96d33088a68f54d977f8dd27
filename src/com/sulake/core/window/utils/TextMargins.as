package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_944:int;
      
      private var _right:int;
      
      private var var_945:int;
      
      private var var_946:int;
      
      private var var_195:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_945 = param1;
         var_946 = param2;
         _right = param3;
         var_944 = param4;
         var_195 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_944 = param1;
         var_195(this);
      }
      
      public function get left() : int
      {
         return var_945;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_945 == 0 && _right == 0 && var_946 == 0 && var_944 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_946 = param1;
         var_195(this);
      }
      
      public function get top() : int
      {
         return var_946;
      }
      
      public function set left(param1:int) : void
      {
         var_945 = param1;
         var_195(this);
      }
      
      public function get bottom() : int
      {
         return var_944;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_945,var_946,_right,var_944,param1);
      }
      
      public function dispose() : void
      {
         var_195 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_195(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
