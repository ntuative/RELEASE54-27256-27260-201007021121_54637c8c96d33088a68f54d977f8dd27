package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1616:int;
      
      private var var_1617:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1616;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1616 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1616 = this.var_1616;
         _loc1_.var_1617 = this.var_1617;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1617 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1617;
      }
   }
}
