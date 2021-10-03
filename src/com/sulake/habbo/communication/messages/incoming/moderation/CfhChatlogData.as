package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2124:int;
      
      private var var_1151:int;
      
      private var var_2123:int;
      
      private var var_1629:int;
      
      private var var_117:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1629 = param1.readInteger();
         var_2123 = param1.readInteger();
         var_1151 = param1.readInteger();
         var_2124 = param1.readInteger();
         var_117 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1629);
      }
      
      public function get chatRecordId() : int
      {
         return var_2124;
      }
      
      public function get reportedUserId() : int
      {
         return var_1151;
      }
      
      public function get callerUserId() : int
      {
         return var_2123;
      }
      
      public function get callId() : int
      {
         return var_1629;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_117;
      }
   }
}
