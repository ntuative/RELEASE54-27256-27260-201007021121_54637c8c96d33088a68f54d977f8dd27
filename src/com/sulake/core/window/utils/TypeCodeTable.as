package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_631;
         param1["bitmap"] = const_574;
         param1["border"] = const_682;
         param1["border_notify"] = const_1189;
         param1["button"] = const_473;
         param1["button_thick"] = const_744;
         param1["button_icon"] = const_1261;
         param1["button_group_left"] = const_759;
         param1["button_group_center"] = const_721;
         param1["button_group_right"] = const_723;
         param1["canvas"] = const_557;
         param1["checkbox"] = const_767;
         param1["closebutton"] = const_849;
         param1["container"] = const_326;
         param1["container_button"] = const_678;
         param1["display_object_wrapper"] = const_708;
         param1["dropmenu"] = const_391;
         param1["dropmenu_item"] = const_408;
         param1["frame"] = const_342;
         param1["frame_notify"] = const_1447;
         param1["header"] = const_765;
         param1["icon"] = const_972;
         param1["itemgrid"] = const_863;
         param1["itemgrid_horizontal"] = const_503;
         param1["itemgrid_vertical"] = const_553;
         param1["itemlist"] = const_937;
         param1["itemlist_horizontal"] = const_316;
         param1["itemlist_vertical"] = const_336;
         param1["maximizebox"] = const_1427;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1405;
         param1["submenu"] = const_890;
         param1["minimizebox"] = const_1219;
         param1["notify"] = const_1252;
         param1["null"] = const_697;
         param1["password"] = const_608;
         param1["radiobutton"] = const_740;
         param1["region"] = const_382;
         param1["restorebox"] = const_1257;
         param1["scaler"] = const_731;
         param1["scaler_horizontal"] = const_1433;
         param1["scaler_vertical"] = const_1202;
         param1["scrollbar_horizontal"] = const_464;
         param1["scrollbar_vertical"] = const_597;
         param1["scrollbar_slider_button_up"] = const_911;
         param1["scrollbar_slider_button_down"] = const_1041;
         param1["scrollbar_slider_button_left"] = const_960;
         param1["scrollbar_slider_button_right"] = const_868;
         param1["scrollbar_slider_bar_horizontal"] = const_858;
         param1["scrollbar_slider_bar_vertical"] = const_925;
         param1["scrollbar_slider_track_horizontal"] = const_1033;
         param1["scrollbar_slider_track_vertical"] = const_949;
         param1["scrollable_itemlist"] = const_1198;
         param1["scrollable_itemlist_vertical"] = const_432;
         param1["scrollable_itemlist_horizontal"] = const_839;
         param1["selector"] = const_768;
         param1["selector_list"] = const_623;
         param1["submenu"] = const_890;
         param1["tab_button"] = const_756;
         param1["tab_container_button"] = const_1000;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_1001;
         param1["tab_selector"] = const_655;
         param1["text"] = const_755;
         param1["input"] = const_737;
         param1["toolbar"] = const_1357;
         param1["tooltip"] = const_354;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
