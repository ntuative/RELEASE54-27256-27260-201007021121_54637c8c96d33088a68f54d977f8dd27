package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_452:FloorRasterizer;
      
      private var var_957:Boolean = false;
      
      private var var_662:PlaneMaskManager;
      
      private var var_451:WallRasterizer;
      
      private var var_663:WallAdRasterizer;
      
      private var var_453:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_451 = new WallRasterizer();
         var_452 = new FloorRasterizer();
         var_663 = new WallAdRasterizer();
         var_453 = new LandscapeRasterizer();
         var_662 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_451;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_663;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_452;
      }
      
      public function get initialized() : Boolean
      {
         return var_957;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_662;
      }
      
      public function dispose() : void
      {
         if(var_451 != null)
         {
            var_451.dispose();
            var_451 = null;
         }
         if(var_452 != null)
         {
            var_452.dispose();
            var_452 = null;
         }
         if(var_663 != null)
         {
            var_663.dispose();
            var_663 = null;
         }
         if(var_453 != null)
         {
            var_453.dispose();
            var_453 = null;
         }
         if(var_662 != null)
         {
            var_662.dispose();
            var_662 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_451.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_452.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_663.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_453.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_662.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_451 != null)
         {
            var_451.clearCache();
         }
         if(var_452 != null)
         {
            var_452.clearCache();
         }
         if(var_453 != null)
         {
            var_453.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_453;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_957)
         {
            return;
         }
         var_451.initializeAssetCollection(param1);
         var_452.initializeAssetCollection(param1);
         var_663.initializeAssetCollection(param1);
         var_453.initializeAssetCollection(param1);
         var_662.initializeAssetCollection(param1);
         var_957 = true;
      }
   }
}
