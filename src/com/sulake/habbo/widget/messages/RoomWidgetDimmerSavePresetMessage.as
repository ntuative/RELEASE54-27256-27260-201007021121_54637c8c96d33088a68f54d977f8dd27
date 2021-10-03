package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_530:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1730:int;
      
      private var var_1729:int;
      
      private var var_1728:Boolean;
      
      private var var_1110:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_530);
         var_1729 = param1;
         var_1730 = param2;
         _color = param3;
         var_1110 = param4;
         var_1728 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1730;
      }
      
      public function get presetNumber() : int
      {
         return var_1729;
      }
      
      public function get brightness() : int
      {
         return var_1110;
      }
      
      public function get apply() : Boolean
      {
         return var_1728;
      }
   }
}
