package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class SessionCreditBalanceEvent extends Event
   {
      
      public static const const_155:String = "session_credit_balance";
       
      
      private var var_1737:int;
      
      public function SessionCreditBalanceEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_155,param2,param3);
         var_1737 = param1;
      }
      
      public function get credits() : int
      {
         return var_1737;
      }
   }
}
