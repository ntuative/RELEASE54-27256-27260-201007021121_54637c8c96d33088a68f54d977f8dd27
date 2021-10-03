package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_114;
         param1["bound_to_parent_rect"] = const_85;
         param1["child_window"] = const_1061;
         param1["embedded_controller"] = const_357;
         param1["resize_to_accommodate_children"] = const_64;
         param1["input_event_processor"] = const_44;
         param1["internal_event_handling"] = const_547;
         param1["mouse_dragging_target"] = const_224;
         param1["mouse_dragging_trigger"] = const_337;
         param1["mouse_scaling_target"] = const_264;
         param1["mouse_scaling_trigger"] = const_485;
         param1["horizontal_mouse_scaling_trigger"] = const_238;
         param1["vertical_mouse_scaling_trigger"] = const_240;
         param1["observe_parent_input_events"] = const_1030;
         param1["optimize_region_to_layout_size"] = const_497;
         param1["parent_window"] = const_1022;
         param1["relative_horizontal_scale_center"] = const_177;
         param1["relative_horizontal_scale_fixed"] = const_111;
         param1["relative_horizontal_scale_move"] = const_356;
         param1["relative_horizontal_scale_strech"] = const_270;
         param1["relative_scale_center"] = const_906;
         param1["relative_scale_fixed"] = const_581;
         param1["relative_scale_move"] = const_993;
         param1["relative_scale_strech"] = const_951;
         param1["relative_vertical_scale_center"] = const_175;
         param1["relative_vertical_scale_fixed"] = const_133;
         param1["relative_vertical_scale_move"] = const_303;
         param1["relative_vertical_scale_strech"] = const_257;
         param1["on_resize_align_left"] = const_642;
         param1["on_resize_align_right"] = const_435;
         param1["on_resize_align_center"] = const_406;
         param1["on_resize_align_top"] = const_710;
         param1["on_resize_align_bottom"] = const_431;
         param1["on_resize_align_middle"] = const_375;
         param1["on_accommodate_align_left"] = const_1025;
         param1["on_accommodate_align_right"] = const_482;
         param1["on_accommodate_align_center"] = const_633;
         param1["on_accommodate_align_top"] = const_1019;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_766;
         param1["route_input_events_to_parent"] = const_474;
         param1["use_parent_graphic_context"] = const_29;
         param1["draggable_with_mouse"] = const_987;
         param1["scalable_with_mouse"] = const_941;
         param1["reflect_horizontal_resize_to_parent"] = const_483;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_247;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
