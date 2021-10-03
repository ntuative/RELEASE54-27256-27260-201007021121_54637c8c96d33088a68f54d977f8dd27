package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_899:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_899 = new Array();
         var_899.push(param1.length);
         var_899 = var_899.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_899;
      }
   }
}
