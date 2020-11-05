<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Expense;
use App\Category;
use App\SubCategory;
use App\Employee;
use App\ExpenseDetails;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;

class ExpenseController extends Controller
{
    public function data(){
        $expense=Expense::where('delete_status',1)->paginate(10);
        return view('backend.expense.index',compact('expense'));
    }
    public function Create(){
       $category=Category::where('delete_status',1)->get();
       $subcategory=SubCategory::where('delete_status',1)->get();
       $employee=Employee::where('delete_status',1)->get();
        return view('backend.expense.create',compact('category','subcategory','employee'));
    }
    public function store(Request $request){
        // $this->validate($request,[
        //     // 'employee_id'=>'required',
        //     'category_id'=>'required',
        //     'subcategory_id'=>'required',
        //     'employee_id'=>'required',
        //     'total_expense'=>'required',
        //     'paid'=>'required',
        // ]);
        
        // return $request;
        $expense=new Expense();
        $expense->employee_id=$request->employee_id;
        $expense->category_id=$request->category_id;
        $expense->subcategory_id=$request->subcategory_id;
        $expense->total_expense=$request->total_expense;
        $expense->paid=$request->paid;
        $expense->comments=$request->comments;
        $expense->due=$request->due;
        $expense->date=date('m-d-Y');
        $expense->user_id=Auth::user()->id;
        if($expense->save()){
            foreach ($request->amount as $key=>$fdata){
                $expenseDetails=new ExpenseDetails();
                $expenseDetails->expense=$request->expense[$key];
                $expenseDetails->expense_id=$expense->id;
                $expenseDetails->amount=$request->amount[$key];
                $expenseDetails->date=date('m-d-Y');
                $expenseDetails->save();
            }

        }
        return $expenseDetails;
        Toastr::success('Sub Expense Created','Success');
        return back();
        return $expense;
    }
    public function edit($id){
        $expense=Expense::findOrFail($id);
        return $expense;
    }
     public function update(Request $request){
        //  return $request;
         $this->validate($request,[
 
             'name'=>'required',
         ]);
        $expense=Expense::findOrFail($request->id);
        $expense->employee_id=$request->employee_id;
        $expense->category_id=$request->category_id;
        $expense->subcategory_id=$request->subcategory_id;
        $expense->total_expense=$request->total_expense;
        $expense->paid=$request->paid;
        $expense->comments=$request->comments;
        $expense->due=$request->due;
        $expense->date=$request->date;
        $expense->user_id=Auth::user()->id;
        $expense->save();
        Toastr::success('Sub Expense Update','Success');
        return $expense;
     }
     public function SoftDelete($id){
     $expense=Expense::findOrFail($id);
     if ($expense->delete_status==1){
         $expense->delete_status=0;
     }else{
         $expense->delete_status=1;
     }
     $expense->save();
     Toastr::success('Sub Expense Delete','Success');
     return response()->json(['success']);
 }
}
