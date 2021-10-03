package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_117:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_2051:int;
      
      private var var_471:int;
      
      private var var_776:RoomData;
      
      private var var_1857:int;
      
      private var _ownerName:String;
      
      private var var_2309:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_471 = param1.readInteger();
         var_2051 = param1.readInteger();
         var_2309 = param1.readBoolean();
         var_1857 = param1.readInteger();
         _ownerName = param1.readString();
         var_117 = new RoomData(param1);
         var_776 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_2051;
      }
      
      public function get event() : RoomData
      {
         return var_776;
      }
      
      public function get room() : RoomData
      {
         return var_117;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_117 != null)
         {
            var_117.dispose();
            var_117 = null;
         }
         if(var_776 != null)
         {
            var_776.dispose();
            var_776 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_471;
      }
      
      public function get ownerId() : int
      {
         return var_1857;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_2309;
      }
   }
}
