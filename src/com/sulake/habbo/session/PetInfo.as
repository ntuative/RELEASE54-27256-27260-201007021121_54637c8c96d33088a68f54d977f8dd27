package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1859:int;
      
      private var var_1771:int;
      
      private var var_1731:int;
      
      private var var_1856:int;
      
      private var _nutrition:int;
      
      private var var_1293:int;
      
      private var var_1858:int;
      
      private var var_1855:int;
      
      private var _energy:int;
      
      private var var_1854:int;
      
      private var var_1861:int;
      
      private var _ownerName:String;
      
      private var var_1857:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1859;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1771 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1859 = param1;
      }
      
      public function get petId() : int
      {
         return var_1293;
      }
      
      public function get experienceMax() : int
      {
         return var_1855;
      }
      
      public function get nutritionMax() : int
      {
         return var_1856;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1858 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1857;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1293 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1861;
      }
      
      public function get respect() : int
      {
         return var_1771;
      }
      
      public function get levelMax() : int
      {
         return var_1858;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1855 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1731 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1856 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1857 = param1;
      }
      
      public function get experience() : int
      {
         return var_1731;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1861 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1854 = param1;
      }
      
      public function get age() : int
      {
         return var_1854;
      }
   }
}
