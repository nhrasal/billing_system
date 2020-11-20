<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
 
    public function Category(){
        return $this->belongsTo(Category::class,'category_id');
    }
    public function SubCategory(){
        return $this->belongsTo(SubCategory::class,'subcategory_id');
    }
    public function Employee(){
        return $this->belongsTo(Employee::class,'employee_id');
    }
    public function NoteSheet(){
        return $this->hasOne(NoteSheetProcess::class,'notesheet_id');
    }
}
