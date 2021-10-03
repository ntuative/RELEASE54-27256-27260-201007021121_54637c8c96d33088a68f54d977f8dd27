package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_164:Array;
      
      private var var_37:Boolean = false;
      
      private var var_1651:int = 0;
      
      private var var_1652:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_557:Map;
      
      private var var_2211:int = 0;
      
      private var var_1650:int = 0;
      
      private var var_131:IHabboConfigurationManager;
      
      private var var_1411:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1653:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_37)
         {
            return;
         }
         if(getTimer() - var_1651 > var_1652)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1651 = getTimer();
         var_557.add(var_1411,var_1651);
         _connection.send(new LatencyPingRequestMessageComposer(var_1411));
         ++var_1411;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_131 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1652 = int(var_131.getKey("latencytest.interval"));
         var_1653 = int(var_131.getKey("latencytest.report.index"));
         var_2211 = int(var_131.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1652 < 1)
         {
            return;
         }
         var_557 = new Map();
         var_164 = new Array();
         var_37 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_557 == null || var_164 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_557.getValue(_loc2_.requestId);
         var_557.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_164.push(_loc4_);
         if(var_164.length == var_1653 && var_1653 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_164.length)
            {
               _loc5_ += var_164[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_164.length)
            {
               if(var_164[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_164[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_164 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1650) > var_2211 || var_1650 == 0)
            {
               var_1650 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_164.length);
               _connection.send(_loc11_);
            }
            var_164 = [];
         }
      }
      
      public function dispose() : void
      {
         var_37 = false;
         var_131 = null;
         _communication = null;
         _connection = null;
         if(var_557 != null)
         {
            var_557.dispose();
            var_557 = null;
         }
         var_164 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_131 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
