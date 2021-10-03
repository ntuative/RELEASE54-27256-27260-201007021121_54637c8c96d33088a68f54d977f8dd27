package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1484:String;
      
      private var var_1066:String;
      
      private var var_2094:Boolean;
      
      private var var_1574:int;
      
      private var var_1811:int;
      
      private var var_2095:Boolean;
      
      private var var_1695:String = "";
      
      private var var_1813:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1308:int;
      
      private var var_1817:Boolean;
      
      private var var_1815:int = -1;
      
      private var var_1816:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1811 = param1;
         var_1066 = param2;
         _objId = param3;
         var_1308 = param4;
         _category = param5;
         var_1484 = param6;
         var_2094 = param7;
         var_1813 = param8;
         var_1817 = param9;
         var_2095 = param10;
         var_1816 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1695;
      }
      
      public function get extra() : int
      {
         return var_1574;
      }
      
      public function get classId() : int
      {
         return var_1308;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2095;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2094;
      }
      
      public function get stripId() : int
      {
         return var_1811;
      }
      
      public function get stuffData() : String
      {
         return var_1484;
      }
      
      public function get songId() : int
      {
         return var_1815;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1695 = param1;
         var_1574 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1066;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1816;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1817;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1813;
      }
   }
}
