package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1730:int;
      
      private var var_1729:int;
      
      private var var_2310:Boolean;
      
      private var var_2311:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2312:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1729 = param1;
         var_1730 = param2;
         var_2311 = param3;
         var_2312 = param4;
         var_2310 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1729,var_1730,var_2311,var_2312,int(var_2310)];
      }
      
      public function dispose() : void
      {
      }
   }
}
