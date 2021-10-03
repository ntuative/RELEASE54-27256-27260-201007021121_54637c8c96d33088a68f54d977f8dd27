package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1564:String;
      
      private var var_690:String;
      
      private var var_1565:String;
      
      private var var_1566:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1566 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1564 = _loc5_[0];
         var_1565 = _loc5_[1];
         _name = param2;
         var_690 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1564;
      }
      
      public function get languageCode() : String
      {
         return var_1566;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_690;
      }
      
      public function get encoding() : String
      {
         return var_1565;
      }
      
      public function get id() : String
      {
         return var_1566 + "_" + var_1564 + "." + var_1565;
      }
   }
}
