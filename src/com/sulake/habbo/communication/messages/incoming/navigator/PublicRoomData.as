package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2330:int;
      
      private var var_2398:String;
      
      private var var_1792:int;
      
      private var _disposed:Boolean;
      
      private var var_2397:int;
      
      private var var_1793:String;
      
      private var var_1336:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1793 = param1.readString();
         var_2330 = param1.readInteger();
         var_1792 = param1.readInteger();
         var_2398 = param1.readString();
         var_2397 = param1.readInteger();
         var_1336 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2397;
      }
      
      public function get worldId() : int
      {
         return var_1792;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1793;
      }
      
      public function get unitPort() : int
      {
         return var_2330;
      }
      
      public function get castLibs() : String
      {
         return var_2398;
      }
      
      public function get nodeId() : int
      {
         return var_1336;
      }
   }
}
