package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_959:LegacyWallGeometry = null;
      
      private var var_667:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_668:TileHeightMap = null;
      
      private var var_2220:String = null;
      
      private var _roomId:int = 0;
      
      private var var_666:SelectedRoomObjectData = null;
      
      private var var_960:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_959 = new LegacyWallGeometry();
         var_960 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_667 != null)
         {
            var_667.dispose();
         }
         var_667 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_668 != null)
         {
            var_668.dispose();
         }
         var_668 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2220 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_959;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_666;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_960;
      }
      
      public function dispose() : void
      {
         if(var_668 != null)
         {
            var_668.dispose();
            var_668 = null;
         }
         if(var_959 != null)
         {
            var_959.dispose();
            var_959 = null;
         }
         if(var_960 != null)
         {
            var_960.dispose();
            var_960 = null;
         }
         if(var_667 != null)
         {
            var_667.dispose();
            var_667 = null;
         }
         if(var_666 != null)
         {
            var_666.dispose();
            var_666 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_668;
      }
      
      public function get worldType() : String
      {
         return var_2220;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_666 != null)
         {
            var_666.dispose();
         }
         var_666 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_667;
      }
   }
}
