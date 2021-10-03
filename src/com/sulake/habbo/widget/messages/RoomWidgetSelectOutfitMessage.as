package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_873:String = "select_outfit";
       
      
      private var var_1965:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_873);
         var_1965 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1965;
      }
   }
}
