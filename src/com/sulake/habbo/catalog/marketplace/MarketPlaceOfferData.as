package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_1875:int;
      
      private var var_1267:int;
      
      private var var_1876:int;
      
      private var var_1877:int = -1;
      
      private var var_153:int;
      
      private var var_1878:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1266:int;
      
      private var _furniId:int;
      
      private var var_1484:String;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1878 = param3;
         var_1484 = param4;
         var_1267 = param5;
         var_153 = param6;
         var_1876 = param7;
         var_1266 = param8;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get furniType() : int
      {
         return var_1878;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_1875 = param1;
      }
      
      public function get price() : int
      {
         return var_1267;
      }
      
      public function get stuffData() : String
      {
         return var_1484;
      }
      
      public function get imageCallback() : int
      {
         return var_1875;
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
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_1877 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1267 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1266 = param1;
      }
      
      public function get status() : int
      {
         return var_153;
      }
      
      public function get averagePrice() : int
      {
         return var_1876;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(_image != null)
         {
            _image.dispose();
         }
         _image = param1;
      }
   }
}
