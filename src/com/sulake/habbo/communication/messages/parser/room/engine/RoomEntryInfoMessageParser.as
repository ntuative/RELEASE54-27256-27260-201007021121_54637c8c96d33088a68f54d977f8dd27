package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2234:int;
      
      private var var_470:Boolean;
      
      private var var_2233:Boolean;
      
      private var var_968:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2233 = param1.readBoolean();
         if(var_2233)
         {
            var_2234 = param1.readInteger();
            var_470 = param1.readBoolean();
         }
         else
         {
            var_968 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_968 != null)
         {
            var_968.dispose();
            var_968 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2234;
      }
      
      public function get owner() : Boolean
      {
         return var_470;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2233;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_968;
      }
   }
}
