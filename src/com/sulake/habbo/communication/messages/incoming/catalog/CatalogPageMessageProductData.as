package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_243:String = "e";
      
      public static const const_78:String = "i";
      
      public static const const_80:String = "s";
       
      
      private var var_1107:String;
      
      private var var_1349:String;
      
      private var var_1351:int;
      
      private var var_2214:int;
      
      private var var_1108:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1349 = param1.readString();
         var_2214 = param1.readInteger();
         var_1107 = param1.readString();
         var_1108 = param1.readInteger();
         var_1351 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1108;
      }
      
      public function get productType() : String
      {
         return var_1349;
      }
      
      public function get expiration() : int
      {
         return var_1351;
      }
      
      public function get furniClassId() : int
      {
         return var_2214;
      }
      
      public function get extraParam() : String
      {
         return var_1107;
      }
   }
}
