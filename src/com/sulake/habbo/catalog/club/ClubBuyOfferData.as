package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1766:int;
      
      private var var_2036:Boolean = false;
      
      private var var_1761:int;
      
      private var var_1763:int;
      
      private var var_1762:int;
      
      private var var_1399:String;
      
      private var var_1267:int;
      
      private var _offerId:int;
      
      private var var_1764:int;
      
      private var var_1765:Boolean;
      
      private var var_1767:Boolean;
      
      private var var_445:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1399 = param2;
         var_1267 = param3;
         var_1767 = param4;
         var_1765 = param5;
         var_1761 = param6;
         var_1762 = param7;
         var_1763 = param8;
         var_1766 = param9;
         var_1764 = param10;
      }
      
      public function get month() : int
      {
         return var_1766;
      }
      
      public function get page() : ICatalogPage
      {
         return var_445;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1765;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_445 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_358;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1767;
      }
      
      public function get localizationId() : String
      {
         return var_1399;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1762;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_2036;
      }
      
      public function get day() : int
      {
         return var_1764;
      }
      
      public function get year() : int
      {
         return var_1763;
      }
      
      public function get price() : int
      {
         return var_1267;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_2036 = param1;
      }
      
      public function get periods() : int
      {
         return var_1761;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1267;
      }
      
      public function get productCode() : String
      {
         return var_1399;
      }
   }
}
