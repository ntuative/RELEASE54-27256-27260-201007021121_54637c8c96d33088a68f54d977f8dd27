package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2005:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_132:TutorialUI;
      
      private var var_741:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_60:HelpUI;
      
      private var var_742:IHabboConfigurationManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_624:HotelMergeUI;
      
      private var var_313:IHabboCommunicationManager;
      
      private var var_898:FaqIndex;
      
      private var var_1809:String = "";
      
      private var var_1072:IncomingMessages;
      
      private var var_1321:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1321 = new CallForHelpData();
         var_2005 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_898 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_60 != null)
         {
            var_60.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_60 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_60.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_132 != null)
         {
            var_132.dispose();
            var_132 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1809;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_60 != null)
         {
            var_60.dispose();
            var_60 = null;
         }
         if(var_132 != null)
         {
            var_132.dispose();
            var_132 = null;
         }
         if(var_624)
         {
            var_624.dispose();
            var_624 = null;
         }
         if(var_898 != null)
         {
            var_898.dispose();
            var_898 = null;
         }
         var_1072 = null;
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(var_741)
         {
            var_741.release(new IIDHabboLocalizationManager());
            var_741 = null;
         }
         if(var_313)
         {
            var_313.release(new IIDHabboCommunicationManager());
            var_313 = null;
         }
         if(var_742)
         {
            var_742.release(new IIDHabboConfigurationManager());
            var_742 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_741;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_92:
               if(var_60 != null)
               {
                  var_60.setRoomSessionStatus(true);
               }
               if(var_132 != null)
               {
                  var_132.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_110:
               if(var_60 != null)
               {
                  var_60.setRoomSessionStatus(false);
               }
               if(var_132 != null)
               {
                  var_132.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_60 != null)
         {
            var_60.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2005;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_60 != null)
         {
            var_60.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_624)
         {
            var_624 = new HotelMergeUI(this);
         }
         var_624.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_132 == null && _assetLibrary != null && _windowManager != null)
         {
            var_132 = new TutorialUI(this);
         }
         return var_132 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_60 == null && _assetLibrary != null && _windowManager != null)
         {
            var_60 = new HelpUI(this,_assetLibrary,_windowManager,var_741,_toolbar);
         }
         return var_60 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1321;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1321.reportedUserId = param1;
         var_1321.reportedUserName = param2;
         var_60.showUI(HabboHelpViewEnum.const_327);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1809 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(_toolbar != null)
         {
            _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_135,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_741 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_132 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_132.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_313 = IHabboCommunicationManager(param2);
         var_1072 = new IncomingMessages(this,var_313);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_60 != null)
         {
            var_60.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_60 != null)
         {
            var_60.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_313 != null && param1 != null)
         {
            var_313.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_898;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_60 != null)
         {
            var_60.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_742 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_132;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_86)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_55)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_624;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_92,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_110,onRoomSessionEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_86,onHabboToolbarEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_55,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_60 != null)
         {
            var_60.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_742 == null)
         {
            return param1;
         }
         return var_742.getKey(param1,param2,param3);
      }
   }
}
