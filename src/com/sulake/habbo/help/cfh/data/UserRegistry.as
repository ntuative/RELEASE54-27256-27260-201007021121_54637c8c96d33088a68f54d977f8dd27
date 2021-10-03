package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1122:int = 80;
       
      
      private var var_545:Map;
      
      private var var_756:String = "";
      
      private var var_1357:Array;
      
      public function UserRegistry()
      {
         var_545 = new Map();
         var_1357 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_545.getValue(var_1357.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_756;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_545.getValue(param1) != null)
         {
            var_545.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_756);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_756 == "")
         {
            var_1357.push(param1);
         }
         var_545.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_545;
      }
      
      public function unregisterRoom() : void
      {
         var_756 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_545.length > const_1122)
         {
            _loc1_ = var_545.getKey(0);
            var_545.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_756 = param1;
         if(var_756 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
