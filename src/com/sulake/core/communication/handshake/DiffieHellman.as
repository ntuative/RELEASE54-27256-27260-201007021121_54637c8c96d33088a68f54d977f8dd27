package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1370:BigInteger;
      
      private var var_661:BigInteger;
      
      private var var_1625:BigInteger;
      
      private var var_1624:BigInteger;
      
      private var var_2114:BigInteger;
      
      private var var_2113:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1370 = param1;
         var_1625 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2114.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1624 = new BigInteger();
         var_1624.fromRadix(param1,param2);
         var_2114 = var_1624.modPow(var_661,var_1370);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2113.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1370.toString() + ",generator: " + var_1625.toString() + ",secret: " + param1);
         var_661 = new BigInteger();
         var_661.fromRadix(param1,param2);
         var_2113 = var_1625.modPow(var_661,var_1370);
         return true;
      }
   }
}
