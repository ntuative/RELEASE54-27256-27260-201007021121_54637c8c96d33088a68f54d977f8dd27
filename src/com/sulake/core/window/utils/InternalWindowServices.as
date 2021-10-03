package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_125:DisplayObject;
      
      private var var_2483:uint;
      
      private var var_987:IWindowToolTipAgentService;
      
      private var var_988:IWindowMouseScalingService;
      
      private var var_245:IWindowContext;
      
      private var var_985:IWindowFocusManagerService;
      
      private var var_986:IWindowMouseListenerService;
      
      private var var_989:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2483 = 0;
         var_125 = param2;
         var_245 = param1;
         var_989 = new WindowMouseDragger(param2);
         var_988 = new WindowMouseScaler(param2);
         var_986 = new WindowMouseListener(param2);
         var_985 = new FocusManager(param2);
         var_987 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_988;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_985;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_987;
      }
      
      public function dispose() : void
      {
         if(var_989 != null)
         {
            var_989.dispose();
            var_989 = null;
         }
         if(var_988 != null)
         {
            var_988.dispose();
            var_988 = null;
         }
         if(var_986 != null)
         {
            var_986.dispose();
            var_986 = null;
         }
         if(var_985 != null)
         {
            var_985.dispose();
            var_985 = null;
         }
         if(var_987 != null)
         {
            var_987.dispose();
            var_987 = null;
         }
         var_245 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_986;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_989;
      }
   }
}
