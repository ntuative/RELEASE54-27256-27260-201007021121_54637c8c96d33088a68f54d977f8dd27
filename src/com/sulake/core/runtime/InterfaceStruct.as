package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_406:uint;
      
      private var var_1046:IUnknown;
      
      private var var_1234:String;
      
      private var var_1047:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1047 = param1;
         var_1234 = getQualifiedClassName(var_1047);
         var_1046 = param2;
         var_406 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1047;
      }
      
      public function get disposed() : Boolean
      {
         return var_1046 == null;
      }
      
      public function get references() : uint
      {
         return var_406;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_406) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1046;
      }
      
      public function get iis() : String
      {
         return var_1234;
      }
      
      public function reserve() : uint
      {
         return ++var_406;
      }
      
      public function dispose() : void
      {
         var_1047 = null;
         var_1234 = null;
         var_1046 = null;
         var_406 = 0;
      }
   }
}
