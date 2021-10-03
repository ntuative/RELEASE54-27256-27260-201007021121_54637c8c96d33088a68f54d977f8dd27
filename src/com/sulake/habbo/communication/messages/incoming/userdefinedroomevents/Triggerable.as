package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Triggerable
   {
       
      
      private var var_1280:String;
      
      private var var_1508:String;
      
      private var var_2288:int;
      
      private var var_2289:int;
      
      private var var_312:int;
      
      public function Triggerable(param1:IMessageDataWrapper)
      {
         super();
         var_312 = param1.readInteger();
         var_1280 = param1.readString();
         var_1508 = param1.readString();
         var_2289 = param1.readInteger();
         var_2288 = param1.readInteger();
      }
      
      public function get params() : String
      {
         return var_1508;
      }
      
      public function get cooldownPeriod() : int
      {
         return var_2288;
      }
      
      public function get performCount() : int
      {
         return var_2289;
      }
      
      public function get stuffId() : int
      {
         return var_312;
      }
      
      public function get stuffName() : String
      {
         return var_1280;
      }
   }
}
