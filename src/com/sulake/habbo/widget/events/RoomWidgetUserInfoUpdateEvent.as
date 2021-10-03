package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_202:String = "RWUIUE_PEER";
      
      public static const const_198:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1297:String = "BOT";
      
      public static const const_862:int = 2;
      
      public static const const_1367:int = 0;
      
      public static const const_1036:int = 3;
       
      
      private var var_469:String = "";
      
      private var var_1403:String = "";
      
      private var var_2059:Boolean = false;
      
      private var var_2065:int = 0;
      
      private var var_2064:int = 0;
      
      private var var_2063:Boolean = false;
      
      private var var_1404:String = "";
      
      private var var_2056:Boolean = false;
      
      private var var_1013:int = 0;
      
      private var var_2055:Boolean = true;
      
      private var var_1034:int = 0;
      
      private var var_2061:Boolean = false;
      
      private var var_1319:Boolean = false;
      
      private var var_2068:Boolean = false;
      
      private var var_2060:int = 0;
      
      private var var_2067:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_267:Array;
      
      private var var_1318:Boolean = false;
      
      private var _name:String = "";
      
      private var var_2057:int = 0;
      
      private var var_2066:Boolean = false;
      
      private var var_2062:int = 0;
      
      private var var_2058:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_267 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_2064;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_2064 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2059;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2055;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2055 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2056 = param1;
      }
      
      public function get motto() : String
      {
         return var_1403;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2061 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1319;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1403 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2066;
      }
      
      public function get groupBadgeId() : String
      {
         return var_2058;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1319 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2067;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_2060 = param1;
      }
      
      public function get badges() : Array
      {
         return var_267;
      }
      
      public function get amIController() : Boolean
      {
         return var_2063;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2063 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2066 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2062 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_2058 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1404 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2056;
      }
      
      public function set figure(param1:String) : void
      {
         var_469 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_2060;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1318;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2061;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_1013 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2062;
      }
      
      public function get realName() : String
      {
         return var_1404;
      }
      
      public function get figure() : String
      {
         return var_469;
      }
      
      public function set webID(param1:int) : void
      {
         var_2057 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_267 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2068 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2067 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_1013;
      }
      
      public function get webID() : int
      {
         return var_2057;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1034 = param1;
      }
      
      public function get xp() : int
      {
         return var_2065;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2059 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1034;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2068;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1318 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_2065 = param1;
      }
   }
}
