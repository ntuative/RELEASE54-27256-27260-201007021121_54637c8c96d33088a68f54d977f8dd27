package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_623:RoomObjectLocationCacheItem = null;
      
      private var var_193:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_623 = new RoomObjectLocationCacheItem(param1);
         var_193 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_623;
      }
      
      public function dispose() : void
      {
         if(var_623 != null)
         {
            var_623.dispose();
            var_623 = null;
         }
         if(var_193 != null)
         {
            var_193.dispose();
            var_193 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_193;
      }
   }
}
