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
        $this->validate($request,[
            // 'employee_id'=>'required',
            'category_id'=>'required',
            'subcategory_id'=>'required',
            'employee_id'=>'required',
            'total_expense'=>'required',
            'paid'=>'required',
        ]);

        $total=$request->total_expense;
        $paid=$request->paid;
        $due=$request->due;
        if($due <0){
            Toastr::error('Your paid value is not valid','Error');
            return back();
        }
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
        // return $expense;
    }
    public function edit($id){
        $category=Category::where('delete_status',1)->get();
        $subcategory=SubCategory::where('delete_status',1)->get();
        $employee=Employee::where('delete_status',1)->get();
        $expense=Expense::findOrFail($id);
        $expenseDetails=ExpenseDetails::where('expense_id',$expense->id)->where('delete_status',1)->get();
       return view('backend.expense.edit',compact('expense','expenseDetails','category','subcategory','employee'));
    }
     public function update(Request $request){
        //  return $request;
        //  $this->validate($request,[
 
        //      'name'=>'required',
        //  ]);
        $expense=Expense::findOrFail($request->id);
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
                $exDe=ExpenseDetails::where('expense_id',$expense->id)->first();
                if($exDe){
                    $expenseDetails= ExpenseDetails::findOrFail($exDe->id);
                    $expenseDetails->expense=$request->expense[$key];
                    $expenseDetails->expense_id=$expense->id;
                    $expenseDetails->amount=$request->amount[$key];
                    $expenseDetails->date=date('m-d-Y');
                    $expenseDetails->save();
                }else{
                    $expenseDetails=new ExpenseDetails();
                    $expenseDetails->expense=$request->expense[$key];
                    $expenseDetails->expense_id=$expense->id;
                    $expenseDetails->amount=$request->amount[$key];
                    $expenseDetails->date=date('m-d-Y');
                    $expenseDetails->save();
                }
               
            }

        }
        Toastr::success('Sub Expense Update','Success');
        return back();
        return $expense;
     }
     public function SoftDelete($id){
        //  return $id;
     $expense=Expense::findOrFail($id);
     if ($expense->delete_status==1){
         $expense->delete_status=0;
         $exDetails=ExpenseDetails::where('expense_id',$expense->id)->update(array('delete_status' => 0));
     }else{
         $expense->delete_status=1;
         $exDetails=ExpenseDetails::where('expense_id',$expense->id)->update(array('delete_status' =>1));
     }
     $expense->save();
     Toastr::success('Sub Expense Delete','Success');
     return back();
     return response()->json(['success']);
 }
 public function SoftDeleteExDe($id){
    $exDetails=ExpenseDetails::findOrFail($id);
    $exDetails->delete_status=0;
    $exDetails->save();
    $expense=Expense::findOrFail($exDetails->expense_id);
    $expense->total_expense=$expense->total_expense-$exDetails->amount;
    $expense->due=$expense->due-$exDetails->amount;
    $expense->save();
    Toastr::success('Sub Expense Details Delete Successful','Success');
     return back();
 }
}
