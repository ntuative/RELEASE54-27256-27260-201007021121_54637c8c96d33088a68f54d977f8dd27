package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1540:String;
      
      private var var_1909:int;
      
      private var var_1911:int;
      
      private var var_1912:int;
      
      private var var_1910:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1909 = param1.readInteger();
         var_1912 = param1.readInteger();
         var_1911 = param1.readInteger();
         var_1910 = param1.readString();
         var_1540 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1540;
      }
      
      public function get hour() : int
      {
         return var_1909;
      }
      
      public function get method_10() : int
      {
         return var_1912;
      }
      
      public function get chatterName() : String
      {
         return var_1910;
      }
      
      public function get chatterId() : int
      {
         return var_1911;
      }
   }
}
