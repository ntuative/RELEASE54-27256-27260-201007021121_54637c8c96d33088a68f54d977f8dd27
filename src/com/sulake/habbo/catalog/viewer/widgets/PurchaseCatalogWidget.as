package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2138:XML;
      
      private var var_1640:ITextWindow;
      
      private var var_1639:ITextWindow;
      
      private var var_2139:XML;
      
      private var var_940:IWindowContainer;
      
      private var var_2473:ITextWindow;
      
      private var var_2137:String = "";
      
      private var var_2536:IButtonWindow;
      
      private var var_2136:XML;
      
      private var var_1638:ITextWindow;
      
      private var var_2140:XML;
      
      private var var_941:IButtonWindow;
      
      private var var_79:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_358:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2139) as IWindowContainer;
               break;
            case Offer.const_461:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2140) as IWindowContainer;
               break;
            case Offer.const_481:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2138) as IWindowContainer;
               break;
            case Offer.const_614:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2136) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_940 != null)
            {
               _window.removeChild(var_940);
               var_940.dispose();
            }
            var_940 = _loc2_;
            _window.addChild(_loc2_);
            var_940.x = 0;
            var_940.y = 0;
         }
         var_1638 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1639 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1640 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2473 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_941 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_941 != null)
         {
            var_941.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_941.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_79 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_79,page,var_2137);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2139 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2140 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2138 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2136 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_1057,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2137 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_79 = param1.offer;
         attachStub(var_79.priceType);
         if(var_1638 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_79.priceInCredits));
            var_1638.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1639 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_79.priceInPixels));
            var_1639.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1640 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_79.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_79.priceInPixels));
            var_1640.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_941 != null)
         {
            var_941.enable();
         }
      }
   }
}
