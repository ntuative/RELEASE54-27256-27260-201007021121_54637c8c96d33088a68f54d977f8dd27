package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1267:int;
      
      private var var_1876:int;
      
      private var var_1877:int = -1;
      
      private var var_153:int;
      
      private var var_1878:int;
      
      private var _offerId:int;
      
      private var var_1266:int;
      
      private var _furniId:int;
      
      private var var_1484:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1878 = param3;
         var_1484 = param4;
         var_1267 = param5;
         var_153 = param6;
         var_1877 = param7;
         var_1876 = param8;
         var_1266 = param9;
      }
      
      public function get status() : int
      {
         return var_153;
      }
      
      public function get price() : int
      {
         return var_1267;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1877;
      }
      
      public function get offerCount() : int
      {
         return var_1266;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1878;
      }
      
      public function get averagePrice() : int
      {
         return var_1876;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get stuffData() : String
      {
         return var_1484;
      }
   }
}
