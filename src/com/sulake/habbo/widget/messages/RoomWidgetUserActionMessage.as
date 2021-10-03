package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_764:String = "RWUAM_RESPECT_USER";
      
      public static const const_671:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_591:String = "RWUAM_START_TRADING";
      
      public static const const_610:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_694:String = "RWUAM_WHISPER_USER";
      
      public static const const_664:String = "RWUAM_IGNORE_USER";
      
      public static const const_501:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_660:String = "RWUAM_BAN_USER";
      
      public static const const_657:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_502:String = "RWUAM_KICK_USER";
      
      public static const const_632:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_683:String = " RWUAM_RESPECT_PET";
      
      public static const const_389:String = "RWUAM_KICK_BOT";
      
      public static const const_1307:String = "RWUAM_TRAIN_PET";
      
      public static const const_613:String = "RWUAM_PICKUP_PET";
      
      public static const const_733:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_762:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
