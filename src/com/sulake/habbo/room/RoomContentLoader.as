package com.sulake.habbo.room
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectLogicEnum;
   import com.sulake.habbo.room.object.RoomObjectVisualizationEnum;
   import com.sulake.habbo.room.utils.PublicRoomData;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.room.IRoomContentLoader;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   
   public class RoomContentLoader implements IRoomContentLoader, IFurniDataListener, IDisposable
   {
      
      private static const const_787:String = "selection_arrow";
      
      private static const const_788:String = "tile_cursor";
      
      private static const const_296:String = "RCL_PUBLICROOM_";
      
      private static const const_516:String = "wall_place_holder";
      
      private static const name_2:int = 2;
      
      private static const const_364:String = "place_holder";
      
      private static const const_1104:String = const_364;
      
      private static const const_1471:int = 0;
      
      private static const const_786:int = 1;
      
      private static const ROOM_CONTENT:String = "room";
      
      public static const const_695:String = "RCL_LOADER_READY";
       
      
      private var _isDisposed:Boolean = false;
      
      private var var_518:Map = null;
      
      private var _libraries:Map = null;
      
      private var var_1986:String;
      
      private var var_464:IRoomObjectVisualizationFactory = null;
      
      private var var_520:Array;
      
      private var _events:Map = null;
      
      private var var_423:Map = null;
      
      private var var_1083:IEventDispatcher = null;
      
      private var var_1309:Map = null;
      
      private var var_521:Map = null;
      
      private var var_1310:Boolean = false;
      
      private var var_519:Map = null;
      
      private var var_619:Map = null;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_1988:Boolean = false;
      
      private var var_37:int = 0;
      
      private var _wallItems:Array;
      
      private var var_1989:String;
      
      private var var_1987:Array;
      
      private var var_424:Map = null;
      
      private var var_1984:String;
      
      private var var_357:ISessionDataManager;
      
      private var var_1985:String;
      
      private var var_618:Map = null;
      
      private var var_1990:Array;
      
      private var var_366:Map = null;
      
      private var var_178:PublicRoomData = null;
      
      public function RoomContentLoader()
      {
         var_520 = [];
         _wallItems = [];
         var_1990 = ["hh_people_pool","hh_people_pool_calippo","hh_paalu","hh_people_paalu"];
         var_1987 = ["room_public","room_public_park","room_public_pool"];
         super();
         _libraries = new Map();
         _events = new Map();
         _assetLibrary = new AssetLibrary("room_engine");
         var_518 = new Map();
         var_519 = new Map();
         var_619 = new Map();
         var_521 = new Map();
         var_424 = new Map();
         var_423 = new Map();
         var_366 = new Map();
         var_618 = new Map();
         var_1309 = new Map();
      }
      
      public function insertObjectContent(param1:int, param2:int, param3:IAssetLibrary) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:String = getAssetLibraryType(param3);
         switch(param2)
         {
            case RoomObjectCategoryEnum.const_28:
               var_518[param1] = _loc4_;
               break;
            case RoomObjectCategoryEnum.const_26:
               var_519[param1] = _loc4_;
               break;
            default:
               throw new Error("Registering content library for unsupported category " + param2 + "!");
         }
         var _loc5_:AssetLibraryCollection = addAssetLibraryCollection(_loc4_,null) as AssetLibraryCollection;
         if(_loc5_)
         {
            _loc5_.addAssetLibrary(param3);
            if(initializeGraphicAssetCollection(_loc4_,param3))
            {
               switch(param2)
               {
                  case RoomObjectCategoryEnum.const_28:
                     if(var_520.indexOf(_loc4_) == -1)
                     {
                        var_520.push(_loc4_);
                     }
                     break;
                  case RoomObjectCategoryEnum.const_26:
                     if(_wallItems.indexOf(_loc4_) == -1)
                     {
                        _wallItems.push(_loc4_);
                     }
                     break;
                  default:
                     throw new Error("Registering content library for unsupported category " + param2 + "!");
               }
               _loc6_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_340,_loc4_);
               _loc7_ = getAssetLibraryEventDispatcher(_loc4_,true);
               if(_loc7_)
               {
                  _loc7_.dispatchEvent(_loc6_);
               }
               return true;
            }
         }
         return false;
      }
      
      public function getWallItemColorIndex(param1:int) : int
      {
         var _loc2_:String = var_519.getValue(param1) as String;
         return getObjectColorIndex(_loc2_);
      }
      
      public function hasInternalContent(param1:String) : Boolean
      {
         if(param1 == RoomObjectVisualizationEnum.const_142 || param1 == RoomObjectVisualizationEnum.PET || param1 == RoomObjectVisualizationEnum.BOT)
         {
            return true;
         }
         return false;
      }
      
      private function getAssetLibraryType(param1:IAssetLibrary) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAsset = param1.getAssetByName("index");
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.@type;
      }
      
      private function getRoomObjectOriginalName(param1:String) : String
      {
         var _loc2_:* = null;
         if(var_423 != null)
         {
            _loc2_ = var_423.getValue(param1) as String;
         }
         if(_loc2_ == null)
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      private function getObjectType(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = param1.indexOf("*");
         if(_loc2_ >= 0)
         {
            param1 = param1.substr(0,_loc2_);
         }
         return param1;
      }
      
      private function extractPublicRoomFromXML(param1:String, param2:XML) : PublicRoomData
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = NaN;
         var _loc9_:* = NaN;
         var _loc3_:XMLList = param2.layoutData;
         var _loc4_:PublicRoomData = new PublicRoomData(param1);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length())
         {
            _loc6_ = _loc3_[_loc5_];
            _loc7_ = const_296 + String(_loc6_.@name);
            _loc8_ = 32;
            _loc9_ = 1;
            if(String(_loc6_.@size) != "")
            {
               _loc8_ = Number(parseInt(_loc6_.@size));
            }
            if(String(_loc6_.@heightScale) != "")
            {
               _loc9_ = Number(parseFloat(_loc6_.@heightScale));
            }
            _loc4_.addWorld(_loc7_,_loc8_,_loc9_);
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function initFurniData() : void
      {
         if(var_357 == null)
         {
            var_1310 = true;
            return;
         }
         var _loc1_:Array = var_357.getFurniData(this);
         if(_loc1_ == null)
         {
            return;
         }
         populateFurniData(_loc1_);
         var_1988 = true;
         continueInitilization();
      }
      
      public function getPublicRoomContentType(param1:String) : String
      {
         if(var_178 != null && var_178.hasWorldType(const_296 + param1))
         {
            return var_178.type;
         }
         return param1;
      }
      
      public function getContentType(param1:String) : String
      {
         if(param1.indexOf("@shadow") > -1)
         {
            if(param1.indexOf("@shadow") == param1.length - 7)
            {
               param1 = param1.substr(0,param1.length - 7);
            }
         }
         return param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(_libraries != null)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = _libraries.getWithIndex(_loc2_) as AssetLibrary;
               if(_loc3_ != null)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            _libraries.dispose();
            _libraries = null;
         }
         if(_events != null)
         {
            _events.dispose();
            _events = null;
         }
         if(var_518 != null)
         {
            var_518.dispose();
            var_518 = null;
         }
         if(var_519 != null)
         {
            var_519.dispose();
            var_519 = null;
         }
         if(_assetLibrary != null)
         {
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         if(var_521 != null)
         {
            var_521.dispose();
            var_521 = null;
         }
         if(var_424 != null)
         {
            var_424.dispose();
            var_424 = null;
         }
         if(var_423 != null)
         {
            var_423.dispose();
            var_423 = null;
         }
         if(var_619 != null)
         {
            var_619.dispose();
            var_619 = null;
         }
         if(var_366 != null)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc4_ = var_366.getWithIndex(_loc2_) as IGraphicAssetCollection;
               if(_loc4_ != null)
               {
                  _loc4_.dispose();
               }
               _loc2_++;
            }
            var_366.dispose();
            var_366 = null;
         }
         if(var_618 != null)
         {
            var_618.dispose();
            var_618 = null;
         }
         var_520 = [];
         _wallItems = [];
         var_1083 = null;
         var_357 = null;
         _isDisposed = true;
      }
      
      private function getAssetLibrary(param1:String) : IAssetLibrary
      {
         var _loc4_:* = null;
         var _loc2_:String = getContentType(param1);
         _loc2_ = getRoomObjectOriginalName(_loc2_);
         var _loc3_:IAssetLibrary = _libraries.getValue(getAssetLibraryName(_loc2_)) as IAssetLibrary;
         if(_loc3_ == null)
         {
            _loc4_ = var_618.getValue(_loc2_);
            if(_loc4_ != null)
            {
               _loc2_ = getContentType(_loc4_);
               _loc3_ = _libraries.getValue(getAssetLibraryName(_loc2_)) as IAssetLibrary;
            }
         }
         return _loc3_;
      }
      
      public function getPlaceHolderTypes() : Array
      {
         return [const_364,const_516,ROOM_CONTENT,const_788,const_787];
      }
      
      public function addGraphicAsset(param1:String, param2:String, param3:BitmapData, param4:Boolean) : Boolean
      {
         var _loc5_:IGraphicAssetCollection = getGraphicAssetCollection(param1);
         if(_loc5_ != null)
         {
            return _loc5_.addAsset(param2,param3,param4);
         }
         return false;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function getObjectRevision(param1:String) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = getObjectCategory(param1);
         if(_loc2_ == RoomObjectCategoryEnum.const_28 || _loc2_ == RoomObjectCategoryEnum.const_26)
         {
            if(param1.indexOf("poster") == 0)
            {
               param1 = "poster";
            }
            return int(var_521.getValue(param1));
         }
         return 0;
      }
      
      public function loadLegacyContent(param1:String, param2:IEventDispatcher) : Array
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:Array = param1.split(",");
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(_loc3_[_loc5_].toString().length > 0 && var_1990.indexOf(_loc3_[_loc5_]) == -1)
            {
               _loc6_ = _loc3_[_loc5_].toString();
               while(_loc6_.indexOf(" ") >= 0)
               {
                  if(_loc6_.indexOf(" ") == 0)
                  {
                     _loc6_ = _loc6_.substr(1,_loc6_.length - 1);
                  }
                  else if(_loc6_.indexOf(" ") == _loc6_.length - 1)
                  {
                     _loc6_ = _loc6_.substr(0,_loc6_.length - 2);
                  }
               }
               _loc4_.push(_loc6_);
            }
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            _loc7_ = _loc4_[0];
            _loc5_ = 1;
            while(_loc5_ < _loc4_.length)
            {
               _loc7_ += ",";
               _loc7_ += _loc4_[_loc5_];
               _loc5_++;
            }
            if(loadObjectContent(_loc7_,param2))
            {
               return [_loc4_[0]];
            }
         }
         return [];
      }
      
      public function getPlaceHolderType(param1:String) : String
      {
         if(var_520.indexOf(param1) >= 0)
         {
            return const_364;
         }
         if(_wallItems.indexOf(param1) >= 0)
         {
            return const_516;
         }
         if(var_178 != null && (var_178.type == param1 || var_178.hasWorldType(param1)))
         {
            return ROOM_CONTENT;
         }
         return const_1104;
      }
      
      public function extractObjectContent(param1:String, param2:String) : Boolean
      {
         var _loc3_:IAssetLibrary = getAssetLibrary(param1);
         var_618.add(param2,param1);
         if(initializeGraphicAssetCollection(param2,_loc3_))
         {
            return true;
         }
         var_618.remove(param2);
         return false;
      }
      
      public function getLogicType(param1:String) : String
      {
         var _loc6_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAssetLibrary = getAssetLibrary(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:IAsset = _loc2_.getAssetByName(param1 + "_index");
         if(_loc3_ == null)
         {
            _loc3_ = _loc2_.getAssetByName("index");
         }
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:XML = _loc3_.content as XML;
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:String = _loc4_.@logic;
         if(_loc5_ != RoomObjectLogicEnum.const_180 && _loc5_ != RoomObjectLogicEnum.const_142)
         {
            _loc6_ = "@shadow";
            if(param1.indexOf(_loc6_) > -1)
            {
               if(param1.indexOf(_loc6_) == param1.length - _loc6_.length)
               {
                  _loc5_ = "null";
               }
            }
         }
         return _loc5_;
      }
      
      public function getActiveObjectType(param1:int) : String
      {
         var _loc2_:String = var_518.getValue(param1) as String;
         return getObjectType(_loc2_);
      }
      
      public function furniDataReady() : void
      {
         initFurniData();
      }
      
      public function getRoomObjectAdURL(param1:String) : String
      {
         if(var_619.getValue(param1) != null)
         {
            return var_619.getValue(param1);
         }
         return "";
      }
      
      private function getObjectColorIndex(param1:String) : int
      {
         if(param1 == null)
         {
            return -1;
         }
         var _loc2_:int = 0;
         var _loc3_:int = param1.indexOf("*");
         if(_loc3_ >= 0)
         {
            _loc2_ = int(param1.substr(_loc3_ + 1));
         }
         return _loc2_;
      }
      
      private function onContentLoaded(param1:Event) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:IAssetLibrary = param1.target as IAssetLibrary;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:String = getAssetLibraryType(_loc2_);
         _loc5_ = getRoomObjectOriginalName(_loc5_);
         if(_loc5_ != null)
         {
            _loc4_ = initializeGraphicAssetCollection(_loc5_,_loc2_);
         }
         if(_loc4_)
         {
            if(var_1987.indexOf(getVisualizationType(_loc5_)) >= 0)
            {
               _loc7_ = getVisualizationXML(_loc5_);
               _loc8_ = extractPublicRoomFromXML(_loc5_,_loc7_);
               var_1309.add(_loc5_,_loc8_);
               var_178 = _loc8_;
               extractPublicRoomFurnitures(_loc5_,_loc2_);
            }
            _loc3_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_340,_loc5_);
         }
         else
         {
            _loc3_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_493,_loc5_);
         }
         var _loc6_:IEventDispatcher = getAssetLibraryEventDispatcher(_loc5_,true);
         if(_loc6_ != null && _loc3_ != null)
         {
            _loc6_.dispatchEvent(_loc3_);
         }
      }
      
      private function getRoomObjectAlias(param1:String) : String
      {
         var _loc2_:* = null;
         if(var_424 != null)
         {
            _loc2_ = var_424.getValue(param1) as String;
         }
         if(_loc2_ == null)
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      private function onContentLoadError(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         var _loc3_:Array = getPlaceHolderTypes();
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = getObjectContentURLs(_loc4_);
            if(_loc5_.length > 0 && _loc5_[0] == _loc2_.url)
            {
               Core.crash("Failed to load asset: " + _loc2_.url,Core.const_1411);
               return;
            }
         }
      }
      
      private function getAssetLibraryName(param1:String) : String
      {
         return "RoomContentLoader " + param1;
      }
      
      public function getWallItemType(param1:int, param2:String = null) : String
      {
         var _loc3_:String = var_519.getValue(param1) as String;
         if(_loc3_ == "poster" && param2 != null)
         {
            _loc3_ += param2;
         }
         return getObjectType(_loc3_);
      }
      
      public function getLogicXML(param1:String) : XML
      {
         return getXML(param1,"_logic");
      }
      
      public function getObjectCategory(param1:String) : int
      {
         if(param1 == null)
         {
            return RoomObjectCategoryEnum.const_191;
         }
         if(var_520.indexOf(param1) >= 0)
         {
            return RoomObjectCategoryEnum.const_28;
         }
         if(_wallItems.indexOf(param1) >= 0)
         {
            return RoomObjectCategoryEnum.const_26;
         }
         if(param1.indexOf("poster") == 0)
         {
            return RoomObjectCategoryEnum.const_26;
         }
         if(var_178 != null && (var_178.type == param1 || var_178.hasWorldType(param1)))
         {
            return RoomObjectCategoryEnum.const_63;
         }
         if(param1 == "room")
         {
            return RoomObjectCategoryEnum.const_63;
         }
         if(param1 == "user")
         {
            return RoomObjectCategoryEnum.const_33;
         }
         if(param1 == "pet")
         {
            return RoomObjectCategoryEnum.const_33;
         }
         if(param1 == "bot")
         {
            return RoomObjectCategoryEnum.const_33;
         }
         if(param1 == "tile_cursor" || param1 == "selection_arrow")
         {
            return RoomObjectCategoryEnum.const_281;
         }
         return RoomObjectCategoryEnum.const_191;
      }
      
      private function initializeGraphicAssetCollection(param1:String, param2:IAssetLibrary) : Boolean
      {
         var _loc5_:* = null;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         var _loc4_:IGraphicAssetCollection = createGraphicAssetCollection(param1,param2);
         if(_loc4_ != null)
         {
            _loc5_ = getAssetXML(param1);
            if(_loc4_.define(_loc5_))
            {
               _loc3_ = true;
            }
            else
            {
               disposeGraphicAssetCollection(param1);
            }
         }
         return _loc3_;
      }
      
      public function set sessionDataManager(param1:ISessionDataManager) : void
      {
         var_357 = param1;
         if(var_1310)
         {
            var_1310 = false;
            initFurniData();
         }
      }
      
      private function continueInitilization() : void
      {
         if(var_1988)
         {
            var_37 = name_2;
            if(var_1083 != null)
            {
               var_1083.dispatchEvent(new Event(const_695));
            }
         }
      }
      
      public function getPublicRoomWorldHeightScale(param1:String) : Number
      {
         if(var_178 != null)
         {
            return var_178.getWorldHeightScale(const_296 + param1);
         }
         return 1;
      }
      
      private function populateFurniData(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         for each(_loc2_ in param1)
         {
            _loc3_ = _loc2_.id;
            _loc4_ = _loc2_.name;
            if(_loc2_.colourIndex > 0)
            {
               _loc4_ = _loc4_ + "*" + _loc2_.colourIndex;
            }
            _loc5_ = _loc2_.revision;
            _loc6_ = _loc2_.adUrl;
            if(_loc6_.length > 0)
            {
               var_619.add(_loc4_,_loc6_);
            }
            _loc7_ = _loc2_.name;
            if(_loc2_.type == "s")
            {
               var_518.add(_loc3_,_loc4_);
               if(var_520.indexOf(_loc7_) < 0)
               {
                  var_520.push(_loc7_);
               }
            }
            else if(_loc2_.type == "i")
            {
               if(_loc4_ == "post.it")
               {
                  _loc4_ = "post_it";
                  _loc7_ = "post_it";
               }
               if(_loc4_ == "post.it.vd")
               {
                  _loc4_ = "post_it_vd";
                  _loc7_ = "post_it_vd";
               }
               var_519.add(_loc3_,_loc4_);
               if(_wallItems.indexOf(_loc7_) < 0)
               {
                  _wallItems.push(_loc7_);
               }
            }
            _loc8_ = var_521.getValue(_loc7_);
            if(_loc5_ > _loc8_)
            {
               var_521.remove(_loc7_);
               var_521.add(_loc7_,_loc5_);
            }
         }
      }
      
      public function getAssetXML(param1:String) : XML
      {
         return getXML(param1,"_assets");
      }
      
      private function getAssetLibraryEventDispatcher(param1:String, param2:Boolean = false) : IEventDispatcher
      {
         var _loc3_:String = getContentType(param1);
         if(!param2)
         {
            return _events.getValue(_loc3_);
         }
         return _events.remove(_loc3_);
      }
      
      private function getObjectContentURLs(param1:String) : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         _loc2_ = getContentType(param1);
         Logger.log("Getting content URL for object type: " + param1);
         switch(_loc2_)
         {
            case const_364:
               return ["PlaceHolderFurniture.swf"];
            case const_516:
               return ["PlaceHolderWallItem.swf"];
            case ROOM_CONTENT:
               return ["HabboRoomContent.swf"];
            case const_788:
               return ["TileCursor.swf"];
            case const_787:
               return ["SelectionArrow.swf"];
            default:
               _loc3_ = getObjectCategory(_loc2_);
               if(_loc3_ == RoomObjectCategoryEnum.const_28 || _loc3_ == RoomObjectCategoryEnum.const_26)
               {
                  _loc4_ = getRoomObjectAlias(_loc2_);
                  _loc5_ = var_1984;
                  _loc5_ = _loc5_.replace(/%typeid%/,_loc4_);
                  _loc6_ = getObjectRevision(_loc2_);
                  _loc5_ = _loc5_.replace(/%revision%/,_loc6_);
                  return [var_1986 + _loc5_];
               }
               _loc7_ = _loc2_.split(",");
               _loc8_ = [];
               _loc9_ = 0;
               while(_loc9_ < _loc7_.length)
               {
                  _loc10_ = var_1985;
                  _loc10_ = _loc10_.replace(/%typeid%/,_loc7_[_loc9_]);
                  _loc8_.push(var_1989 + _loc10_);
                  _loc9_++;
               }
               return _loc8_;
         }
      }
      
      public function set visualizationFactory(param1:IRoomObjectVisualizationFactory) : void
      {
         var_464 = param1;
      }
      
      public function initialize(param1:IEventDispatcher, param2:IHabboConfigurationManager) : void
      {
         if(var_37 >= const_786)
         {
            return;
         }
         var_1083 = param1;
         var_1986 = param2.getKey("flash.dynamic.download.url","furniture/");
         var_1984 = param2.getKey("flash.dynamic.download.name.template","%typeid%.swf");
         var_1989 = param2.getKey("public.room.dynamic.download.url","");
         var_1985 = param2.getKey("public.room.dynamic.download.name.template","%typeid%.swf");
         var_37 = const_786;
         initFurniData();
      }
      
      public function getGraphicAssetCollection(param1:String) : IGraphicAssetCollection
      {
         var _loc2_:String = getContentType(param1);
         return var_366.getValue(_loc2_) as IGraphicAssetCollection;
      }
      
      private function disposeGraphicAssetCollection(param1:String) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:String = getContentType(param1);
         if(false)
         {
            _loc3_ = var_366.remove(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.dispose();
            }
            return true;
         }
         return false;
      }
      
      private function addAssetLibraryCollection(param1:String, param2:IEventDispatcher) : IAssetLibrary
      {
         var _loc3_:String = getContentType(param1);
         var _loc4_:IAssetLibrary = getAssetLibrary(param1);
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         var _loc5_:String = getAssetLibraryName(_loc3_);
         _loc4_ = new AssetLibraryCollection(_loc5_);
         _libraries.add(_loc5_,_loc4_);
         if(param2 != null && getAssetLibraryEventDispatcher(param1) == null)
         {
            _events.add(_loc3_,param2);
         }
         return _loc4_;
      }
      
      public function setRoomObjectAlias(param1:String, param2:String) : void
      {
         if(var_424 != null)
         {
            var_424.remove(param1);
            var_424.add(param1,param2);
         }
         if(var_423 != null)
         {
            var_423.remove(param2);
            var_423.add(param2,param1);
         }
      }
      
      public function getVisualizationXML(param1:String) : XML
      {
         return getXML(param1,"_visualization");
      }
      
      public function getVisualizationType(param1:String) : String
      {
         var _loc6_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAssetLibrary = getAssetLibrary(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:IAsset = _loc2_.getAssetByName(param1 + "_index");
         if(_loc3_ == null)
         {
            _loc3_ = _loc2_.getAssetByName("index");
         }
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:XML = _loc3_.content as XML;
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:String = _loc4_.@visualization;
         if(_loc5_ != RoomObjectVisualizationEnum.const_180 && _loc5_ != RoomObjectVisualizationEnum.const_142)
         {
            _loc6_ = "@shadow";
            if(param1.indexOf(_loc6_) > -1)
            {
               if(param1.indexOf(_loc6_) == param1.length - _loc6_.length)
               {
                  _loc5_ = "null";
               }
            }
         }
         return _loc5_;
      }
      
      private function createGraphicAssetCollection(param1:String, param2:IAssetLibrary) : IGraphicAssetCollection
      {
         var _loc3_:IGraphicAssetCollection = getGraphicAssetCollection(param1);
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         if(param2 == null)
         {
            return null;
         }
         _loc3_ = var_464.createGraphicAssetCollection();
         if(_loc3_ != null)
         {
            _loc3_.assetLibrary = param2;
            var_366.add(param1,_loc3_);
         }
         return _loc3_;
      }
      
      public function isPublicRoomWorldType(param1:String) : Boolean
      {
         if(getObjectCategory(const_296 + param1) == RoomObjectCategoryEnum.const_63)
         {
            return true;
         }
         return false;
      }
      
      private function extractPublicRoomFurnitures(param1:String, param2:IAssetLibrary) : int
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param2 == null)
         {
            return 0;
         }
         var _loc3_:Array = param2.nameArray;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = _loc3_[_loc5_];
            if(_loc6_.indexOf("_index") > 0)
            {
               _loc7_ = _loc6_.slice(0,_loc6_.indexOf("_index"));
               if(extractObjectContent(param1,_loc7_))
               {
                  _loc4_++;
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function getXML(param1:String, param2:String) : XML
      {
         var _loc3_:IAssetLibrary = getAssetLibrary(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:String = getContentType(param1);
         var _loc5_:String = getRoomObjectAlias(_loc4_);
         var _loc6_:IAsset = _loc3_.getAssetByName(_loc5_ + param2);
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc7_:XML = _loc6_.content as XML;
         if(_loc7_ == null)
         {
            return null;
         }
         return _loc7_;
      }
      
      public function getActiveObjectColorIndex(param1:int) : int
      {
         var _loc2_:String = var_518.getValue(param1) as String;
         return getObjectColorIndex(_loc2_);
      }
      
      public function loadObjectContent(param1:String, param2:IEventDispatcher) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc3_:* = null;
         if(param1.indexOf(",") >= 0)
         {
            _loc3_ = param1;
            param1 = _loc3_.split(",")[0];
         }
         if(var_1309.getValue(param1) != null)
         {
            var_178 = var_1309.getValue(param1) as PublicRoomData;
         }
         if(getAssetLibrary(param1) != null || getAssetLibraryEventDispatcher(param1) != null)
         {
            return false;
         }
         var _loc4_:AssetLibraryCollection = addAssetLibraryCollection(param1,param2) as AssetLibraryCollection;
         if(_loc4_ == null)
         {
            return false;
         }
         if(_loc3_ != null)
         {
            _loc5_ = getObjectContentURLs(_loc3_);
         }
         else
         {
            _loc5_ = getObjectContentURLs(param1);
         }
         if(_loc5_ != null && _loc5_.length > 0)
         {
            _loc4_.addEventListener(AssetLibrary.const_475,onContentLoaded);
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc7_ = new LibraryLoader();
               _loc7_.load(new URLRequest(_loc5_[_loc6_]));
               _loc4_.loadFromFile(_loc7_,true);
               _loc7_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,onContentLoadError);
               _loc6_++;
            }
            return true;
         }
         return false;
      }
      
      public function getPublicRoomWorldSize(param1:String) : int
      {
         if(var_178 != null)
         {
            return var_178.getWorldScale(const_296 + param1);
         }
         return 32;
      }
   }
}
