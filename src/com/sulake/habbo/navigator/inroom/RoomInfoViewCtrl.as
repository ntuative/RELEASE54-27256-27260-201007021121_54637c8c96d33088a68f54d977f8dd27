package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.GetEventsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.navigator.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_794:IWindowContainer;
      
      private var var_1154:ITextWindow;
      
      private var var_189:RoomSettingsCtrl;
      
      private var var_1435:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_216:Timer;
      
      private var var_2252:IWindowContainer;
      
      private var var_1432:ITextWindow;
      
      private var var_384:IWindowContainer;
      
      private var var_2253:ITextWindow;
      
      private var var_972:IWindowContainer;
      
      private var var_215:UserDefinedRoomEventsCtrl;
      
      private var var_1662:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_756:ITextWindow;
      
      private var var_1666:IWindowContainer;
      
      private var var_1434:IWindowContainer;
      
      private var var_973:ITextWindow;
      
      private var var_1152:ITextFieldWindow;
      
      private var var_289:IWindowContainer;
      
      private var var_970:ITextWindow;
      
      private var var_1665:IButtonWindow;
      
      private var var_1153:ITextWindow;
      
      private var var_2479:int;
      
      private var var_1430:IContainerButtonWindow;
      
      private var var_971:IWindowContainer;
      
      private var var_1436:ITextWindow;
      
      private var var_1431:IContainerButtonWindow;
      
      private var var_1663:ITextWindow;
      
      private var var_873:TagRenderer;
      
      private var var_1664:IButtonWindow;
      
      private var var_1835:ITextWindow;
      
      private var var_331:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_793:ITextWindow;
      
      private var var_252:RoomThumbnailCtrl;
      
      private var var_1433:IContainerButtonWindow;
      
      private var var_2254:IWindowContainer;
      
      private var var_290:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_331 = new RoomEventViewCtrl(_navigator);
         var_189 = new RoomSettingsCtrl(_navigator,this,true);
         var_252 = new RoomThumbnailCtrl(_navigator);
         var_215 = new UserDefinedRoomEventsCtrl(_navigator);
         var_873 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_189);
         var_216 = new Timer(6000,1);
         var_216.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_189.active = true;
         this.var_331.active = false;
         this.var_252.active = false;
         this.var_215.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1662.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1664.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1666.visible = Util.hasVisibleChildren(var_1666);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_756.text = param1.roomName;
         var_756.height = NaN;
         _ownerName.text = param1.ownerName;
         var_973.text = param1.description;
         var_873.refreshTags(var_384,param1.tags);
         var_973.visible = false;
         if(param1.description != "")
         {
            var_973.height = NaN;
            var_973.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_384,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_384,"thumb_down",_loc3_,onThumbDown,0);
         var_2253.visible = _loc3_;
         var_970.visible = !_loc3_;
         var_1663.visible = !_loc3_;
         var_1663.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_384,"home",param2,null,0);
         _navigator.refreshButton(var_384,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_384,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_756.y,0);
         var_384.visible = true;
         var_384.height = Util.getLowestPoint(var_384);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function method_9() : void
      {
         this.var_216.reset();
         this.var_189.active = false;
         this.var_331.active = false;
         this.var_252.active = false;
         this.var_215.active = true;
         _navigator.send(new GetEventsMessageComposer());
      }
      
      public function dispose() : void
      {
         if(var_216)
         {
            var_216.removeEventListener(TimerEvent.TIMER,hideInfo);
            var_216.reset();
            var_216 = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_506,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false || false)
         {
            return;
         }
         var_1665.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1435.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1433.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1430.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1431.visible = _navigator.data.canEditRoomSettings && param1;
         var_1434.visible = Util.hasVisibleChildren(var_1434);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_216.reset();
         this.var_331.active = false;
         this.var_189.active = false;
         this.var_252.active = false;
         this.var_215.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_43,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_216.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_216.reset();
         this.var_331.active = false;
         this.var_189.active = false;
         this.var_252.active = false;
         this.var_215.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_43,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_506,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_289);
         var_289.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == _navigator.data.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_189.refresh(var_289);
         this.var_252.refresh(var_289);
         this.var_215.refresh(var_289);
         Util.moveChildrenToColumn(var_289,["room_details","room_buttons"],0,2);
         var_289.height = Util.getLowestPoint(var_289);
         var_289.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1152.setSelection(0,var_1152.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_290);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_331.refresh(var_290);
         if(Util.hasVisibleChildren(var_290) && !(this.var_252.active || this.var_215.active))
         {
            Util.moveChildrenToColumn(var_290,["event_details","event_buttons"],0,2);
            var_290.height = Util.getLowestPoint(var_290);
            var_290.visible = true;
         }
         else
         {
            var_290.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_216.reset();
         this.var_331.active = true;
         this.var_189.active = false;
         this.var_252.active = false;
         this.var_215.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_216.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_1154.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1154.height = NaN;
         var_1432.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1432.height = NaN;
         Util.moveChildrenToColumn(var_794,["public_space_name","public_space_desc"],var_1154.y,0);
         var_794.visible = true;
         var_794.height = Math.max(86,Util.getLowestPoint(var_794));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function get userDefinedRoomEventsCtrl() : UserDefinedRoomEventsCtrl
      {
         return var_215;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","IsOfferGiftableMessageEvent") == "true";
         if(_loc1_ && true && true && true && true)
         {
            var_971.visible = true;
            var_1152.text = this.getEmbedData();
         }
         else
         {
            var_971.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_216.reset();
         this.var_189.load(param1);
         this.var_189.active = true;
         this.var_331.active = false;
         this.var_252.active = false;
         this.var_215.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_216.reset();
         this.var_189.active = false;
         this.var_331.active = false;
         this.var_252.active = true;
         this.var_215.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_65,false);
         _window.setParamFlag(HabboWindowParam.const_1263,true);
         _window.visible = false;
         var_289 = IWindowContainer(find("room_info"));
         var_384 = IWindowContainer(find("room_details"));
         var_794 = IWindowContainer(find("public_space_details"));
         var_2254 = IWindowContainer(find("owner_name_cont"));
         var_2252 = IWindowContainer(find("rating_cont"));
         var_1434 = IWindowContainer(find("room_buttons"));
         var_756 = ITextWindow(find("room_name"));
         var_1154 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_973 = ITextWindow(find("room_desc"));
         var_1432 = ITextWindow(find("public_space_desc"));
         var_1153 = ITextWindow(find("owner_caption"));
         var_970 = ITextWindow(find("rating_caption"));
         var_2253 = ITextWindow(find("rate_caption"));
         var_1663 = ITextWindow(find("rating_txt"));
         var_290 = IWindowContainer(find("event_info"));
         var_972 = IWindowContainer(find("event_details"));
         var_1666 = IWindowContainer(find("event_buttons"));
         var_1835 = ITextWindow(find("event_name"));
         var_793 = ITextWindow(find("event_desc"));
         var_1435 = IContainerButtonWindow(find("add_favourite_button"));
         var_1433 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1430 = IContainerButtonWindow(find("make_home_button"));
         var_1431 = IContainerButtonWindow(find("unmake_home_button"));
         var_1665 = IButtonWindow(find("room_settings_button"));
         var_1662 = IButtonWindow(find("create_event_button"));
         var_1664 = IButtonWindow(find("edit_event_button"));
         var_971 = IWindowContainer(find("embed_info"));
         var_1436 = ITextWindow(find("embed_info_txt"));
         var_1152 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1435,onAddFavouriteClick);
         Util.setProcDirectly(var_1433,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1665,onRoomSettingsClick);
         Util.setProcDirectly(var_1430,onMakeHomeClick);
         Util.setProcDirectly(var_1431,onUnmakeHomeClick);
         Util.setProcDirectly(var_1662,onEventSettingsClick);
         Util.setProcDirectly(var_1664,onEventSettingsClick);
         Util.setProcDirectly(var_1152,onEmbedSrcClick);
         _navigator.refreshButton(var_1435,"favourite",true,null,0);
         _navigator.refreshButton(var_1433,"favourite",true,null,0);
         _navigator.refreshButton(var_1430,"home",true,null,0);
         _navigator.refreshButton(var_1431,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_289,onHover);
         Util.setProcDirectly(var_290,onHover);
         var_1153.width = var_1153.textWidth;
         Util.moveChildrenToRow(var_2254,["owner_caption","owner_name"],var_1153.x,var_1153.y,3);
         var_970.width = var_970.textWidth;
         Util.moveChildrenToRow(var_2252,["rating_caption","rating_txt"],var_970.x,var_970.y,3);
         var_1436.height = NaN;
         Util.moveChildrenToColumn(var_971,["embed_info_txt","embed_src_txt"],var_1436.y,2);
         var_971.height = Util.getLowestPoint(var_971) + 5;
         var_2479 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1835.text = param1.eventName;
         var_793.text = param1.eventDescription;
         var_873.refreshTags(var_972,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_793.visible = false;
         if(param1.eventDescription != "")
         {
            var_793.height = NaN;
            var_793.y = Util.getLowestPoint(var_972) + 2;
            var_793.visible = true;
         }
         var_972.visible = true;
         var_972.height = Util.getLowestPoint(var_972);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_946,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
