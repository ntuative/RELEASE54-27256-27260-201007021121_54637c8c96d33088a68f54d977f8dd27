package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_514:int = 0;
      
      private var _data:String = "";
      
      private var var_1574:int = -1;
      
      private var var_37:int = 0;
      
      private var _type:int = 0;
      
      private var var_614:int = 0;
      
      private var var_2535:String = "";
      
      private var var_1816:int = 0;
      
      private var _id:int = 0;
      
      private var var_208:Boolean = false;
      
      private var var_257:int = 0;
      
      private var var_2213:String = null;
      
      private var var_91:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_92:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_208)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_208)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_257;
      }
      
      public function get extra() : int
      {
         return var_1574;
      }
      
      public function get state() : int
      {
         return var_37;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_208)
         {
            var_257 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_208)
         {
            var_91 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_208)
         {
            var_1574 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_208)
         {
            var_37 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1816;
      }
      
      public function get staticClass() : String
      {
         return var_2213;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_208)
         {
            var_1816 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_208)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_208)
         {
            var_2213 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_208 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_208)
         {
            var_514 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_208)
         {
            var_614 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_208)
         {
            var_92 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_514;
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get sizeY() : int
      {
         return var_614;
      }
   }
}
