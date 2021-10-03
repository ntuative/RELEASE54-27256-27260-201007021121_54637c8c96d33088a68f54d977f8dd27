package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_152:int = 1;
      
      public static const const_1212:int = 3;
      
      public static const const_467:int = 2;
       
      
      private var var_2332:int;
      
      private var var_2330:int;
      
      private var var_2329:int;
      
      private var var_1792:int;
      
      private var var_37:int;
      
      private var var_471:int;
      
      private var var_1358:int;
      
      private var var_1959:int;
      
      private var var_1151:int;
      
      private var _roomResources:String;
      
      private var var_2124:int;
      
      private var var_2334:int;
      
      private var var_2335:String;
      
      private var var_1958:String;
      
      private var var_2331:int = 0;
      
      private var var_1423:String;
      
      private var _message:String;
      
      private var var_2209:int;
      
      private var var_2328:String;
      
      private var var_1401:int;
      
      private var var_756:String;
      
      private var var_2333:String;
      
      private var var_1591:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1151 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2331 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2334;
      }
      
      public function set roomName(param1:String) : void
      {
         var_756 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_2124 = param1;
      }
      
      public function get state() : int
      {
         return var_37;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_756;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1792 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_37 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_2330;
      }
      
      public function get priority() : int
      {
         return var_2332 + var_2331;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1959 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1958;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1591) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1401;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2334 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1358;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2335 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_2124;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1792;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2333 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1423 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1959;
      }
      
      public function set priority(param1:int) : void
      {
         var_2332 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_2330 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2335;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2329 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1958 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_2209 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1423;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1358 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2329;
      }
      
      public function set flatId(param1:int) : void
      {
         var_471 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1401 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1591 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_2209;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2328 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1591;
      }
      
      public function get reportedUserId() : int
      {
         return var_1151;
      }
      
      public function get flatId() : int
      {
         return var_471;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2333;
      }
      
      public function get reporterUserName() : String
      {
         return var_2328;
      }
   }
}
