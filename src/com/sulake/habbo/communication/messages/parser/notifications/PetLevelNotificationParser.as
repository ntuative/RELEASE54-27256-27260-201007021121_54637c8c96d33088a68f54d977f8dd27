package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_469:String;
      
      private var var_1859:int;
      
      private var var_2279:String;
      
      private var var_1149:int;
      
      private var var_1293:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1293;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1293 = param1.readInteger();
         var_2279 = param1.readString();
         var_1859 = param1.readInteger();
         var_469 = param1.readString();
         var_1149 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2279;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_469;
      }
      
      public function get petType() : int
      {
         return var_1149;
      }
      
      public function get level() : int
      {
         return var_1859;
      }
   }
}
