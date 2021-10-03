package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2465:Boolean;
      
      private var var_2464:int;
      
      private var var_2463:Boolean;
      
      private var var_1603:String;
      
      private var var_1404:String;
      
      private var var_1993:int;
      
      private var var_2085:String;
      
      private var var_2462:String;
      
      private var var_2086:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1993 = param1.readInteger();
         this.var_1603 = param1.readString();
         this.var_2085 = param1.readString();
         this.var_2465 = param1.readBoolean();
         this.var_2463 = param1.readBoolean();
         param1.readString();
         this.var_2464 = param1.readInteger();
         this.var_2086 = param1.readString();
         this.var_2462 = param1.readString();
         this.var_1404 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1404;
      }
      
      public function get avatarName() : String
      {
         return this.var_1603;
      }
      
      public function get avatarId() : int
      {
         return this.var_1993;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2465;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2462;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2086;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2463;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2085;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2464;
      }
   }
}
