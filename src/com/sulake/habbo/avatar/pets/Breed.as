package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_677:String;
      
      private var _id:int;
      
      private var var_1827:String = "";
      
      private var var_1829:int;
      
      private var var_1826:String;
      
      private var var_1828:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1829 = parseInt(param1.@pattern);
         var_677 = String(param1.@gender);
         var_1828 = Boolean(parseInt(param1.@colorable));
         var_1827 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1827;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1828;
      }
      
      public function get gender() : String
      {
         return var_677;
      }
      
      public function get patternId() : int
      {
         return var_1829;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1826;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1826 = param1;
      }
   }
}
