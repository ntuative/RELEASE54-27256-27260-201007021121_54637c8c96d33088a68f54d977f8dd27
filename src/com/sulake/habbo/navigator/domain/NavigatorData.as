package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvents;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1496:int = 10;
       
      
      private var var_2349:Boolean;
      
      private var var_2345:int;
      
      private var var_1464:int;
      
      private var var_2352:Boolean;
      
      private var var_1180:Array;
      
      private var var_1001:Dictionary;
      
      private var var_1179:Array;
      
      private var var_2489:int;
      
      private var var_2344:int;
      
      private var var_2346:UserDefinedRoomEvents;
      
      private var var_1705:int;
      
      private var var_2348:int;
      
      private var var_1993:int;
      
      private var var_681:PublicRoomShortData;
      
      private var var_472:RoomEventData;
      
      private var var_151:MsgWithRequestId;
      
      private var var_2347:Boolean;
      
      private var var_2351:Array;
      
      private var _navigator:HabboNavigator;
      
      private var var_2350:Boolean;
      
      private var var_221:GuestRoomData;
      
      private var var_821:Boolean;
      
      private var var_682:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1180 = new Array();
         var_1179 = new Array();
         var_1001 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_151 != null && var_151 as PopularRoomTagsData != null;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2350;
      }
      
      public function startLoading() : void
      {
         this.var_821 = true;
      }
      
      public function get createdFlatId() : int
      {
         return var_2345;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2350 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_472 != null)
         {
            var_472.dispose();
         }
         var_472 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function get homeRoomId() : int
      {
         return var_1705;
      }
      
      public function get stuffStates() : Array
      {
         return var_2351;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_151 != null && var_151 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_151 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_221;
      }
      
      public function get allCategories() : Array
      {
         return var_1180;
      }
      
      public function onRoomExit() : void
      {
         if(var_472 != null)
         {
            var_472.dispose();
            var_472 = null;
         }
         if(var_681 != null)
         {
            var_681.dispose();
            var_681 = null;
         }
         if(var_221 != null)
         {
            var_221.dispose();
            var_221 = null;
         }
         var_682 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_151 = param1;
         var_821 = false;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_221 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1705 == _loc1_;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_151 = param1;
         var_821 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_681 = null;
         var_221 = null;
         var_682 = false;
         if(param1.guestRoom)
         {
            var_682 = param1.owner;
         }
         else
         {
            var_681 = param1.publicSpace;
            var_472 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return var_682;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2489 = param1.limit;
         this.var_1464 = param1.favouriteRoomIds.length;
         this.var_1001 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_1001[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_151 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return var_2349;
      }
      
      public function set stuffStates(param1:Array) : void
      {
         var_2351 = param1;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_681;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_151 = param1;
         var_821 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1993 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_221 != null && var_682;
      }
      
      public function get userDefinedRoomEvents() : UserDefinedRoomEvents
      {
         return var_2346;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2352;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1180 = param1;
         var_1179 = new Array();
         for each(_loc2_ in var_1180)
         {
            if(_loc2_.visible)
            {
               var_1179.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2344;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2348;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1179;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_151 == null)
         {
            return;
         }
         var_151.dispose();
         var_151 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         var_2349 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_472;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_1001[param1] = !!param2 ? "yes" : null;
         var_1464 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_151 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1993;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_151 != null && var_151 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2352 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2344 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2347 = param1;
      }
      
      public function set userDefinedRoomEvents(param1:UserDefinedRoomEvents) : void
      {
         var_2346 = param1;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_821;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         var_1705 = param1;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1464 >= var_2489;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_221 != null)
         {
            var_221.dispose();
         }
         var_221 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2348 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2347;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_221 != null && !var_682;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2345 = param1;
      }
   }
}
