package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1553:Array;
      
      private var var_1876:int;
      
      private var var_1922:int;
      
      private var var_1920:int;
      
      private var var_1921:int;
      
      private var _dayOffsets:Array;
      
      private var var_1919:int;
      
      private var var_1552:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return var_1922;
      }
      
      public function get historyLength() : int
      {
         return var_1921;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1920;
      }
      
      public function get offerCount() : int
      {
         return var_1919;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1552;
      }
      
      public function get averagePrice() : int
      {
         return var_1876;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1876 = param1.readInteger();
         var_1919 = param1.readInteger();
         var_1921 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1553 = [];
         var_1552 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1553.push(param1.readInteger());
            var_1552.push(param1.readInteger());
            _loc3_++;
         }
         var_1920 = param1.readInteger();
         var_1922 = param1.readInteger();
         return true;
      }
   }
}
