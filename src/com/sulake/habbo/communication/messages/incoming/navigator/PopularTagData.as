package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_2051:int;
      
      private var var_2223:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_2223 = param1.readString();
         var_2051 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_2223;
      }
      
      public function get userCount() : int
      {
         return var_2051;
      }
   }
}
