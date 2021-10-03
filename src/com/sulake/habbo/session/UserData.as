package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_469:String = "";
      
      private var var_2083:String = "";
      
      private var var_2080:int = 0;
      
      private var var_2065:int = 0;
      
      private var _type:int = 0;
      
      private var var_2081:String = "";
      
      private var var_653:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_2057:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_2080 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_2081 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_469 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_653 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_2080;
      }
      
      public function set webID(param1:int) : void
      {
         var_2057 = param1;
      }
      
      public function get groupID() : String
      {
         return var_2081;
      }
      
      public function set custom(param1:String) : void
      {
         var_2083 = param1;
      }
      
      public function get figure() : String
      {
         return var_469;
      }
      
      public function get sex() : String
      {
         return var_653;
      }
      
      public function get custom() : String
      {
         return var_2083;
      }
      
      public function get webID() : int
      {
         return var_2057;
      }
      
      public function set xp(param1:int) : void
      {
         var_2065 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_2065;
      }
   }
}
