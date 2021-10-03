package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1336:int;
      
      private var var_1654:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1336 = param1;
         var_1654 = param2;
         Logger.log("READ NODE: " + var_1336 + ", " + var_1654);
      }
      
      public function get nodeName() : String
      {
         return var_1654;
      }
      
      public function get nodeId() : int
      {
         return var_1336;
      }
   }
}
