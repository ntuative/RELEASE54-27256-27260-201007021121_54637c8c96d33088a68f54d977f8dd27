package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2096:String;
      
      private var var_1286:String;
      
      private var var_2097:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2097 = param1;
         var_1286 = param2;
         var_2096 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2097,var_1286,var_2096];
      }
      
      public function dispose() : void
      {
      }
   }
}
