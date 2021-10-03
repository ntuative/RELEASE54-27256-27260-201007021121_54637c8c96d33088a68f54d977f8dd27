package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.habbo.avatar.AvatarFigureContainer;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboIconType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarEditorGridPartItem implements IAvatarImageListener
   {
      
      private static var var_59:Array = [];
      
      {
         var_59.push("li");
         var_59.push("lh");
         var_59.push("ls");
         var_59.push("lc");
         var_59.push("bd");
         var_59.push("sh");
         var_59.push("lg");
         var_59.push("ch");
         var_59.push("ca");
         var_59.push("cc");
         var_59.push("cp");
         var_59.push("wa");
         var_59.push("rh");
         var_59.push("rs");
         var_59.push("rc");
         var_59.push("hd");
         var_59.push("fc");
         var_59.push("ey");
         var_59.push("hr");
         var_59.push("hrb");
         var_59.push("fa");
         var_59.push("ea");
         var_59.push("ha");
         var_59.push("he");
         var_59.push("ri");
      }
      
      private const const_1734:int = 16777215;
      
      private var _isSelected:Boolean = false;
      
      private var var_1516:BitmapData;
      
      private var var_410:Rectangle;
      
      private var _isDisposed:Boolean;
      
      private const const_1735:int = 13421772;
      
      private var _colors:Array;
      
      private var var_1518:Boolean;
      
      private var var_395:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var _model:IAvatarEditorCategoryModel;
      
      private var var_606:IFigurePartSet;
      
      private var var_1517:int = 0;
      
      private var var_411:IAvatarRenderManager;
      
      private const const_246:Array = [2,6,0,4,3,1];
      
      public function AvatarEditorGridPartItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IFigurePartSet, param4:Array, param5:Boolean = true)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _model = param2;
         var_606 = param3;
         _window = param1;
         _colors = param4;
         var_1518 = param5;
         if(param3 == null)
         {
            var_395 = new BitmapData(1,1,true,16777215);
         }
         if(param3 != null)
         {
            _loc7_ = param3.parts;
            for each(_loc6_ in _loc7_)
            {
               var_1517 = Math.max(var_1517,_loc6_.colorLayerIndex);
            }
         }
         var_411 = _model.controller.avatarRenderManager;
         updateThumbVisualization();
      }
      
      private function renderThumb() : BitmapData
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         if(partSet == null)
         {
            return null;
         }
         if(_model == null)
         {
            return null;
         }
         if(var_410 == null)
         {
            if(!analyzePartLayers())
            {
               if(!var_1516)
               {
                  _loc9_ = _model.controller.assets.getAssetByName("avatar_editor_download_icon");
                  var_1516 = _loc9_.content as BitmapData;
               }
               return var_1516;
            }
         }
         if(!var_411)
         {
            return null;
         }
         _loc1_ = new BitmapData(var_410.width,var_410.height,true,16777215);
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Array = partSet.parts.concat().sort(sortByDrawOrder);
         for each(_loc2_ in _loc8_)
         {
            if(_loc7_)
            {
               _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + const_246[_loc6_] + "_" + FigureData.const_107;
               _loc4_ = var_411.getAssetByName(_loc3_) as BitmapDataAsset;
            }
            else
            {
               _loc6_ = 0;
               while(!_loc7_ && _loc6_ < const_246.length)
               {
                  _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + const_246[_loc6_] + "_" + FigureData.const_107;
                  _loc4_ = var_411.getAssetByName(_loc3_) as BitmapDataAsset;
                  if(_loc4_ && _loc4_.content)
                  {
                     _loc7_ = true;
                  }
                  else
                  {
                     _loc6_++;
                  }
               }
            }
            if(_loc4_)
            {
               _loc5_ = (_loc4_.content as BitmapData).clone();
               _loc10_ = -1 * _loc4_.offset.x - 0;
               _loc11_ = -1 * _loc4_.offset.y - 0;
               if(var_1518 && _loc2_.colorLayerIndex > 0)
               {
                  _loc12_ = _colors[_loc2_.colorLayerIndex - 1];
                  if(_loc12_ != null)
                  {
                     _loc5_.colorTransform(_loc5_.rect,_loc12_.colorTransform);
                  }
               }
               _loc1_.copyPixels(_loc5_,_loc5_.rect,new Point(_loc10_,_loc11_),null,null,true);
            }
            else
            {
               Logger.log("Could not find asset: " + _loc3_);
            }
         }
         return _loc1_;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
         updateThumbVisualization();
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_395 = param1;
         updateThumbVisualization();
      }
      
      public function set colors(param1:Array) : void
      {
         _colors = param1;
         updateThumbVisualization();
      }
      
      public function get colorLayerCount() : int
      {
         return var_1517;
      }
      
      private function sortByDrawOrder(param1:IFigurePart, param2:IFigurePart) : Number
      {
         var _loc3_:Number = var_59.indexOf(param1.type);
         var _loc4_:Number = var_59.indexOf(param2.type);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
      
      private function updateThumbVisualization() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!_window || false)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("bitmap") as IBitmapWrapperWindow;
         if(_loc1_)
         {
            if(var_395 != null && !var_1518)
            {
               _loc3_ = var_395;
            }
            else
            {
               _loc3_ = renderThumb();
               if(!_loc3_)
               {
                  return;
               }
            }
            _loc4_ = !!_loc1_.bitmap ? _loc1_.bitmap : new BitmapData(_loc1_.width,_loc1_.height);
            _loc4_.fillRect(_loc4_.rect,16777215);
            _loc5_ = (_loc4_.width - _loc3_.width) / 2;
            _loc6_ = (_loc4_.height - _loc3_.height) / 2;
            _loc4_.copyPixels(_loc3_,_loc3_.rect,new Point(_loc5_,_loc6_),null,null,true);
            _loc1_.bitmap = _loc4_;
         }
         var _loc2_:IIconWindow = _window.findChildByTag("CLUB_ICON") as IIconWindow;
         if(_loc2_)
         {
            if(var_606)
            {
               switch(var_606.clubLevel)
               {
                  case HabboClubLevelEnum.const_45:
                     _loc2_.visible = false;
                     break;
                  case HabboClubLevelEnum.const_53:
                     _loc2_.style = HabboIconType.const_538;
                     break;
                  case HabboClubLevelEnum.const_47:
                     _loc2_.style = HabboIconType.const_558;
               }
            }
            else
            {
               _loc2_.visible = false;
            }
         }
         if(isSelected)
         {
            _window.color = const_1735;
         }
         else
         {
            _window.color = const_1734;
         }
         _window.invalidate();
      }
      
      private function analyzePartLayers() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_model == null)
         {
            var_410 = null;
            return false;
         }
         if(!partSet || true || partSet.parts.length == 0)
         {
            var_410 = null;
            return false;
         }
         if(!var_411)
         {
            return false;
         }
         var _loc1_:AvatarFigureContainer = var_411.createFigureContainer("undefined-undefined");
         Logger.log("QUERYING SET:undefined-undefined");
         if(!var_411.isFigureReady(_loc1_))
         {
            var_411.downloadFigure(_loc1_,this);
            return false;
         }
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Rectangle = new Rectangle();
         for each(_loc2_ in partSet.parts)
         {
            if(_loc7_)
            {
               _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + const_246[_loc6_] + "_" + FigureData.const_107;
               _loc4_ = var_411.getAssetByName(_loc3_) as BitmapDataAsset;
            }
            else
            {
               _loc6_ = 0;
               while(!_loc7_ && _loc6_ < const_246.length)
               {
                  _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + const_246[_loc6_] + "_" + FigureData.const_107;
                  _loc4_ = var_411.getAssetByName(_loc3_) as BitmapDataAsset;
                  if(_loc4_ && _loc4_.content)
                  {
                     _loc7_ = true;
                  }
                  else
                  {
                     _loc6_++;
                  }
               }
            }
            if(_loc4_ && _loc4_.content)
            {
               _loc5_ = _loc4_.content as BitmapData;
               _loc8_ = _loc8_.union(new Rectangle(-1 * _loc4_.offset.x,-1 * _loc4_.offset.y,_loc5_.width,_loc5_.height));
            }
         }
         if(_loc8_ && _loc8_.width > 0)
         {
            var_410 = _loc8_;
            return true;
         }
         return false;
      }
      
      public function get id() : int
      {
         if(var_606 == null)
         {
            return -1;
         }
         return var_606.id;
      }
      
      public function dispose() : void
      {
         _model = null;
         var_606 = null;
         if(_window != null)
         {
            if(true)
            {
               _window.dispose();
            }
         }
         _window = null;
         if(var_395)
         {
            var_395.dispose();
         }
         var_395 = null;
         _isDisposed = true;
      }
      
      public function update() : void
      {
         updateThumbVisualization();
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(!analyzePartLayers())
         {
            return;
         }
         updateThumbVisualization();
      }
      
      public function get partSet() : IFigurePartSet
      {
         return var_606;
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
   }
}
