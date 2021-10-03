package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboGroupDetailsMessageParser implements IMessageParser
   {
       
      
      private var var_756:String = "";
      
      private var _name:String = "";
      
      private var _roomId:int = -1;
      
      private var var_1034:int = -1;
      
      private var var_1219:String = "";
      
      public function HabboGroupDetailsMessageParser()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return var_1034;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1034 = param1.readInteger();
         if(var_1034 != -1)
         {
            _name = param1.readString();
            var_1219 = param1.readString();
            _roomId = param1.readInteger();
            var_756 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1034 = -1;
         _name = "";
         var_1219 = "";
         _roomId = -1;
         var_756 = "";
         return true;
      }
      
      public function get roomName() : String
      {
         return var_756;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return var_1219;
      }
   }
}
