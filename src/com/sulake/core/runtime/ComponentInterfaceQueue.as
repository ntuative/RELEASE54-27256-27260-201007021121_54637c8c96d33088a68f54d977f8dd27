package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1213:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_842:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1213 = param1;
         var_842 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_842;
      }
      
      public function get identifier() : IID
      {
         return var_1213;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1213 = null;
            while(false)
            {
               var_842.pop();
            }
            var_842 = null;
         }
      }
   }
}
