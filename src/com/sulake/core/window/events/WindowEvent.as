package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_275:String = "WE_CHILD_RESIZED";
      
      public static const const_1358:String = "WE_CLOSE";
      
      public static const const_1224:String = "WE_DESTROY";
      
      public static const const_131:String = "WE_CHANGE";
      
      public static const const_1353:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1643:String = "WE_PARENT_RESIZE";
      
      public static const const_89:String = "WE_UPDATE";
      
      public static const const_1419:String = "WE_MAXIMIZE";
      
      public static const const_374:String = "WE_DESTROYED";
      
      public static const const_1042:String = "WE_UNSELECT";
      
      public static const const_1187:String = "WE_MAXIMIZED";
      
      public static const const_1520:String = "WE_UNLOCKED";
      
      public static const const_403:String = "WE_CHILD_REMOVED";
      
      public static const const_171:String = "WE_OK";
      
      public static const const_42:String = "WE_RESIZED";
      
      public static const const_1281:String = "WE_ACTIVATE";
      
      public static const const_262:String = "WE_ENABLED";
      
      public static const const_500:String = "WE_CHILD_RELOCATED";
      
      public static const const_1327:String = "WE_CREATE";
      
      public static const const_703:String = "WE_SELECT";
      
      public static const const_167:String = "";
      
      public static const const_1664:String = "WE_LOCKED";
      
      public static const const_1533:String = "WE_PARENT_RELOCATE";
      
      public static const const_1625:String = "WE_CHILD_REMOVE";
      
      public static const const_1667:String = "WE_CHILD_RELOCATE";
      
      public static const const_1501:String = "WE_LOCK";
      
      public static const const_218:String = "WE_FOCUSED";
      
      public static const const_560:String = "WE_UNSELECTED";
      
      public static const const_967:String = "WE_DEACTIVATED";
      
      public static const const_1285:String = "WE_MINIMIZED";
      
      public static const const_1687:String = "WE_ARRANGED";
      
      public static const const_1711:String = "WE_UNLOCK";
      
      public static const const_1688:String = "WE_ATTACH";
      
      public static const const_1305:String = "WE_OPEN";
      
      public static const const_1416:String = "WE_RESTORE";
      
      public static const const_1600:String = "WE_PARENT_RELOCATED";
      
      public static const const_1260:String = "WE_RELOCATE";
      
      public static const const_1527:String = "WE_CHILD_RESIZE";
      
      public static const const_1668:String = "WE_ARRANGE";
      
      public static const const_1234:String = "WE_OPENED";
      
      public static const const_1298:String = "WE_CLOSED";
      
      public static const const_1543:String = "WE_DETACHED";
      
      public static const const_1607:String = "WE_UPDATED";
      
      public static const const_1432:String = "WE_UNFOCUSED";
      
      public static const const_393:String = "WE_RELOCATED";
      
      public static const const_1328:String = "WE_DEACTIVATE";
      
      public static const const_230:String = "WE_DISABLED";
      
      public static const const_701:String = "WE_CANCEL";
      
      public static const const_550:String = "WE_ENABLE";
      
      public static const const_1355:String = "WE_ACTIVATED";
      
      public static const const_1426:String = "WE_FOCUS";
      
      public static const const_1718:String = "WE_DETACH";
      
      public static const const_1294:String = "WE_RESTORED";
      
      public static const const_1217:String = "WE_UNFOCUS";
      
      public static const const_56:String = "WE_SELECTED";
      
      public static const const_1255:String = "WE_PARENT_RESIZED";
      
      public static const const_1341:String = "WE_CREATED";
      
      public static const const_1535:String = "WE_ATTACHED";
      
      public static const const_1258:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1727:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1487:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1727 = param3;
         var_1487 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1487;
      }
      
      public function get related() : IWindow
      {
         return var_1727;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1487 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
