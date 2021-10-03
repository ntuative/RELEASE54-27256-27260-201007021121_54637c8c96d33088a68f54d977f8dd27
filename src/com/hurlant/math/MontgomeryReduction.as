package com.hurlant.math
{
   use namespace bi_internal;
   
   class MontgomeryReduction implements IReduction
   {
       
      
      private var var_1588:int;
      
      private var var_2037:int;
      
      private var var_1587:int;
      
      private var var_2039:int;
      
      private var m:BigInteger;
      
      private var var_2038:int;
      
      function MontgomeryReduction(param1:BigInteger)
      {
         super();
         this.m = param1;
         var_1588 = param1.invDigit();
         var_1587 = var_1588 & 32767;
         var_2037 = var_1588 >> 15;
         var_2038 = 131071;
         var_2039 = 2 * param1.t;
      }
      
      public function convert(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         param1.abs().dlShiftTo(m.t,_loc2_);
         _loc2_.divRemTo(m,null,_loc2_);
         if(param1.s < 0 && _loc2_.compareTo(BigInteger.const_140) > 0)
         {
            m.subTo(_loc2_,_loc2_);
         }
         return _loc2_;
      }
      
      public function revert(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         param1.copyTo(_loc2_);
         reduce(_loc2_);
         return _loc2_;
      }
      
      public function sqrTo(param1:BigInteger, param2:BigInteger) : void
      {
         param1.squareTo(param2);
         reduce(param2);
      }
      
      public function reduce(param1:BigInteger) : void
      {
         /*
          * Decompilation error
          * Code may be obfuscated
          * Deobfuscation is activated but decompilation still failed. If the file is NOT obfuscated, disable "Automatic deobfuscation" for better results.
          * Error type: NullPointerException (null)
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
      
      public function mulTo(param1:BigInteger, param2:BigInteger, param3:BigInteger) : void
      {
         param1.multiplyTo(param2,param3);
         reduce(param3);
      }
   }
}
