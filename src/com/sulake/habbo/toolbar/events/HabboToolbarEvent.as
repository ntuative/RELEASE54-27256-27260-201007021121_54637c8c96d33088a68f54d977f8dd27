package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_86:String = "HTE_INITIALIZED";
      
      public static const const_55:String = "HTE_TOOLBAR_CLICK";
      
      public static const TOOLBAR_ORIENTATION:String = "HTE_TOOLBAR_ORIENTATION";
       
      
      private var var_553:String;
      
      private var var_803:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set orientation(param1:String) : void
      {
         var_553 = param1;
      }
      
      public function get iconId() : String
      {
         return var_803;
      }
      
      public function get orientation() : String
      {
         return var_553;
      }
      
      public function set iconId(param1:String) : void
      {
         var_803 = param1;
      }
   }
}
