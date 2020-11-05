<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\Role;

class AdminManagementController extends Controller
{
      public function admin(){
          $adminrole=Role::where('delete_status',1)->get();
          $admin=User::where('delete_status',1)->where('admin_id',Auth::user()->admin_id)->get();
          return view('User.admin-user.admin-user-index',compact('adminrole','admin'));
      }
      public function adminajax(){
        return  $admin=User::with('adminRole')->where('delete_status',1)->where('admin_id',Auth::user()->admin_id)->where('admin_role_id','!=',Auth::user()->admin_role_id)->get();
  
      }
      public function adminStore(Request $request){
          $validator=Validator::make($request->all(),[
              'role_id' => 'required|max:255',
              'name' => 'required|max:255',
              'email' => 'required|email|max:255|unique:Users',
              'password' => 'required|min:6|confirmed',
          ]);
          if ($validator->passes()) {
              $admin=new User();
              $admin->name=$request->name;
              $admin->role_id=$request->role_id;
              $admin->email=$request->email;
              $admin->phone=$request->phone;
            //   $admin->admin_id=Auth::user()->id;
              $admin->password=Hash::make($request->password);
              if ($admin->save()){
                //   return response(json_encode(['success' => 'Your data inserted Success full']));
                 Toastr::success('Add  User successful','Success');
                  return back();
              }else{
                  return response()->json(['error'=>'You have something wrong']);
              }
          }else
              return response()->json(['error'=>$validator->errors()->all()]);
      }
      public function adminFind(Request $request){
      //        return $request;
          return   $admin=User::findOrFail($request->id);
      }
      public function adminUpdate(Request $request){
          $admin=User::findOrFail($request->id);
          if (!empty($admin)){
            $admin->name=$request->name;
              $admin->role_id=$request->role_id;
              $admin->email=$request->email;
              $admin->phone=$request->phone;
              $admin->password=Hash::make($request->password);
              $admin->status=0;
              $admin->save();
      //            return array($admin);
              return response(json_encode(['success' => 'Your data inserted Success full']));
      //            Toastr::success('User admin Update Success','Success');
      //            return back();
          }else{
              return response()->json(['error'=>'You have something wrong']);
      //            return back();
          }
      }
      public function adminDelete(Request $request){
          $admin=User::findOrFail($request->id);
          if ($admin->delete_status==1){
              $admin->delete_status=0;
              $admin->status=0;
          }else{
              $admin->delete_status=1;
              $admin->status=1;
          }
          $admin->save();
          return response(json_encode(['success' => 'Your data Update Success full']));
      //        return back();
      }
      public function adminActive(Request $request){
          $admin=User::findOrFail($request->id);
          if ($admin->status==1){
              $admin->status=0;
          }else{
              $admin->status=1;
          }
          $admin->save();
        //   return response(json_encode(['success' => 'Your data Delete Success full']));
             Toastr::Success('admin User Active Inactive Update Successful','Success');
             return back();
      }
}
