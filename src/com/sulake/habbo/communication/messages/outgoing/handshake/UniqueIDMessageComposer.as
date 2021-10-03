package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class UniqueIDMessageComposer implements IMessageComposer
   {
       
      
      private var var_976:String;
      
      public function UniqueIDMessageComposer(param1:String)
      {
         super();
         var_976 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_976];
      }
      
      public function dispose() : void
      {
      }
   }
}
