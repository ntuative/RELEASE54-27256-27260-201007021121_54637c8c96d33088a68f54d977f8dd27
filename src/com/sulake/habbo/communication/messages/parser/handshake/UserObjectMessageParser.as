package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_469:String;
      
      private var var_2443:String;
      
      private var var_2447:int;
      
      private var var_2446:int;
      
      private var var_653:String;
      
      private var var_1404:String;
      
      private var _name:String;
      
      private var var_582:int;
      
      private var var_1013:int;
      
      private var var_2444:int;
      
      private var _respectTotal:int;
      
      private var var_2445:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2446;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1404;
      }
      
      public function get customData() : String
      {
         return this.var_2443;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_582;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2447;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2445;
      }
      
      public function get figure() : String
      {
         return this.var_469;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_653;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_469 = param1.readString();
         this.var_653 = param1.readString();
         this.var_2443 = param1.readString();
         this.var_1404 = param1.readString();
         this.var_2444 = param1.readInteger();
         this.var_2445 = param1.readString();
         this.var_2447 = param1.readInteger();
         this.var_2446 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_1013 = param1.readInteger();
         this.var_582 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2444;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1013;
      }
   }
}
