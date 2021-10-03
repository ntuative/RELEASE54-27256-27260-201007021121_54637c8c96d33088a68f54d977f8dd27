package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
   public class AvatarEffect
   {
       
      
      private var var_2256:int;
      
      private var var_1287:int;
      
      private var _type:int;
      
      private var var_2257:int;
      
      public function AvatarEffect()
      {
         super();
      }
      
      public function get inactiveEffectsInInventory() : int
      {
         return var_2257;
      }
      
      public function set secondsLeftIfActive(param1:int) : void
      {
         var_2256 = param1;
      }
      
      public function get duration() : int
      {
         return var_1287;
      }
      
      public function set inactiveEffectsInInventory(param1:int) : void
      {
         var_2257 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1287 = param1;
      }
      
      public function get secondsLeftIfActive() : int
      {
         return var_2256;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
   }
}
