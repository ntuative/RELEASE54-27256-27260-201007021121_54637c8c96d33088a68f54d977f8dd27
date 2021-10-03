package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_363:Number = 0.5;
      
      private static const const_781:int = 3;
      
      private static const const_1103:Number = 1;
       
      
      private var var_1949:Boolean = false;
      
      private var var_1956:Boolean = false;
      
      private var var_1076:int = 0;
      
      private var var_270:Vector3d = null;
      
      private var var_1952:int = 0;
      
      private var var_1957:int = 0;
      
      private var var_1953:Boolean = false;
      
      private var var_1951:int = -2;
      
      private var var_1954:Boolean = false;
      
      private var var_1950:int = 0;
      
      private var var_1955:int = -1;
      
      private var var_421:Vector3d = null;
      
      private var var_1948:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1952;
      }
      
      public function get targetId() : int
      {
         return var_1955;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1950 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1952 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1949 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1955 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1956 = param1;
      }
      
      public function dispose() : void
      {
         var_421 = null;
         var_270 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_421 == null)
         {
            var_421 = new Vector3d();
         }
         var_421.assign(param1);
         var_1076 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1951;
      }
      
      public function get screenHt() : int
      {
         return var_1948;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1957 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_270;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1948 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1950;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1949;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1956;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_421 != null && var_270 != null)
         {
            ++var_1076;
            _loc2_ = Vector3d.dif(var_421,var_270);
            if(_loc2_.length <= const_363)
            {
               var_270 = var_421;
               var_421 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_363 * (const_781 + 1))
               {
                  _loc2_.mul(const_363);
               }
               else if(var_1076 <= const_781)
               {
                  _loc2_.mul(const_363);
               }
               else
               {
                  _loc2_.mul(const_1103);
               }
               var_270 = Vector3d.sum(var_270,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1953 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1957;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1954 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1951 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_270 != null)
         {
            return;
         }
         var_270 = new Vector3d();
         var_270.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1953;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1954;
      }
   }
}
