package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class SetExtraPurchaseParameterEvent extends Event
   {
       
      
      private var var_925:String;
      
      public function SetExtraPurchaseParameterEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(WidgetEvent.const_1057,param2,param3);
         var_925 = param1;
      }
      
      public function get parameter() : String
      {
         return var_925;
      }
   }
}
