package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_731:IAssetLoader;
      
      private var var_1236:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1236 = param1;
         var_731 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_731;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_731 != null)
            {
               if(true)
               {
                  var_731.dispose();
                  var_731 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1236;
      }
   }
}
