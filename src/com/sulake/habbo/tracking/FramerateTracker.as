package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_1244:int;
      
      private var var_358:Number;
      
      private var var_1694:int;
      
      private var var_996:int;
      
      private var var_2323:int;
      
      private var var_2322:Boolean;
      
      private var _reportIntervalMillis:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++var_996;
         var _loc3_:int = getTimer();
         if(var_996 == 1)
         {
            var_358 = param1;
            var_1244 = _loc3_;
         }
         else
         {
            _loc4_ = Number(var_996);
            var_358 = var_358 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(var_2322 && _loc3_ - var_1244 >= _reportIntervalMillis && var_1694 < var_2323)
         {
            _loc5_ = 1000 / var_358;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++var_1694;
            var_1244 = _loc3_;
            var_996 = 0;
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         _reportIntervalMillis = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         var_2323 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         var_2322 = true;
      }
      
      public function dispose() : void
      {
      }
   }
}
