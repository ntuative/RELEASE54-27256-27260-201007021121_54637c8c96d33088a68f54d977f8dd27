package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1634:String = "e";
      
      public static const const_1553:String = "i";
      
      public static const const_1686:String = "s";
       
      
      private var _id:int;
      
      private var var_2007:String;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_2010:int;
      
      private var var_1254:Array;
      
      private var var_2011:int;
      
      private var var_2009:int;
      
      private var var_2008:int;
      
      private var _name:String;
      
      private var _revision:int;
      
      private var var_1219:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_2010 = param4;
         _revision = param5;
         var_2011 = param6;
         var_2009 = param7;
         var_2008 = param8;
         var_1254 = param9;
         _title = param10;
         var_1219 = param11;
         var_2007 = param12;
      }
      
      public function get tileSizeY() : int
      {
         return var_2009;
      }
      
      public function get tileSizeZ() : int
      {
         return var_2008;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get adUrl() : String
      {
         return var_2007;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return _revision;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_2010;
      }
      
      public function get tileSizeX() : int
      {
         return var_2011;
      }
      
      public function get colours() : Array
      {
         return var_1254;
      }
      
      public function get description() : String
      {
         return var_1219;
      }
   }
}
