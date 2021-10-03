package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.FriendRequestsView;
   import com.sulake.habbo.friendlist.FriendsView;
   import com.sulake.habbo.friendlist.SearchView;
   
   public class FriendListTabs
   {
       
      
      private var var_1770:int = 200;
      
      private var var_711:int = 200;
      
      private var var_404:IFriendListTabsDeps;
      
      private var var_422:Array;
      
      private var var_1510:FriendListTab;
      
      private var var_1511:int = 200;
      
      public function FriendListTabs(param1:IFriendListTabsDeps)
      {
         var_422 = new Array();
         super();
         var_404 = param1;
         var_422.push(new FriendListTab(var_404.getFriendList(),FriendListTab.const_82,new FriendsView(),"${friendlist.friends}","friends_footer","hdr_friends"));
         var_422.push(new FriendListTab(var_404.getFriendList(),FriendListTab.const_84,new FriendRequestsView(),"${friendlist.tab.friendrequests}","friend_requests_footer","hdr_friend_requests"));
         var_422.push(new FriendListTab(var_404.getFriendList(),FriendListTab.const_341,new SearchView(),"${generic.search}","search_footer","hdr_search"));
         toggleSelected(null);
      }
      
      public function findSelectedTab() : FriendListTab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_422)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get tabContentWidth() : int
      {
         return var_1511 - 2;
      }
      
      public function toggleSelected(param1:FriendListTab) : void
      {
         var _loc2_:FriendListTab = findSelectedTab();
         if(_loc2_ == null)
         {
            var_711 = var_1770;
            setSelected(determineDisplayedTab(param1),true);
         }
         else if(_loc2_ == param1 || param1 == null)
         {
            var_1770 = var_711;
            var_711 = 0;
            method_3();
         }
         else
         {
            setSelected(determineDisplayedTab(param1),true);
         }
      }
      
      public function method_3() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_422)
         {
            _loc1_.setSelected(false);
         }
      }
      
      public function set tabContentHeight(param1:int) : void
      {
         var_711 = param1;
      }
      
      public function findTab(param1:int) : FriendListTab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_422)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function setSelected(param1:FriendListTab, param2:Boolean) : void
      {
         var _loc3_:FriendListTab = findSelectedTab();
         method_3();
         param1.setSelected(param2);
         if(param2)
         {
            var_1510 = param1;
         }
      }
      
      private function determineDisplayedTab(param1:FriendListTab) : FriendListTab
      {
         if(param1 != null)
         {
            return param1;
         }
         if(var_1510 != null)
         {
            return var_1510;
         }
         return var_422[0];
      }
      
      public function get tabContentHeight() : int
      {
         return var_711;
      }
      
      public function set windowWidth(param1:int) : void
      {
         var_1511 = param1;
      }
      
      public function getTabs() : Array
      {
         return var_422;
      }
      
      public function get windowWidth() : int
      {
         return var_1511;
      }
   }
}
