package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1439:int = 4;
      
      public static const const_595:int = 3;
      
      public static const const_528:int = 2;
      
      public static const const_954:int = 1;
       
      
      private var var_2224:String;
      
      private var _disposed:Boolean;
      
      private var var_2051:int;
      
      private var var_2227:Boolean;
      
      private var var_942:String;
      
      private var var_964:PublicRoomData;
      
      private var var_2228:int;
      
      private var _index:int;
      
      private var var_2225:String;
      
      private var _type:int;
      
      private var var_1939:String;
      
      private var var_965:GuestRoomData;
      
      private var var_2226:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2224 = param1.readString();
         var_2226 = param1.readString();
         var_2227 = param1.readInteger() == 1;
         var_2225 = param1.readString();
         var_942 = param1.readString();
         var_2228 = param1.readInteger();
         var_2051 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_954)
         {
            var_1939 = param1.readString();
         }
         else if(_type == const_595)
         {
            var_964 = new PublicRoomData(param1);
         }
         else if(_type == const_528)
         {
            var_965 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2228;
      }
      
      public function get popupCaption() : String
      {
         return var_2224;
      }
      
      public function get userCount() : int
      {
         return var_2051;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2227;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_954)
         {
            return 0;
         }
         if(this.type == const_528)
         {
            return this.var_965.maxUserCount;
         }
         if(this.type == const_595)
         {
            return this.var_964.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2226;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_965 != null)
         {
            this.var_965.dispose();
            this.var_965 = null;
         }
         if(this.var_964 != null)
         {
            this.var_964.dispose();
            this.var_964 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_965;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2225;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_964;
      }
      
      public function get picRef() : String
      {
         return var_942;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1939;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
