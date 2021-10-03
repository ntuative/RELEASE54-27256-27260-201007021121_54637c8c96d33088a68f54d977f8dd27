package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.events.EventDispatcher;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_687:int = 8;
      
      public static const const_1511:int = 10;
      
      public static const const_1265:int = 6;
      
      private static var var_1068:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1386:int = 0;
      
      public static const const_1676:int = 1;
      
      public static const const_1712:int = 2;
      
      public static const const_1645:int = 3;
      
      public static const const_1559:int = 4;
      
      public static const const_1627:int = 5;
      
      public static const const_1507:int = 9;
      
      public static const const_1662:int = 7;
       
      
      private var var_175:uint = 0;
      
      private var var_1067:uint = 0;
      
      private var var_727:Date;
      
      private var var_1908:int = -1;
      
      private var var_99:Function;
      
      private var var_509:Boolean = false;
      
      private var var_68:EventDispatcher;
      
      private var var_2453:int = -1;
      
      private var var_1276:uint = 0;
      
      private var var_1907:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_872:uint;
      
      private var var_22:ByteArray;
      
      private var var_729:uint;
      
      private var var_1546:Boolean = false;
      
      private var var_2452:int = -1;
      
      private var var_1548:String = "2.0";
      
      private var var_176:Boolean = false;
      
      private var var_1906:Boolean = false;
      
      private var var_362:String;
      
      private var var_610:uint = 0;
      
      private var var_1277:int = 0;
      
      private var var_415:String = "";
      
      private var var_728:int = 8;
      
      private var var_1547:Boolean = false;
      
      public function FZipFile(param1:EventDispatcher, param2:String = "utf-8")
      {
         var_99 = parseFileHead;
         super();
         var_362 = param2;
         var_68 = param1;
         _extraFields = new Dictionary();
         var_22 = new ByteArray();
         var_22.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_610;
      }
      
      public function set filename(param1:String) : void
      {
         var_415 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_176 && false)
         {
            var_22.position = 0;
            if(var_1068)
            {
               var_22.uncompress.apply(var_22,["deflate"]);
            }
            else
            {
               var_22.uncompress();
            }
            var_22.position = 0;
            var_176 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_415;
      }
      
      public function get date() : Date
      {
         return var_727;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && var_99(param1))
         {
         }
         return var_99 === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1547)
         {
            var_99 = parseFileIdle;
            var_68.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_117,"Data descriptors are not supported."));
            return false;
         }
         if(var_175 == 0)
         {
            var_99 = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_175)
            {
               return false;
            }
            parseContent(param1);
            var_99 = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1548;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_176)
         {
            uncompress();
         }
         var_22.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_22.readUTFBytes(var_22.bytesAvailable);
         }
         else
         {
            _loc3_ = var_22.readMultiByte(var_22.bytesAvailable,param2);
         }
         var_22.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_728 === const_687 && !var_1546)
         {
            if(var_1068)
            {
               param1.readBytes(var_22,0,var_175);
            }
            else
            {
               if(!var_509)
               {
                  var_68.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_117,"Adler32 checksum not found."));
                  return;
               }
               var_22.writeByte(120);
               _loc2_ = uint(~var_1908 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_22.writeByte(_loc2_);
               param1.readBytes(var_22,2,var_175);
               var_22.position = var_22.length;
               var_22.writeUnsignedInt(var_872);
            }
            var_176 = true;
         }
         else
         {
            if(var_728 != const_1386)
            {
               var_68.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_117,"Compression method " + var_728 + " is not supported."));
               return;
            }
            param1.readBytes(var_22,0,var_175);
            var_176 = false;
         }
         var_22.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1067 + var_1276 > 0)
            {
               var_99 = parseFileHeadExt;
            }
            else
            {
               var_99 = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_22.length = 0;
         var_22.position = 0;
         var_176 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_22.writeUTFBytes(param1);
            }
            else
            {
               var_22.writeMultiByte(param1,param2);
            }
            var_729 = ChecksumUtil.CRC32(var_22);
            var_509 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_727 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1277 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1277 << 8 | 20);
         param1.writeShort(var_362 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_687);
         var _loc5_:Date = var_727 != null ? var_727 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_729);
         param1.writeUnsignedInt(var_175);
         param1.writeUnsignedInt(var_610);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_362 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_415);
         }
         else
         {
            _loc8_.writeMultiByte(var_415,var_362);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_509)
            {
               _loc16_ = var_176;
               if(_loc16_)
               {
                  uncompress();
               }
               var_872 = ChecksumUtil.Adler32(var_22,0,var_22.length);
               var_509 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_872);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_362 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1907);
            }
            else
            {
               _loc8_.writeMultiByte(var_1907,var_362);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_175 > 0)
         {
            if(var_1068)
            {
               _loc13_ = 0;
               param1.writeBytes(var_22,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_22,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_175;
      }
      
      protected function compress() : void
      {
         if(!var_176)
         {
            if(false)
            {
               var_22.position = 0;
               var_610 = var_22.length;
               if(var_1068)
               {
                  var_22.compress.apply(var_22,["deflate"]);
                  var_175 = var_22.length;
               }
               else
               {
                  var_22.compress();
                  var_175 = -6;
               }
               var_22.position = 0;
               var_176 = true;
            }
            else
            {
               var_175 = 0;
               var_610 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1067 + var_1276)
         {
            parseHeadExt(param1);
            var_99 = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_362 == "utf-8")
         {
            var_415 = param1.readUTFBytes(var_1067);
         }
         else
         {
            var_415 = param1.readMultiByte(var_1067,var_362);
         }
         var _loc2_:uint = var_1276;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               var_68.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_117,"Parse error in file " + var_415 + ": Extra field data size too big."));
               return;
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_872 = param1.readUnsignedInt();
               var_509 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1277 = _loc2_ >> 8;
         var_1548 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_728 = param1.readUnsignedShort();
         var_1546 = (_loc3_ & 1) !== 0;
         var_1547 = (_loc3_ & 8) !== 0;
         var_1906 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_362 = "utf-8";
         }
         if(var_728 === const_1265)
         {
            var_2452 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2453 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_728 === const_687)
         {
            var_1908 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_727 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_729 = param1.readUnsignedInt();
         var_175 = param1.readUnsignedInt();
         var_610 = param1.readUnsignedInt();
         var_1067 = param1.readUnsignedShort();
         var_1276 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_22,0,param1.length);
            var_729 = ChecksumUtil.CRC32(var_22);
            var_509 = false;
         }
         else
         {
            var_22.length = 0;
            var_22.position = 0;
            var_176 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_415 + "\n  date:" + var_727 + "\n  sizeCompressed:" + var_175 + "\n  sizeUncompressed:" + var_610 + "\n  versionHost:" + var_1277 + "\n  versionNumber:" + var_1548 + "\n  compressionMethod:" + var_728 + "\n  encrypted:" + var_1546 + "\n  hasDataDescriptor:" + var_1547 + "\n  hasCompressedPatchedData:" + var_1906 + "\n  filenameEncoding:" + var_362 + "\n  crc32:" + var_729.toString(16) + "\n  adler32:" + var_872.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_176)
         {
            uncompress();
         }
         return var_22;
      }
   }
}
