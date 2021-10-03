package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1199:String = "WN_CREATED";
      
      public static const const_923:String = "WN_DISABLE";
      
      public static const const_900:String = "WN_DEACTIVATED";
      
      public static const const_845:String = "WN_OPENED";
      
      public static const const_838:String = "WN_CLOSED";
      
      public static const const_1039:String = "WN_DESTROY";
      
      public static const const_1704:String = "WN_ARRANGED";
      
      public static const const_463:String = "WN_PARENT_RESIZED";
      
      public static const const_880:String = "WN_ENABLE";
      
      public static const const_847:String = "WN_RELOCATE";
      
      public static const const_850:String = "WN_FOCUS";
      
      public static const const_878:String = "WN_PARENT_RELOCATED";
      
      public static const const_424:String = "WN_PARAM_UPDATED";
      
      public static const const_587:String = "WN_PARENT_ACTIVATED";
      
      public static const const_169:String = "WN_RESIZED";
      
      public static const const_908:String = "WN_CLOSE";
      
      public static const const_934:String = "WN_PARENT_REMOVED";
      
      public static const const_286:String = "WN_CHILD_RELOCATED";
      
      public static const const_674:String = "WN_ENABLED";
      
      public static const const_252:String = "WN_CHILD_RESIZED";
      
      public static const const_1050:String = "WN_MINIMIZED";
      
      public static const const_637:String = "WN_DISABLED";
      
      public static const const_234:String = "WN_CHILD_ACTIVATED";
      
      public static const const_430:String = "WN_STATE_UPDATED";
      
      public static const const_580:String = "WN_UNSELECTED";
      
      public static const const_460:String = "WN_STYLE_UPDATED";
      
      public static const const_1629:String = "WN_UPDATE";
      
      public static const const_487:String = "WN_PARENT_ADDED";
      
      public static const const_546:String = "WN_RESIZE";
      
      public static const const_544:String = "WN_CHILD_REMOVED";
      
      public static const const_1502:String = "";
      
      public static const const_832:String = "WN_RESTORED";
      
      public static const const_348:String = "WN_SELECTED";
      
      public static const const_899:String = "WN_MINIMIZE";
      
      public static const const_896:String = "WN_FOCUSED";
      
      public static const const_1392:String = "WN_LOCK";
      
      public static const const_305:String = "WN_CHILD_ADDED";
      
      public static const const_945:String = "WN_UNFOCUSED";
      
      public static const const_405:String = "WN_RELOCATED";
      
      public static const const_931:String = "WN_DEACTIVATE";
      
      public static const const_1397:String = "WN_CRETAE";
      
      public static const const_879:String = "WN_RESTORE";
      
      public static const const_350:String = "WN_ACTVATED";
      
      public static const const_1272:String = "WN_LOCKED";
      
      public static const const_397:String = "WN_SELECT";
      
      public static const const_997:String = "WN_MAXIMIZE";
      
      public static const const_975:String = "WN_OPEN";
      
      public static const const_630:String = "WN_UNSELECT";
      
      public static const const_1536:String = "WN_ARRANGE";
      
      public static const const_1314:String = "WN_UNLOCKED";
      
      public static const const_1555:String = "WN_UPDATED";
      
      public static const const_905:String = "WN_ACTIVATE";
      
      public static const const_1278:String = "WN_UNLOCK";
      
      public static const const_1060:String = "WN_MAXIMIZED";
      
      public static const const_853:String = "WN_DESTROYED";
      
      public static const const_932:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1727,cancelable);
      }
   }
}
