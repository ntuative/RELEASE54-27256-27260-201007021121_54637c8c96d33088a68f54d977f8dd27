package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1313:String = "door";
      
      public static const const_438:String = "window";
      
      public static const const_527:String = "RORMUM_ADD_MASK";
      
      public static const const_401:String = "RORMUM_ADD_MASK";
      
      public static const const_201:String = "hole";
       
      
      private var var_2238:String = "";
      
      private var var_2236:String = "";
      
      private var var_2235:String = "window";
      
      private var var_2237:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         _type = param1;
         var_2236 = param2;
         var_2238 = param3;
         if(param4 != null)
         {
            var_2237 = new Vector3d(param4.x,param4.y,param4.z);
         }
         var_2235 = param5;
      }
      
      public function get maskCategory() : String
      {
         return var_2235;
      }
      
      public function get maskId() : String
      {
         return var_2236;
      }
      
      public function get maskLocation() : IVector3d
      {
         return var_2237;
      }
      
      public function get maskType() : String
      {
         return var_2238;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
