package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1815:int;
      
      private var var_2394:int = 0;
      
      private var var_2392:String;
      
      private var var_2391:int;
      
      private var var_2393:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1815 = param1;
         var_2391 = param2;
         var_2393 = param3;
         var_2392 = param4;
      }
      
      public function get length() : int
      {
         return var_2391;
      }
      
      public function get name() : String
      {
         return var_2393;
      }
      
      public function get creator() : String
      {
         return var_2392;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2394;
      }
      
      public function get id() : int
      {
         return var_1815;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2394 = param1;
      }
   }
}
