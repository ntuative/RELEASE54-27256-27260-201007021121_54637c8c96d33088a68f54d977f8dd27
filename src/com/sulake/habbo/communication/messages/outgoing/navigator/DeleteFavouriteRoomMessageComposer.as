package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class DeleteFavouriteRoomMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_34:Array;
      
      public function DeleteFavouriteRoomMessageComposer(param1:int)
      {
         var_34 = new Array();
         super();
         this.var_34.push(param1);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_34;
      }
      
      public function dispose() : void
      {
         this.var_34 = null;
      }
   }
}
