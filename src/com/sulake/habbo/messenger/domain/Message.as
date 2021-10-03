package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_713:int = 2;
      
      public static const const_917:int = 6;
      
      public static const const_649:int = 1;
      
      public static const const_753:int = 3;
      
      public static const const_963:int = 4;
      
      public static const const_745:int = 5;
       
      
      private var var_2373:String;
      
      private var var_1096:int;
      
      private var var_2327:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1096 = param2;
         var_2327 = param3;
         var_2373 = param4;
      }
      
      public function get time() : String
      {
         return var_2373;
      }
      
      public function get senderId() : int
      {
         return var_1096;
      }
      
      public function get messageText() : String
      {
         return var_2327;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
