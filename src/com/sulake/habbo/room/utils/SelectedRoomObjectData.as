package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_77:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_257:Vector3d = null;
      
      private var var_1823:int = 0;
      
      private var var_1824:String = null;
      
      private var _category:int = 0;
      
      private var var_1822:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_1822 = param3;
         var_77 = new Vector3d();
         var_77.assign(param4);
         var_257 = new Vector3d();
         var_257.assign(param5);
         var_1823 = param6;
         var_1824 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_77;
      }
      
      public function get typeId() : int
      {
         return var_1823;
      }
      
      public function get dir() : Vector3d
      {
         return var_257;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_1824;
      }
      
      public function get operation() : String
      {
         return var_1822;
      }
      
      public function dispose() : void
      {
         var_77 = null;
         var_257 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
