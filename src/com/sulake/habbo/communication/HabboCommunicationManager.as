package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.messages.outgoing.handshake.DisconnectMessageComposer;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private var var_85:int = 0;
      
      private var var_38:String = "";
      
      private var var_1305:Timer;
      
      private var var_271:Array;
      
      private var var_1968:Boolean = false;
      
      private var var_86:String = "";
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_1055:IMessageConfiguration;
      
      private const const_1742:int = 2;
      
      private var var_365:int = -1;
      
      private var var_313:ICoreCommunicationManager;
      
      private var var_889:int = 1;
      
      private var var_1967:Boolean = false;
      
      private var var_1966:Boolean = false;
      
      private var _connection:IConnection;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1055 = new HabboMessages();
         var_271 = [];
         var_1305 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
         param1.events.addEventListener(Event.UNLOAD,unloading);
      }
      
      public function get port() : int
      {
         if(var_365 < 0 || var_365 >= var_271.length)
         {
            return 0;
         }
         return var_271[var_365];
      }
      
      private function unloading(param1:Event) : void
      {
         if(_connection)
         {
            _connection.send(new DisconnectMessageComposer());
            _connection.dispose();
            _connection = null;
         }
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_271[var_365]);
         tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + var_889 + " attempts");
      }
      
      private function onConfigurationReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         Logger.log("Habbo Communication Manager: init based on configuration: " + _habboConfiguration);
         if(_habboConfiguration == null)
         {
            Core.crash("Received configuration ready event but configuration was null",Core.const_159);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            var_271 = [];
            var_38 = _habboConfiguration.getKey("connection.info.host",null);
            if(var_38 == null)
            {
               Core.crash("connection.info.host was not defined",Core.const_322);
               return;
            }
            _loc2_ = _habboConfiguration.getKey("connection.info.port",null);
            if(_loc2_ == null)
            {
               Core.crash("connection.info.port was not defined",Core.const_322);
               return;
            }
            if(_habboConfiguration.keyExists("local.environment"))
            {
               var_38 = _habboConfiguration.getKey("connection.info.host.local");
               _loc2_ = _habboConfiguration.getKey("connection.info.port.local");
            }
            _loc3_ = _loc2_.split(",");
            for each(_loc4_ in _loc3_)
            {
               var_271.push(parseInt(_loc4_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + var_38);
            Logger.log("Connection Host: " + var_38);
            Logger.log("Connection Ports: " + var_271);
            Logger.log("Habbo Connection Info:" + _connection);
            var_1967 = true;
            if(var_1966)
            {
               nextPort();
            }
         }
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1251,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1400,param1 + " " + param2);
         if(false)
         {
            var_86 += ",R:" + param1;
         }
         else
         {
            var_86 = "R:" + param1;
         }
         if(false)
         {
            var_86 = var_86.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_86);
      }
      
      private function nextPort() : void
      {
         if(false)
         {
            Logger.log("Warning: Already connected so will not try to connect again!");
            return;
         }
         ++var_365;
         if(var_365 >= var_271.length)
         {
            ++var_889;
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + var_889);
            if(var_889 > const_1742)
            {
               if(var_1968)
               {
                  return;
               }
               var_1968 = true;
               Core.error("Connection failed to host " + var_38 + " ports " + var_271,true,Core.const_322);
               return;
            }
            var_365 = 0;
         }
         _connection.timeout = var_889 * 10000;
         _connection.init(var_38,var_271[var_365]);
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         var_1305.stop();
         nextPort();
      }
      
      public function get mode() : int
      {
         return var_85;
      }
      
      override public function dispose() : void
      {
         if(_connection)
         {
            _connection.dispose();
            _connection = null;
         }
         if(var_313)
         {
            var_313.release(new IIDCoreCommunicationManager());
            var_313 = null;
         }
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_259:
               if(_habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_322);
                  return;
               }
               if(_connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_322);
                  return;
               }
               var_1966 = true;
               if(var_1967)
               {
                  nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = _habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         var_313.addConnectionMessageEvent(HabboConnectionType.const_259,param1);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1296,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1345,String(param2));
      }
      
      public function messageSent(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1274,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1316,param1 + " " + param2);
         if(false)
         {
            var_86 += ",S:" + param1;
         }
         else
         {
            var_86 = "S:" + param1;
         }
         if(false)
         {
            var_86 = var_86.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_86);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_271[var_365]);
         tryNextPort();
      }
      
      public function set mode(param1:int) : void
      {
         var_85 = param1;
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            var_313 = param2 as ICoreCommunicationManager;
            var_313.connectionStateListener = this;
            var_313.registerProtocolType(HabboProtocolType.const_833,WedgieProtocol);
            _connection = var_313.createConnection(HabboConnectionType.const_259,ConnectionType.const_1054);
            _loc3_ = var_313.getProtocolInstanceOfType(HabboProtocolType.const_833);
            _connection.registerMessageClasses(var_1055);
            _connection.protocol = _loc3_;
            _connection.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
            _connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            _connection.addEventListener(Event.CONNECT,onConnect);
         }
      }
      
      private function tryNextPort() : void
      {
         var_1305.addEventListener(TimerEvent.TIMER,onTryNextPort);
         var_1305.start();
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationReady);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!var_313 ? var_313.queueConnection(HabboConnectionType.const_259,param1) : null;
      }
   }
}
