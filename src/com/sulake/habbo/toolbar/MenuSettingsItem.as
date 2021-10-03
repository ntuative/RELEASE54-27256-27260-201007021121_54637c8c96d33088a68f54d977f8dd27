package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2025:Array;
      
      private var var_1992:String;
      
      private var var_2027:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1992 = param1;
         var_2025 = param2;
         var_2027 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1992;
      }
      
      public function get yieldList() : Array
      {
         return var_2025;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_2027;
      }
   }
}
