package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1050:int = 0;
      
      private var var_1262:int = 0;
      
      private var var_1788:String = "";
      
      private var var_1051:int = 0;
      
      private var var_1867:String = "";
      
      private var var_1865:int = 0;
      
      private var var_1514:String = "";
      
      private var var_1868:int = 0;
      
      private var var_1866:int = 0;
      
      private var var_1787:String = "";
      
      private var var_1864:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1868 = param1;
         var_1787 = param2;
         var_1514 = param3;
         var_1788 = param4;
         var_1867 = param5;
         if(param6)
         {
            var_1262 = 1;
         }
         else
         {
            var_1262 = 0;
         }
         var_1865 = param7;
         var_1866 = param8;
         var_1051 = param9;
         var_1864 = param10;
         var_1050 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1868,var_1787,var_1514,var_1788,var_1867,var_1262,var_1865,var_1866,var_1051,var_1864,var_1050];
      }
      
      public function dispose() : void
      {
      }
   }
}
