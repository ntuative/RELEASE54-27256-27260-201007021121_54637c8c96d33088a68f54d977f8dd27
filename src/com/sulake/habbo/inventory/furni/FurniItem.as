package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1811:int;
      
      private var var_1813:Boolean;
      
      private var var_1815:int;
      
      private var var_1484:String;
      
      private var var_1814:Boolean = false;
      
      private var var_1816:int;
      
      private var var_480:int;
      
      private var var_1066:String;
      
      private var var_1695:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1308:int;
      
      private var var_1817:Boolean;
      
      private var var_1812:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1811 = param1;
         var_1066 = param2;
         _objId = param3;
         var_1308 = param4;
         var_1484 = param5;
         var_1813 = param6;
         var_1817 = param7;
         var_1816 = param8;
         var_1695 = param9;
         var_1815 = param10;
         var_480 = -1;
      }
      
      public function get songId() : int
      {
         return var_1815;
      }
      
      public function get iconCallbackId() : int
      {
         return var_480;
      }
      
      public function get expiryTime() : int
      {
         return var_1816;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1812 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1814 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_480 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1817;
      }
      
      public function get slotId() : String
      {
         return var_1695;
      }
      
      public function get classId() : int
      {
         return var_1308;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1813;
      }
      
      public function get stuffData() : String
      {
         return var_1484;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1811;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1814;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1812;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1066;
      }
   }
}
