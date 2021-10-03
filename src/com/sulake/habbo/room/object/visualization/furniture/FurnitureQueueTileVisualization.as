package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1141:int = 1;
      
      private static const const_1077:int = 3;
      
      private static const const_1140:int = 2;
      
      private static const const_1139:int = 15;
       
      
      private var var_956:int;
      
      private var var_228:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_228 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1140)
         {
            var_228 = new Array();
            var_228.push(const_1141);
            var_956 = const_1139;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_956 > 0)
         {
            --var_956;
         }
         if(var_956 == 0)
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
