package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_814:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_814 = new ByteArray();
         var_814.writeShort(param1);
         var_814.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_814.position = 0;
         if(false)
         {
            _loc1_ = var_814.readShort();
            var_814.position = 0;
         }
         return _loc1_;
      }
   }
}
