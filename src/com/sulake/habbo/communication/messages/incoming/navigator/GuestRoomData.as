package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2051:int;
      
      private var var_2205:String;
      
      private var var_2204:int;
      
      private var var_2203:int;
      
      private var var_776:Boolean;
      
      private var var_1848:Boolean;
      
      private var var_471:int;
      
      private var var_1219:String;
      
      private var var_1845:int;
      
      private var var_1401:int;
      
      private var _ownerName:String;
      
      private var var_756:String;
      
      private var var_2206:int;
      
      private var var_2202:RoomThumbnailData;
      
      private var var_1903:Boolean;
      
      private var var_696:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_696 = new Array();
         super();
         var_471 = param1.readInteger();
         var_776 = param1.readBoolean();
         var_756 = param1.readString();
         _ownerName = param1.readString();
         var_1845 = param1.readInteger();
         var_2051 = param1.readInteger();
         var_2206 = param1.readInteger();
         var_1219 = param1.readString();
         var_2204 = param1.readInteger();
         var_1903 = param1.readBoolean();
         var_2203 = param1.readInteger();
         var_1401 = param1.readInteger();
         var_2205 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_696.push(_loc4_);
            _loc3_++;
         }
         var_2202 = new RoomThumbnailData(param1);
         var_1848 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2206;
      }
      
      public function get roomName() : String
      {
         return var_756;
      }
      
      public function get userCount() : int
      {
         return var_2051;
      }
      
      public function get score() : int
      {
         return var_2203;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2205;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1903;
      }
      
      public function get tags() : Array
      {
         return var_696;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1848;
      }
      
      public function get event() : Boolean
      {
         return var_776;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_696 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1401;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2204;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2202;
      }
      
      public function get doorMode() : int
      {
         return var_1845;
      }
      
      public function get flatId() : int
      {
         return var_471;
      }
      
      public function get description() : String
      {
         return var_1219;
      }
   }
}
