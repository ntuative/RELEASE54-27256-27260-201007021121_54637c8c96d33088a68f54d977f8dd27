package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_469:String;
      
      private var var_1402:String;
      
      private var var_1403:String;
      
      private var var_1401:int;
      
      private var var_677:int;
      
      private var var_1404:String;
      
      private var _name:String;
      
      private var var_1256:Boolean;
      
      private var var_755:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_677 = param1.readInteger();
         this.var_755 = param1.readBoolean();
         this.var_1256 = param1.readBoolean();
         this.var_469 = param1.readString();
         this.var_1401 = param1.readInteger();
         this.var_1403 = param1.readString();
         this.var_1402 = param1.readString();
         this.var_1404 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_677;
      }
      
      public function get realName() : String
      {
         return var_1404;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1403;
      }
      
      public function get categoryId() : int
      {
         return var_1401;
      }
      
      public function get online() : Boolean
      {
         return var_755;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1256;
      }
      
      public function get lastAccess() : String
      {
         return var_1402;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_469;
      }
   }
}
