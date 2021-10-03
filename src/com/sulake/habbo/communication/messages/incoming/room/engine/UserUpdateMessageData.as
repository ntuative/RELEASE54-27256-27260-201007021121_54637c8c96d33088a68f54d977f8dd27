package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_92:Number = 0;
      
      private var var_257:int = 0;
      
      private var var_1863:int = 0;
      
      private var var_2178:Number = 0;
      
      private var var_2179:Number = 0;
      
      private var var_2175:Number = 0;
      
      private var var_2177:Number = 0;
      
      private var var_2176:Boolean = false;
      
      private var var_91:Number = 0;
      
      private var _id:int = 0;
      
      private var var_238:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_238 = [];
         super();
         _id = param1;
         var_91 = param2;
         _y = param3;
         var_92 = param4;
         var_2177 = param5;
         var_257 = param6;
         var_1863 = param7;
         var_2178 = param8;
         var_2179 = param9;
         var_2175 = param10;
         var_2176 = param11;
         var_238 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function get dir() : int
      {
         return var_257;
      }
      
      public function get localZ() : Number
      {
         return var_2177;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2176;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1863;
      }
      
      public function get targetX() : Number
      {
         return var_2178;
      }
      
      public function get targetY() : Number
      {
         return var_2179;
      }
      
      public function get targetZ() : Number
      {
         return var_2175;
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get actions() : Array
      {
         return var_238.slice();
      }
   }
}
