package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1060:Array;
      
      private var var_1890:Boolean;
      
      private var var_1061:Array;
      
      private var var_1888:Boolean;
      
      private var var_1887:Boolean;
      
      private var var_1891:Boolean;
      
      private var var_163:Array;
      
      private var var_1884:Boolean;
      
      private var var_1885:Boolean;
      
      private var var_868:Array;
      
      private var var_1886:Boolean;
      
      private var var_1889:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_163 = [];
         var_1061 = [];
         var_1060 = [];
         var_868 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               var_163.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1061.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_868.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1884 = param1.readBoolean();
         var_1891 = param1.readBoolean();
         var_1888 = param1.readBoolean();
         var_1887 = param1.readBoolean();
         var_1889 = param1.readBoolean();
         var_1885 = param1.readBoolean();
         var_1890 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1060.push(param1.readString());
            _loc4_++;
         }
         var_1886 = param1.readBoolean();
      }
      
      public function get banPermission() : Boolean
      {
         return var_1889;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1061;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1888;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1890;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1884;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1061 = null;
         var_1060 = null;
         var_163 = null;
         for each(_loc1_ in var_868)
         {
            _loc1_.dispose();
         }
         var_868 = null;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return var_1060;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1885;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1887;
      }
      
      public function get offenceCategories() : Array
      {
         return var_868;
      }
      
      public function get issues() : Array
      {
         return var_163;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1886;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1891;
      }
   }
}
