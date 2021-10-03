package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_565:ToolbarIconGroup;
      
      private var var_1160:Boolean = false;
      
      private var var_2267:String;
      
      private var var_870:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1161:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_37:String = "-1";
      
      private var var_104:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_803:String;
      
      private var var_2247:int;
      
      private var var_802:Timer;
      
      private var var_1572:Array;
      
      private var var_1158:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2480:Array;
      
      private var var_291:ToolbarBarMenuAnimator;
      
      private var var_460:ToolbarIconAnimator;
      
      private var var_671:Array;
      
      private var var_980:Array;
      
      private var var_979:String = "-1";
      
      private var var_2539:Boolean = true;
      
      private var var_1159:Array;
      
      private var var_1442:Timer;
      
      private var var_2266:int;
      
      private var var_91:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_671 = new Array();
         var_980 = new Array();
         var_2480 = new Array();
         var_1158 = new ToolbarIconBouncer(0.8,1);
         super();
         var_565 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_803 = param4;
         _events = param5;
         var_291 = param6;
         var_1442 = new Timer(40,40);
         var_1442.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_104 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_382,HabboWindowStyle.const_34,HabboWindowParam.const_37,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_104.background = true;
         var_104.mouseTreshold = 0;
         var_104.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_34,HabboWindowParam.const_34,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_104.addChild(_window);
         _window.addEventListener(WindowEvent.const_42,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1572[var_1159.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_2266;
      }
      
      public function get iconId() : String
      {
         return var_803;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_870 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_37 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_104 == null || _window == null)
         {
            return;
         }
         var_104.width = _window.width;
         var_104.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_91 = (0 - 0) / 2;
            _y = var_870 + (0 - 0) / 2;
         }
         else
         {
            var_91 = var_870 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_104.x = var_91;
         var_104.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_104 != null)
         {
            var_104.dispose();
            var_104 = null;
         }
         var_671 = null;
         var_980 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_291 = null;
         var_460 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_671.indexOf(param1) < 0)
         {
            var_671.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_980.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1160)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_291)
               {
                  var_291.repositionWindow(var_803,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_55);
                  _loc4_.iconId = var_803;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1161;
                  }
               }
               break;
            case WindowMouseEvent.const_27:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_979;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_671.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_980[var_671.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1160 = param1;
         if(var_104 != null)
         {
            var_104.visible = var_1160;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_104 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_104.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_104.toolTipCaption = "${toolbar.icon.tooltip." + var_2267.toLowerCase() + "}";
         }
         var_104.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_291 != null)
         {
            var_291.animateWindowIn(this,param1,param2,var_803,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_460 != null && _window != null)
         {
            var_460.update(_window);
            if(var_460.hasNextState())
            {
               state = var_460.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1572 = new Array();
         var_1159 = new Array();
         var_2267 = param1.@id;
         var_2266 = int(param1.@window_offset_from_icon);
         var_2247 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1161 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_979 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1159.push(_loc5_.id);
               var_1572.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1161 == "-1")
                  {
                     var_1161 = _loc5_.id;
                  }
                  if(var_979 == "-1")
                  {
                     var_979 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_37 = var_979;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_291 != null)
         {
            var_291.hideWindow(param1,param2,var_803,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_291 != null)
         {
            var_291.positionWindow(this,param1,param2,var_803,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_291 != null)
         {
            var_291.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1160;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1158 != null && _window != null)
         {
            var_1158.update();
            _window.y = var_1158.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_802 != null)
         {
            var_802.stop();
            var_802 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1160)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_460 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_91,_y,_bitmapData);
            if(false)
            {
               var_802 = new Timer(_loc1_.timer);
               var_802.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_802.start();
            }
            if(_loc1_.bounce)
            {
               var_1158.reset(-7);
               var_1442.reset();
               var_1442.start();
            }
         }
         else
         {
            var_460 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_2247 + var_565.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_37);
      }
      
      public function get window() : IWindow
      {
         return var_104;
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_980[var_671.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_565;
      }
   }
}
