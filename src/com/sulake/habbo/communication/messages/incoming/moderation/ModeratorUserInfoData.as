package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2366:int;
      
      private var var_2367:int;
      
      private var var_2369:int;
      
      private var _userName:String;
      
      private var var_2368:int;
      
      private var var_2370:int;
      
      private var var_2365:int;
      
      private var _userId:int;
      
      private var var_755:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2370 = param1.readInteger();
         var_2368 = param1.readInteger();
         var_755 = param1.readBoolean();
         var_2369 = param1.readInteger();
         var_2367 = param1.readInteger();
         var_2366 = param1.readInteger();
         var_2365 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2365;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_755;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2368;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2367;
      }
      
      public function get cautionCount() : int
      {
         return var_2366;
      }
      
      public function get cfhCount() : int
      {
         return var_2369;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2370;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
