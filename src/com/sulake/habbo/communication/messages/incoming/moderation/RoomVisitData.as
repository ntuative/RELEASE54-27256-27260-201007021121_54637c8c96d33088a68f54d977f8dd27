package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_756:String;
      
      private var var_1913:int;
      
      private var var_1677:Boolean;
      
      private var _roomId:int;
      
      private var var_1914:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1677 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_756 = param1.readString();
         var_1914 = param1.readInteger();
         var_1913 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1677;
      }
      
      public function get roomName() : String
      {
         return var_756;
      }
      
      public function get enterMinute() : int
      {
         return var_1913;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1914;
      }
   }
}
