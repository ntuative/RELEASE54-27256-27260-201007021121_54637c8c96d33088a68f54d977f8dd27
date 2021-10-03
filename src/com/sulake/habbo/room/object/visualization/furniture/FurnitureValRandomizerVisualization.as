package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1076:int = 31;
      
      private static const const_1077:int = 32;
      
      private static const const_512:int = 30;
      
      private static const const_772:int = 20;
      
      private static const const_513:int = 10;
       
      
      private var var_657:Boolean = false;
      
      private var var_228:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_228 = new Array();
         super();
         super.setAnimation(const_512);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_513)
         {
            if(var_657)
            {
               var_657 = false;
               var_228 = new Array();
               if(_direction == 2)
               {
                  var_228.push(const_772 + 5 - param1);
                  var_228.push(const_513 + 5 - param1);
               }
               else
               {
                  var_228.push(const_772 + param1);
                  var_228.push(const_513 + param1);
               }
               var_228.push(const_512);
               return;
            }
            super.setAnimation(const_512);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
