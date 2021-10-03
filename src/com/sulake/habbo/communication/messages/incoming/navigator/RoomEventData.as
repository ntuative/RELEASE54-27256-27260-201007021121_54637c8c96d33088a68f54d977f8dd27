package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1835:String;
      
      private var var_471:int;
      
      private var var_1830:String;
      
      private var var_1833:String;
      
      private var var_1831:int;
      
      private var var_1832:String;
      
      private var var_1834:int;
      
      private var var_696:Array;
      
      private var var_1160:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_696 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1160 = false;
            return;
         }
         this.var_1160 = true;
         var_1831 = int(_loc2_);
         var_1830 = param1.readString();
         var_471 = int(param1.readString());
         var_1834 = param1.readInteger();
         var_1835 = param1.readString();
         var_1833 = param1.readString();
         var_1832 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_696.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1834;
      }
      
      public function get eventName() : String
      {
         return var_1835;
      }
      
      public function get eventDescription() : String
      {
         return var_1833;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1830;
      }
      
      public function get tags() : Array
      {
         return var_696;
      }
      
      public function get creationTime() : String
      {
         return var_1832;
      }
      
      public function get exists() : Boolean
      {
         return var_1160;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1831;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_471;
      }
   }
}
