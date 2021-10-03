package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_983:String = "RWOCM_CLUB_MAIN";
      
      public static const const_651:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_2023:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_651);
         var_2023 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_2023;
      }
   }
}
