package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1894:Boolean;
      
      private var var_1871:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1894 = Boolean(parseInt(param1.@club));
         var_1871 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1894;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1871;
      }
   }
}
