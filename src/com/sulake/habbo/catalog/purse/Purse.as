package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1736:int = 0;
      
      private var var_1503:int = 0;
      
      private var var_1733:Boolean = false;
      
      private var var_1737:int = 0;
      
      private var var_1735:int = 0;
      
      private var var_1504:int = 0;
      
      private var var_1734:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1503;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1503 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1733 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_1734 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1503 > 0 || var_1504 > 0;
      }
      
      public function get credits() : int
      {
         return var_1737;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_1735 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1504;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1733;
      }
      
      public function get pastClubDays() : int
      {
         return var_1734;
      }
      
      public function get pastVipDays() : int
      {
         return var_1735;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1736 = param1;
      }
      
      public function get pixels() : int
      {
         return var_1736;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1504 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1737 = param1;
      }
   }
}
