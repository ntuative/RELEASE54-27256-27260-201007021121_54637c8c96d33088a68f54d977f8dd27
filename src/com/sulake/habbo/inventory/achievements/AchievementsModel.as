package com.sulake.habbo.inventory.achievements
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.achievements.GetAchievementsComposer;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class AchievementsModel implements IInventoryModel
   {
       
      
      private var var_385:Array;
      
      private var _view:AchievementsView;
      
      private var var_357:ISessionDataManager;
      
      private var _disposed:Boolean = false;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _assets:IAssetLibrary;
      
      private var _controller:HabboInventory;
      
      public function AchievementsModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IHabboLocalizationManager, param6:ISessionDataManager)
      {
         super();
         _controller = param1;
         _assets = param4;
         _communication = param3;
         var_357 = param6;
         var_357.events.addEventListener(BadgeImageReadyEvent.const_113,onBadgeImageReady);
         var_385 = new Array();
         _view = new AchievementsView(this,param2,param4,param5);
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _view.getWindowContainer();
      }
      
      public function addAchievement(param1:Achievement, param2:Boolean = true) : void
      {
         var _loc5_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < var_385.length)
         {
            _loc5_ = var_385[_loc4_] as Achievement;
            if(_loc5_.type == param1.type && _loc5_.level < param1.level)
            {
               _loc5_.level = param1.level;
               _loc5_.badgeId = param1.badgeId;
               _loc5_.image = var_357.getBadgeImage(param1.badgeId);
               _loc3_ = true;
            }
            _loc4_++;
         }
         if(!_loc3_)
         {
            param1.image = var_357.getBadgeImage(param1.badgeId);
            var_385.push(param1);
         }
         if(param2)
         {
            refreshViews();
         }
      }
      
      public function removeAchievement(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         if(true)
         {
            return;
         }
         _loc4_ = var_385[0] as Achievement;
         if(_loc4_.badgeId == param1 && _loc4_.level == param2)
         {
            var_385.slice(0,1);
         }
         refreshViews();
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         _communication.getHabboMainConnection(null).send(new GetAchievementsComposer());
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_349 && false)
         {
            _controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_ACHIEVEMENTS));
         }
      }
      
      public function refreshViews() : void
      {
         _view.updateList();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _controller = null;
            if(_view != null)
            {
               _view.dispose();
            }
            _assets = null;
            _communication = null;
            if(var_357 != null)
            {
               var_357.events.removeEventListener(BadgeImageReadyEvent.const_113,onBadgeImageReady);
               var_357 = null;
            }
            _disposed = true;
         }
      }
      
      public function getAchievements() : Array
      {
         var _loc3_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < var_385.length)
         {
            _loc3_ = var_385[_loc2_] as Achievement;
            _loc1_.push(_loc3_);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < var_385.length)
         {
            _loc3_ = var_385[_loc2_];
            if(_loc3_.badgeId == param1.badgeId)
            {
               _loc3_.image = param1.badgeImage;
               _view.updateListItem(_loc2_,_loc3_);
               return;
            }
            _loc2_++;
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
   }
}
