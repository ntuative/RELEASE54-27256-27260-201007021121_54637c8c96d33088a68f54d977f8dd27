package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_529:int = 6;
      
      public static const const_239:int = 5;
      
      public static const const_751:int = 2;
      
      public static const const_328:int = 9;
      
      public static const const_302:int = 4;
      
      public static const const_256:int = 2;
      
      public static const const_659:int = 4;
      
      public static const const_222:int = 8;
      
      public static const const_747:int = 7;
      
      public static const const_290:int = 3;
      
      public static const const_338:int = 1;
      
      public static const const_235:int = 5;
      
      public static const const_479:int = 12;
      
      public static const const_345:int = 1;
      
      public static const const_724:int = 11;
      
      public static const const_658:int = 3;
      
      public static const const_1650:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_422:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_422 = new Array();
         var_422.push(new Tab(_navigator,const_338,const_479,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_452));
         var_422.push(new Tab(_navigator,const_256,const_345,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_452));
         var_422.push(new Tab(_navigator,const_302,const_724,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_837));
         var_422.push(new Tab(_navigator,const_290,const_239,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_452));
         var_422.push(new Tab(_navigator,const_235,const_222,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_531));
         setSelectedTab(const_338);
      }
      
      public function getSelected() : Tab
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
      
      public function getTab(param1:int) : Tab
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
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_422)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_302;
      }
      
      public function get tabs() : Array
      {
         return var_422;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
