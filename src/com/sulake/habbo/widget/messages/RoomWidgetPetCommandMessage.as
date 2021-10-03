package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_562:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_738:String = "RWPCM_PET_COMMAND";
       
      
      private var var_174:String;
      
      private var var_1293:int = 0;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         var_1293 = param2;
         var_174 = param3;
      }
      
      public function get value() : String
      {
         return var_174;
      }
      
      public function get petId() : int
      {
         return var_1293;
      }
   }
}
