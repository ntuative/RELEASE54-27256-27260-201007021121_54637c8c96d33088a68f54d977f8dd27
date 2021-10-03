package com.sulake.habbo.avatar.actions
{
   public class ActiveActionData implements IActiveActionData
   {
       
      
      private var var_203:String = "";
      
      private var var_900:IActionDefinition;
      
      private var _actionParameter:String = "";
      
      public function ActiveActionData(param1:String, param2:String = "")
      {
         super();
         var_203 = param1;
         _actionParameter = param2;
      }
      
      public function set actionParameter(param1:String) : void
      {
         _actionParameter = param1;
      }
      
      public function dispose() : void
      {
         var_203 = null;
         _actionParameter = null;
         var_900 = null;
      }
      
      public function get actionType() : String
      {
         return var_203;
      }
      
      public function get actionParameter() : String
      {
         return _actionParameter;
      }
      
      public function set definition(param1:IActionDefinition) : void
      {
         var_900 = param1;
      }
      
      public function get definition() : IActionDefinition
      {
         return var_900;
      }
      
      public function get id() : String
      {
         if(var_900 == null)
         {
            return "";
         }
         return "undefined_" + _actionParameter;
      }
   }
}
