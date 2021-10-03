package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_614:int = 0;
      
      private var var_92:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_208:Boolean = false;
      
      private var var_257:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_91:Number = 0;
      
      private var var_514:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_208)
         {
            var_92 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_614;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_257;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_208)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_208)
         {
            var_257 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_208)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_208 = true;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_208)
         {
            var_614 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_208)
         {
            var_514 = param1;
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
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_208)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_514;
      }
   }
}
