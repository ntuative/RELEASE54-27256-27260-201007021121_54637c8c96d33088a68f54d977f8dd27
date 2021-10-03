package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_809:int = 2;
      
      private static const const_1071:Array = [0,0,0];
       
      
      private var var_795:int = 0;
      
      private var var_469:String;
      
      private var var_2262:int = 0;
      
      private const const_1461:int = 1;
      
      private var var_457:String = "";
      
      private var var_703:int = 0;
      
      private var var_1216:int = 0;
      
      private var var_1732:Boolean = false;
      
      private var var_426:Boolean;
      
      private const const_1070:int = 3;
      
      private var var_1156:int = 0;
      
      private var _effectType:int = 0;
      
      private var var_66:IAvatarImage = null;
      
      private var var_1500:String = "";
      
      private var var_2207:Boolean = false;
      
      private var var_569:Boolean = false;
      
      private var var_2258:Boolean = false;
      
      private var var_702:int = 0;
      
      private var _isDisposed:Boolean;
      
      private const const_1728:int = 3;
      
      private var var_1346:int = -1;
      
      private var var_1668:int = -1;
      
      private var var_1438:Boolean = false;
      
      private var var_2439:Array;
      
      private const const_1151:int = 0;
      
      private var var_1670:int = -1;
      
      private var var_1499:int = -1;
      
      private var var_1155:int = 0;
      
      private var var_1669:int = 0;
      
      private var var_677:String;
      
      private var var_974:Boolean = false;
      
      private var var_1437:Boolean = false;
      
      private var var_564:BitmapDataAsset;
      
      private const const_1487:int = 2;
      
      private var _visualizationData:AvatarVisualizationData = null;
      
      private var var_332:BitmapDataAsset;
      
      private var var_485:Map;
      
      public function AvatarVisualization()
      {
         var_2439 = new Array();
         super();
         var_485 = new Map();
         var_426 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         _visualizationData = param1 as AvatarVisualizationData;
         createSprites(const_1070);
         return true;
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            var_1437 = false;
         }
         if(var_457 == "sit" || var_457 == "lay")
         {
            var_1156 = param1 / 2;
         }
         else
         {
            var_1156 = 0;
         }
         var_1438 = false;
         var_974 = false;
         if(var_457 == "lay")
         {
            var_974 = true;
            _loc2_ = int(var_1500);
            if(_loc2_ < 0)
            {
               var_1438 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_172)
         {
            var_2258 = param1.getNumber(RoomObjectVariableEnum.const_223) > 0;
            var_2207 = param1.getNumber(RoomObjectVariableEnum.const_200) > 0;
            var_1732 = param1.getNumber(RoomObjectVariableEnum.const_491) > 0;
            var_1437 = param1.getNumber(RoomObjectVariableEnum.const_672) > 0;
            var_569 = param1.getNumber(RoomObjectVariableEnum.const_1014) > 0;
            var_1216 = param1.getNumber(RoomObjectVariableEnum.const_280);
            var_457 = param1.getString(RoomObjectVariableEnum.const_494);
            var_1500 = param1.getString(RoomObjectVariableEnum.const_727);
            var_1669 = param1.getNumber(RoomObjectVariableEnum.const_1031);
            _effectType = param1.getNumber(RoomObjectVariableEnum.const_394);
            var_1155 = param1.getNumber(RoomObjectVariableEnum.const_447);
            var_795 = param1.getNumber(RoomObjectVariableEnum.const_344);
            var_1499 = param1.getNumber(RoomObjectVariableEnum.const_353);
            if(var_1155 > 0 && param1.getNumber(RoomObjectVariableEnum.const_344) > 0)
            {
               var_795 = var_1155;
            }
            else
            {
               var_795 = 0;
            }
            validateActions(param2);
            var_677 = param1.getString(RoomObjectVariableEnum.const_955);
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_176);
            updateFigure(_loc3_);
            var_172 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_485)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_485.reset();
         var_66 = null;
         _loc2_ = getSprite(const_1151);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
         }
      }
      
      private function updateFigure(param1:String) : void
      {
         if(var_469 != param1)
         {
            var_469 = param1;
            resetImages();
         }
      }
      
      override public function dispose() : void
      {
         if(var_485 != null)
         {
            resetImages();
            var_485.dispose();
            var_485 = null;
         }
         _visualizationData = null;
         var_332 = null;
         var_564 = null;
         super.dispose();
         _isDisposed = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(const_1461);
         var_332 = null;
         if(var_457 == "mv" || var_457 == "std")
         {
            _loc2_.visible = true;
            if(var_332 == null || param1 != var_157)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  var_332 = var_66.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  var_332 = var_66.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(var_332 != null)
               {
                  _loc2_.asset = var_332.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            var_332 = null;
            _loc2_.visible = false;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = var_485.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = _visualizationData.getAvatar(var_469,param1,var_677,this);
            if(_loc3_ != null)
            {
               var_485.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         resetImages();
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var_564 = null;
         var _loc2_:IRoomObjectSprite = getSprite(const_1487);
         if(var_569)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               var_564 = _visualizationData.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               var_564 = _visualizationData.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(var_457 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(var_457 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(var_564 != null)
            {
               _loc2_.asset = var_564.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(_visualizationData == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:Number = param1.scale;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = updateModel(_loc4_,_loc5_);
         if(_loc9_ || _loc5_ != var_157 || var_66 == null)
         {
            if(_loc5_ != var_157)
            {
               _loc7_ = true;
               validateActions(_loc5_);
            }
            if(_loc7_ || var_66 == null)
            {
               var_66 = getAvatarImage(_loc5_);
               _loc6_ = true;
            }
            if(var_66 == null)
            {
               return;
            }
            updateShadow(_loc5_);
            updateTypingBubble(_loc5_);
            _loc8_ = updateObject(_loc3_,param1,true);
            updateActions(var_66);
            var_157 = _loc5_;
         }
         else
         {
            _loc8_ = updateObject(_loc3_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = var_426 || var_702 > 0;
         if(_loc10_)
         {
            var_702 = const_809;
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --var_702;
            --var_703;
            if(!(var_703 <= 0 || _loc7_ || _loc9_ || _loc6_))
            {
               return;
            }
            var_66.updateAnimationByFrames(1);
            var_703 = const_809;
            _loc13_ = var_66.getCanvasOffsets();
            if(_loc13_ == null || _loc13_.length < 3)
            {
               _loc13_ = const_1071;
            }
            _loc12_ = getSprite(const_1151);
            if(_loc12_ != null)
            {
               _loc16_ = var_66.getImage(AvatarSetType.const_30,false);
               if(_loc16_ != null)
               {
                  _loc12_.asset = _loc16_;
               }
               if(_loc12_.asset)
               {
                  _loc12_.offsetX = -1 * _loc5_ / 2 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + _loc5_ / 4 + _loc13_[1] + var_1156;
               }
               if(var_974)
               {
                  if(var_1438)
                  {
                     _loc12_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc12_.relativeDepth = -0.409 + _loc13_[2];
                  }
               }
               else
               {
                  _loc12_.relativeDepth = -0.01 + _loc13_[2];
               }
            }
            _loc12_ = getSprite(const_1487);
            if(_loc12_ != null && _loc12_.visible)
            {
               if(!var_974)
               {
                  _loc12_.relativeDepth = -0.02 + _loc13_[2];
               }
               else
               {
                  _loc12_.relativeDepth = -0.44 + _loc13_[2];
               }
            }
            var_426 = var_66.isAnimating();
            _loc14_ = const_1070;
            for each(_loc15_ in var_66.getSprites())
            {
               if(_loc15_.id == "avatar")
               {
                  _loc12_ = getSprite(const_1151);
                  _loc17_ = var_66.getLayerData(_loc15_);
                  _loc18_ = _loc15_.getDirectionOffsetX(var_66.getDirection());
                  _loc19_ = _loc15_.getDirectionOffsetY(var_66.getDirection());
                  if(_loc17_ != null)
                  {
                     _loc18_ += _loc17_.dx;
                     _loc19_ += _loc17_.dy;
                  }
                  if(_loc5_ < 48)
                  {
                     _loc18_ /= 2;
                     _loc19_ /= 2;
                  }
                  _loc12_.offsetX += _loc18_;
                  _loc12_.offsetY += _loc19_;
               }
               else
               {
                  _loc12_ = getSprite(_loc14_);
                  if(_loc12_ != null)
                  {
                     _loc12_.visible = true;
                     _loc20_ = var_66.getLayerData(_loc15_);
                     _loc21_ = 0;
                     _loc22_ = _loc15_.getDirectionOffsetX(var_66.getDirection());
                     _loc23_ = _loc15_.getDirectionOffsetY(var_66.getDirection());
                     _loc24_ = _loc15_.getDirectionOffsetZ(var_66.getDirection());
                     _loc25_ = 0;
                     if(_loc15_.hasDirections)
                     {
                        _loc25_ = var_66.getDirection();
                     }
                     if(_loc20_ != null)
                     {
                        _loc21_ = _loc20_.animationFrame;
                        _loc22_ += _loc20_.dx;
                        _loc23_ += _loc20_.dy;
                        _loc25_ += _loc20_.directionOffset;
                     }
                     if(_loc5_ < 48)
                     {
                        _loc22_ /= 2;
                        _loc23_ /= 2;
                     }
                     if(_loc25_ < 0)
                     {
                        _loc25_ += 8;
                     }
                     else if(_loc25_ > 7)
                     {
                        _loc25_ -= 8;
                     }
                     _loc26_ = var_66.getScale() + "_" + _loc15_.member + "_" + _loc25_ + "_" + _loc21_;
                     _loc27_ = var_66.getAsset(_loc26_);
                     if(_loc27_ == null)
                     {
                        continue;
                     }
                     _loc12_.asset = _loc27_.content as BitmapData;
                     _loc12_.offsetX = -_loc27_.offset.x - _loc5_ / 2 + _loc22_;
                     _loc12_.offsetY = -_loc27_.offset.y + _loc23_ + var_1156;
                     if(var_974)
                     {
                        _loc12_.relativeDepth = -0.409 - 0.1 * spriteCount * _loc24_;
                     }
                     else
                     {
                        _loc12_.relativeDepth = -0.01 - 0.1 * spriteCount * _loc24_;
                     }
                     if(_loc15_.ink == 33)
                     {
                        _loc12_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc12_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc14_++;
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_306 != param1.getUpdateID() || var_1346 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = var_1499;
            if(var_457 == "float")
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
            }
            _loc5_ = (_loc5_ % 360 + 360) % 360;
            if(_loc4_ != var_1670 || param3)
            {
               var_1670 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               var_66.setDirectionAngle(AvatarSetType.const_30,_loc4_);
            }
            if(_loc5_ != var_1668 || param3)
            {
               var_1668 = _loc5_;
               if(var_1668 != var_1670)
               {
                  _loc5_ -= 112.5;
                  _loc5_ = (_loc5_ + 360) % 360;
                  var_66.setDirectionAngle(AvatarSetType.const_41,_loc5_);
               }
            }
            var_306 = param1.getUpdateID();
            var_1346 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_468,var_457,var_1500);
         if(var_1216 > 0)
         {
            param1.appendAction(AvatarAction.const_283,AvatarAction.const_1326[var_1216]);
         }
         if(var_1669 > 0)
         {
            param1.appendAction(AvatarAction.const_948,var_1669);
         }
         if(var_2262 > 0)
         {
            param1.appendAction(AvatarAction.const_869,var_2262);
         }
         if(var_1155 > 0)
         {
            param1.appendAction(AvatarAction.const_940,var_1155);
         }
         if(var_795 > 0)
         {
            param1.appendAction(AvatarAction.const_973,var_795);
         }
         if(var_2258)
         {
            param1.appendAction(AvatarAction.const_271);
         }
         if(var_1732 || var_1437)
         {
            param1.appendAction(AvatarAction.const_414);
         }
         if(var_2207)
         {
            param1.appendAction(AvatarAction.const_288);
         }
         if(_effectType > 0)
         {
            param1.appendAction(AvatarAction.const_423,_effectType);
         }
         param1.endActionAppends();
         var_426 = param1.isAnimating();
         var _loc2_:int = const_1070;
         for each(_loc3_ in var_66.getSprites())
         {
            if(_loc3_.id != "avatarImage")
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
   }
}
