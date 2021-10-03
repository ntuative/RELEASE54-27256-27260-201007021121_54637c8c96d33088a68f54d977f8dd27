package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1766:int;
      
      private var var_1267:int;
      
      private var var_1761:int;
      
      private var _offerId:int;
      
      private var var_1763:int;
      
      private var var_1764:int;
      
      private var var_1765:Boolean;
      
      private var var_1762:int;
      
      private var var_1767:Boolean;
      
      private var var_1399:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1399 = param1.readString();
         var_1267 = param1.readInteger();
         var_1767 = param1.readBoolean();
         var_1765 = param1.readBoolean();
         var_1761 = param1.readInteger();
         var_1762 = param1.readInteger();
         var_1763 = param1.readInteger();
         var_1766 = param1.readInteger();
         var_1764 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1763;
      }
      
      public function get month() : int
      {
         return var_1766;
      }
      
      public function get price() : int
      {
         return var_1267;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1761;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1762;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1767;
      }
      
      public function get day() : int
      {
         return var_1764;
      }
      
      public function get vip() : Boolean
      {
         return var_1765;
      }
      
      public function get productCode() : String
      {
         return var_1399;
      }
   }
}
