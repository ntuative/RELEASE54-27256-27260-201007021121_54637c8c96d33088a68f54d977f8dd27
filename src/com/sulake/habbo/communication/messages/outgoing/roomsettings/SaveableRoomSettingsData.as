package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_1847:Boolean;
      
      private var var_1850:Boolean;
      
      private var var_1851:Array;
      
      private var var_1848:Boolean;
      
      private var var_1219:String;
      
      private var var_1849:int;
      
      private var var_1852:Boolean;
      
      private var var_1845:int;
      
      private var var_1401:int;
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_696:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1850 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1849;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1849 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_1852 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_696;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1848;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1851 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_696 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1847;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1850;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1401;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1848 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_1852;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1851;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1845 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1847 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1845;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1401 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1219 = param1;
      }
      
      public function get description() : String
      {
         return var_1219;
      }
   }
}
