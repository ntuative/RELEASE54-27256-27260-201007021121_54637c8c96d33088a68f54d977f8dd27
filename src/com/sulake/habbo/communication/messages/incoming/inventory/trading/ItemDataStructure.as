package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1066:String;
      
      private var var_1975:int;
      
      private var var_1972:int;
      
      private var var_1574:int;
      
      private var var_1978:int;
      
      private var _category:int;
      
      private var var_2527:int;
      
      private var var_1976:int;
      
      private var var_1977:int;
      
      private var var_1974:int;
      
      private var var_1973:int;
      
      private var var_1971:Boolean;
      
      private var var_1484:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1975 = param1;
         var_1066 = param2;
         var_1972 = param3;
         var_1974 = param4;
         _category = param5;
         var_1484 = param6;
         var_1574 = param7;
         var_1977 = param8;
         var_1976 = param9;
         var_1973 = param10;
         var_1978 = param11;
         var_1971 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1974;
      }
      
      public function get extra() : int
      {
         return var_1574;
      }
      
      public function get stuffData() : String
      {
         return var_1484;
      }
      
      public function get groupable() : Boolean
      {
         return var_1971;
      }
      
      public function get creationMonth() : int
      {
         return var_1973;
      }
      
      public function get roomItemID() : int
      {
         return var_1972;
      }
      
      public function get itemType() : String
      {
         return var_1066;
      }
      
      public function get itemID() : int
      {
         return var_1975;
      }
      
      public function get songID() : int
      {
         return var_1574;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1977;
      }
      
      public function get creationYear() : int
      {
         return var_1978;
      }
      
      public function get creationDay() : int
      {
         return var_1976;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
