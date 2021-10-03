package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1053:Boolean;
      
      private var var_1052:Boolean;
      
      private var var_1054:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1053;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1052;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1054 = param1.readBoolean();
         var_1052 = param1.readBoolean();
         var_1053 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1054;
      }
      
      public function flush() : Boolean
      {
         var_1054 = false;
         var_1052 = false;
         var_1053 = false;
         return true;
      }
   }
}
