package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1714:int = 9;
      
      public static const const_1651:int = 4;
      
      public static const const_1574:int = 1;
      
      public static const const_1287:int = 10;
      
      public static const const_1617:int = 2;
      
      public static const const_1324:int = 7;
      
      public static const const_1350:int = 11;
      
      public static const const_1659:int = 3;
      
      public static const const_1380:int = 8;
      
      public static const const_1315:int = 5;
      
      public static const const_1560:int = 6;
      
      public static const const_1264:int = 12;
       
      
      private var var_2012:String;
      
      private var _roomId:int;
      
      private var var_1260:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2012;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1260 = param1.readInteger();
         var_2012 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1260;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
