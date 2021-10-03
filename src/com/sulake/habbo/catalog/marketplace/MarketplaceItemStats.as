package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1553:Array;
      
      private var var_1876:int;
      
      private var var_1922:int;
      
      private var var_1921:int;
      
      private var var_1920:int;
      
      private var _dayOffsets:Array;
      
      private var var_1919:int;
      
      private var var_1552:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1553;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1553 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1922;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1552 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1876 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1921;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1920;
      }
      
      public function get offerCount() : int
      {
         return var_1919;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1919 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1552;
      }
      
      public function get averagePrice() : int
      {
         return var_1876;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1920 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1921 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1922 = param1;
      }
   }
}
