package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_981:ConversationsTabView;
      
      private var _disposed:Boolean = false;
      
      private var var_135:HabboMessenger;
      
      private var var_1444:ConversationView;
      
      private var var_18:IFrameWindow;
      
      private var var_461:Timer;
      
      private var var_723:ITextFieldWindow;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         var_135 = param1;
         var_461 = new Timer(300,1);
         var_461.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(var_18 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         var_1444.addMessage(param2);
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = "null";
            if(_loc5_.length > _loc4_)
            {
               var_723.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         var_18.visible = false;
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1444.afterResize();
         this.var_981.refresh();
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = "null";
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = var_135.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         var_135.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         var_723.text = "";
         var_135.conversations.addMessageAndUpdateView(new Message(Message.const_649,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function refresh() : void
      {
         if(var_18 == null)
         {
            return;
         }
         var _loc1_:Conversation = var_135.conversations.findSelectedConversation();
         var_18.caption = _loc1_ == null ? "" : _loc1_.name;
         var_981.refresh();
         var_1444.refresh();
         if(var_135.conversations.openConversations.length < 1)
         {
            var_18.visible = false;
            var_135.setHabboToolbarIcon(false,false);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_461)
            {
               var_461.stop();
               var_461.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_461 = null;
            }
            var_135 = null;
            _disposed = true;
         }
      }
      
      public function openMessenger() : void
      {
         if(var_135.conversations.openConversations.length < 1)
         {
            return;
         }
         if(var_18 == null)
         {
            prepareContent();
            refresh();
            var_135.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_43,HabboToolbarIconEnum.MESSENGER,var_18));
         }
         else
         {
            refresh();
            var_18.visible = true;
            var_18.activate();
         }
      }
      
      public function getTabCount() : int
      {
         return this.var_981 == null ? 7 : int(this.var_981.getTabCount());
      }
      
      public function isMessengerOpen() : Boolean
      {
         return var_18 != null && false;
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_42 || param2 != var_18)
         {
            return;
         }
         if(!this.var_461.running)
         {
            this.var_461.reset();
            this.var_461.start();
         }
      }
      
      public function close() : void
      {
         if(var_18 != null)
         {
            var_18.visible = false;
         }
      }
      
      private function prepareContent() : void
      {
         var_18 = IFrameWindow(var_135.getXmlWindow("main_window"));
         var _loc1_:IWindow = var_18.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_18.procedure = onWindow;
         var_18.title.color = 4294623744;
         var_18.title.textColor = 4287851525;
         var_981 = new ConversationsTabView(var_135,var_18);
         var_981.refresh();
         var_723 = ITextFieldWindow(var_18.findChildByName("message_input"));
         var_723.addEventListener(WindowKeyboardEvent.const_150,onMessageInput);
         var_1444 = new ConversationView(var_135,var_18);
         var_18.scaler.setParamFlag(HabboWindowParam.const_684,false);
         var_18.scaler.setParamFlag(HabboWindowParam.const_992,true);
      }
   }
}
