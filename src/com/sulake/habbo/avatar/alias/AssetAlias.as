package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1189:Boolean;
      
      private var _name:String;
      
      private var var_2259:String;
      
      private var var_1190:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2259 = String(param1.@link);
         var_1190 = Boolean(parseInt(param1.@fliph));
         var_1189 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1190;
      }
      
      public function get flipV() : Boolean
      {
         return var_1189;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2259;
      }
   }
}
