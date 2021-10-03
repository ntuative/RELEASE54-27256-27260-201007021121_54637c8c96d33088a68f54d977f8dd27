package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1114:int = 100;
      
      private static const const_1112:int = 200;
      
      private static const const_1113:int = 180;
      
      public static const const_841:int = 1;
      
      public static const const_499:int = 2;
      
      private static const const_1111:int = 250;
      
      private static const const_797:int = 5;
       
      
      private var var_632:BitmapData;
      
      private var var_318:Timer;
      
      private var var_12:IWindowContainer;
      
      private var var_751:BitmapData;
      
      private var var_317:Timer;
      
      private var var_75:IWindowContainer;
      
      private var var_1590:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_317 = new Timer(const_1111,1);
         var_318 = new Timer(const_1114,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_75 = param1;
         var_75.visible = false;
         _assets = param2;
         var_317.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_318.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_751 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_632 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_75.visible = false;
         var_318.reset();
         var_317.reset();
         if(var_12 != null)
         {
            var_12.removeChild(var_75);
         }
      }
      
      public function hideDelayed() : void
      {
         var_318.reset();
         var_317.reset();
         var_318.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_317 != null)
         {
            var_317.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_317.stop();
            var_317 = null;
         }
         if(var_318 != null)
         {
            var_318.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_318.stop();
            var_318 = null;
         }
         _assets = null;
         var_75 = null;
         var_12 = null;
         var_632 = null;
         var_751 = null;
      }
      
      public function showDelayed() : void
      {
         var_318.reset();
         var_317.reset();
         var_317.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_75 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_12 != null)
         {
            var_12.removeChild(var_75);
         }
         var_12 = param1;
         var_1590 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_75.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_75.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1113,param3.width),Math.min(const_1112,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_75.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_75 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_75.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_841:
               _loc2_.bitmap = var_751.clone();
               _loc2_.width = var_751.width;
               _loc2_.height = var_751.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_499:
               _loc2_.bitmap = var_632.clone();
               _loc2_.width = var_632.width;
               _loc2_.height = var_632.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_318.reset();
         var_317.reset();
         if(var_12 == null)
         {
            return;
         }
         var_75.visible = true;
         var_12.addChild(var_75);
         refreshArrow(var_1590);
         switch(var_1590)
         {
            case const_841:
               var_75.x = 0 - const_797;
               break;
            case const_499:
               var_75.x = var_12.width + const_797;
         }
         var_75.y = (0 - 0) / 2;
      }
   }
}
