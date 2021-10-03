package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2001:Number;
      
      private var var_623:Number = 0;
      
      private var var_2000:Number;
      
      private var var_622:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2001 = param1;
         var_2000 = param2;
      }
      
      public function update() : void
      {
         var_622 += var_2000;
         var_623 += var_622;
         if(var_623 > 0)
         {
            var_623 = 0;
            var_622 = var_2001 * -1 * var_622;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_622 = param1;
         var_623 = 0;
      }
      
      public function get location() : Number
      {
         return var_623;
      }
   }
}
