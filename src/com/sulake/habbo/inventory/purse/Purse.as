package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2265:Boolean = false;
      
      private var var_2264:int = 0;
      
      private var var_1503:int = 0;
      
      private var var_2263:int = 0;
      
      private var var_1733:Boolean = false;
      
      private var var_1643:int = 0;
      
      private var var_1504:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1643 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2264;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2265;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2265 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1733;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2264 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1503 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1643;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1733 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2263 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1503;
      }
      
      public function get pixelBalance() : int
      {
         return var_2263;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1504 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1504;
      }
   }
}
