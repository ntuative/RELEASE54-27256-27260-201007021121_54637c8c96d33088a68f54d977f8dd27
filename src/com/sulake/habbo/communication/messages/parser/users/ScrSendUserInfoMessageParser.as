package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1431:int = 2;
      
      public static const const_1595:int = 1;
       
      
      private var var_2336:int;
      
      private var var_2338:int;
      
      private var var_1733:Boolean;
      
      private var var_2337:int;
      
      private var var_1361:String;
      
      private var var_2340:Boolean;
      
      private var var_1735:int;
      
      private var var_2339:int;
      
      private var var_1734:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2338;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1733;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2339;
      }
      
      public function get memberPeriods() : int
      {
         return var_2337;
      }
      
      public function get productName() : String
      {
         return var_1361;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2340;
      }
      
      public function get responseType() : int
      {
         return var_2336;
      }
      
      public function get pastClubDays() : int
      {
         return var_1734;
      }
      
      public function get pastVipDays() : int
      {
         return var_1735;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1361 = param1.readString();
         var_2338 = param1.readInteger();
         var_2337 = param1.readInteger();
         var_2339 = param1.readInteger();
         var_2336 = param1.readInteger();
         var_2340 = param1.readBoolean();
         var_1733 = param1.readBoolean();
         var_1734 = param1.readInteger();
         var_1735 = param1.readInteger();
         return true;
      }
   }
}
