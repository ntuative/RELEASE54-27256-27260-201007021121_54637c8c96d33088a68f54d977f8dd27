package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1204:String = "F";
      
      public static const const_836:String = "M";
       
      
      private var var_91:Number = 0;
      
      private var var_469:String = "";
      
      private var var_2079:int = 0;
      
      private var var_2083:String = "";
      
      private var var_2080:int = 0;
      
      private var var_2065:int = 0;
      
      private var var_2081:String = "";
      
      private var var_653:String = "";
      
      private var _id:int = 0;
      
      private var var_208:Boolean = false;
      
      private var var_257:int = 0;
      
      private var var_2082:String = "";
      
      private var _name:String = "";
      
      private var var_2057:int = 0;
      
      private var _y:Number = 0;
      
      private var var_92:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_257;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_208)
         {
            var_257 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_208)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2079;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_208)
         {
            var_2080 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2082;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_208)
         {
            var_2081 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_208)
         {
            var_2082 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_208)
         {
            var_2065 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_208)
         {
            var_469 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_208)
         {
            var_2079 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_208)
         {
            var_653 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_2080;
      }
      
      public function get groupID() : String
      {
         return var_2081;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_208)
         {
            var_2057 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_208)
         {
            var_2083 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_208 = true;
      }
      
      public function get sex() : String
      {
         return var_653;
      }
      
      public function get figure() : String
      {
         return var_469;
      }
      
      public function get webID() : int
      {
         return var_2057;
      }
      
      public function get custom() : String
      {
         return var_2083;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_208)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_208)
         {
            var_92 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_208)
         {
            var_91 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_2065;
      }
   }
}
