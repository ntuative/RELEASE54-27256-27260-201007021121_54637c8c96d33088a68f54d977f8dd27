package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1076:int = 31;
      
      private static const const_1077:int = 32;
      
      private static const const_772:int = 10;
      
      private static const const_513:int = 20;
       
      
      private var var_657:Boolean = false;
      
      private var var_228:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_228 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!var_657)
            {
               var_657 = true;
               var_228 = new Array();
               var_228.push(const_1076);
               var_228.push(const_1077);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_772)
         {
            if(var_657)
            {
               var_657 = false;
               var_228 = new Array();
               var_228.push(const_772 + param1);
               var_228.push(const_513 + param1);
               var_228.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(false)
            {
               super.setAnimation(var_228.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
