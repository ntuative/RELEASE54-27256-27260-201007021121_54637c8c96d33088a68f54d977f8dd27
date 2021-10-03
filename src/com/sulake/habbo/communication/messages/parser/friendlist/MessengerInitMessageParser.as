package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2467:int;
      
      private var var_2472:int;
      
      private var var_95:Array;
      
      private var var_249:Array;
      
      private var var_2469:int;
      
      private var var_2468:int;
      
      private var var_2470:int;
      
      private var var_2471:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_95 = new Array();
         this.var_249 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2467;
      }
      
      public function get friends() : Array
      {
         return this.var_249;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2469;
      }
      
      public function get categories() : Array
      {
         return this.var_95;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2472;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2471;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2471 = param1.readInteger();
         this.var_2469 = param1.readInteger();
         this.var_2467 = param1.readInteger();
         this.var_2470 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_95.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_249.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2472 = param1.readInteger();
         this.var_2468 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2470;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2468;
      }
   }
}
