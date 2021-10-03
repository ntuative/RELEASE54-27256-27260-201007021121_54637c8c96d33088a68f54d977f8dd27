package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_92:Number = 0;
      
      private var _data:String = "";
      
      private var var_1574:int = 0;
      
      private var var_37:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2134:Boolean = false;
      
      private var var_2535:String = "";
      
      private var _id:int = 0;
      
      private var var_208:Boolean = false;
      
      private var var_257:String = "";
      
      private var var_2133:int = 0;
      
      private var var_2131:int = 0;
      
      private var var_2132:int = 0;
      
      private var var_2135:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2134 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_208)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2134;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_208)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_257;
      }
      
      public function get state() : int
      {
         return var_37;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_208)
         {
            var_2132 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_208)
         {
            var_2133 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_208)
         {
            var_2131 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_208)
         {
            var_257 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_208)
         {
            var_2135 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_208)
         {
            var_37 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_2132;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_208)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2133;
      }
      
      public function get wallY() : Number
      {
         return var_2131;
      }
      
      public function get localY() : Number
      {
         return var_2135;
      }
      
      public function setReadOnly() : void
      {
         var_208 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_208)
         {
            var_92 = param1;
         }
      }
   }
}
