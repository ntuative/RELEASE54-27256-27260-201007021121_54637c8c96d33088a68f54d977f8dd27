package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_920:String = "price_type_none";
      
      public static const const_444:String = "pricing_model_multi";
      
      public static const const_358:String = "price_type_credits";
      
      public static const const_481:String = "price_type_credits_and_pixels";
      
      public static const const_489:String = "pricing_model_bundle";
      
      public static const const_480:String = "pricing_model_single";
      
      public static const const_614:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1382:String = "pricing_model_unknown";
      
      public static const const_461:String = "price_type_pixels";
       
      
      private var var_2040:int;
      
      private var var_909:int;
      
      private var _offerId:int;
      
      private var var_908:int;
      
      private var var_432:String;
      
      private var var_631:String;
      
      private var var_445:ICatalogPage;
      
      private var var_431:IProductContainer;
      
      private var var_1339:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1339 = param1.localizationId;
         var_909 = param1.priceInCredits;
         var_908 = param1.priceInPixels;
         var_445 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_432;
      }
      
      public function get page() : ICatalogPage
      {
         return var_445;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2040 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_431;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_908;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1339 = "";
         var_909 = 0;
         var_908 = 0;
         var_445 = null;
         if(var_431 != null)
         {
            var_431.dispose();
            var_431 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2040;
      }
      
      public function get priceInCredits() : int
      {
         return var_909;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_432 = const_480;
            }
            else
            {
               var_432 = const_444;
            }
         }
         else if(param1.length > 1)
         {
            var_432 = const_489;
         }
         else
         {
            var_432 = const_1382;
         }
      }
      
      public function get priceType() : String
      {
         return var_631;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_432)
         {
            case const_480:
               var_431 = new SingleProductContainer(this,param1);
               break;
            case const_444:
               var_431 = new MultiProductContainer(this,param1);
               break;
            case const_489:
               var_431 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_432);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1339;
      }
      
      private function analyzePriceType() : void
      {
         if(var_909 > 0 && var_908 > 0)
         {
            var_631 = const_481;
         }
         else if(var_909 > 0)
         {
            var_631 = const_358;
         }
         else if(var_908 > 0)
         {
            var_631 = const_461;
         }
         else
         {
            var_631 = const_920;
         }
      }
   }
}
