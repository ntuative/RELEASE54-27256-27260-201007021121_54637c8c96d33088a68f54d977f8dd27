package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_1040:String = "inventory_badges";
      
      public static const const_1364:String = "inventory_clothes";
      
      public static const const_1407:String = "inventory_furniture";
      
      public static const const_689:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_969:String = "inventory_effects";
       
      
      private var var_2115:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_689);
         var_2115 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_2115;
      }
   }
}
