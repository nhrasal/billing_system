@extends('layouts.dashboard-layouts')
@section('content')
 <!-- Counts Section -->
 <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
            <li class="breadcrumb-item active">Expense</li>
            <li class=" offset-10"> <button class=" btn btn-sm btn-success create-category">Create</button></li>
          </ul>
        </div>
      </div>
 <section class="dashboard-counts section-padding">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                  <h4>Expense Create Form</h4>
                </div>
                <div class="card-body">
                <form id="expense-form" action="{{route('expense.store')}}" method="post">
                    @csrf
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                        <label> Category Name</label>
                        <select name="category_id" id="categoryId" class="categoryId form-control ">
                            <option value="">Select</option>
                            @foreach($category as $data)
                            <option value="{{ $data->id ?? ''}}">{{$data->name  ?? ''}}</option>
                            @endforeach
                            </select>
                        @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                        <label>Sub Category </label>
                        <select name="subcategory_id" id="categoryId" class="categoryId form-control ">
                            <option value="">Select</option>
                            @foreach($subcategory as $data)
                            <option value="{{ $data->id ?? ''}}">{{$data->name  ?? ''}}</option>
                            @endforeach
                            </select>
                        @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                        <label>Employee  </label>
                        <select name="employee_id" id="categoryId" class="categoryId form-control ">
                            <option value="">Select</option>
                            @foreach($employee as $data)
                            <option value="{{ $data->id ?? ''}}">{{$data->name  ?? ''}}</option>
                            @endforeach
                            </select>
                            @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    
                    <div class="new-item-add">
                        <div class="row">
                        <div class="col-md-5 col-md-5">
                            <div class="form-group">
                                <label>Expense Name</label>
                                <input type="text"  name="expense[]" placeholder="Expense Name" class="expense form-control ">
                           </div>
                        </div>
                        <div class="col-md-5 col-md-5">
                            <div class="form-group">
                                <label>Amount</label>
                                <input type="text"  name="amount[]" placeholder="Expense amount" class="amount form-control ">
                            </div>
                        </div>
                        <div class="col-md-1 col-md-2 ">
                            <a href="#" class="btn btn-sm btn-danger remove-field text-light" style="margin-top:35px"><i class="fa fa-trash"></i></a>
                        </div>
                        </div>
                    </div>
                    <div class="col-md-12 mb-4">
                    <a href="#" class="btn btn-info text-light add-new-field">Add another</a>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                        <label>Total Expense</label>
                        <input type="text" id="total" name="total_expense" placeholder="Total" class="form-control @error('description') is-invalid @enderror" readonly>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                        <label>Paid Expense</label>
                        <input type="text" id="paid" name="paid" placeholder="Paid" class="form-control @error('description') is-invalid @enderror" >
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                        <label>Due Expense</label>
                        <input type="text" id="due" name="due" placeholder="due" class="form-control @error('description') is-invalid @enderror" readonly>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                        <label>Comments </label>
                        <input type="text" id="description" name="comments" placeholder="due" class="form-control @error('description') is-invalid @enderror" >
                        </div>
                    </div>
                </div>
                
                
                
                <div class="form-group">       
                   <button class="btn btn-primary">Create</button>
                </div>
                </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
@endsection
@section('js')
<script>
    $(document).ready(function(){
        function totalAmount(){
                var t = 0;
                $('.amount').each(function(i,e){
                    var amt = $(this).val()-0;
                    t += amt;
                });
                $("#total").val(t)
            }

                var i =1;
                $(".add-new-field").click(function(e){
                    e.preventDefault();
                        var new_item=`
                        <div class="row">
                        <div class="col-md-5 col-md-5">
                                    <div class="form-group">
                                    <input type="text"  name="expense[]" placeholder="Expense Name" class="expense form-control ">
                                    
                                </div>
                            </div>
                            <div class="col-md-5 col-md-5">
                                    <div class="form-group">
                                    <input type="text"  name="amount[]" placeholder="Expense amount" class="amount form-control ">
                                    
                                </div>
                            </div>
                            <div class="col-md-1 col-md-1 ">
                                    <a href="#" class="btn btn-sm btn-danger remove-field text-light" style="margin-top:0px"><i class="fa fa-trash"></i></a>
                            </div>
                        </div>
                        `;
                        $('.new-item-add').append(new_item);
                })
                $('.new-item-add').delegate('.remove-field', 'click', function () {
                        $(this).parent().parent().remove();
                        totalAmount();
                    });
                $('.new-item-add').delegate('.amount ', 'keyup', function (){
                    var t = 0;
                    $('.amount').each(function(i,e){
                        var amt = $(this).val()-0;
                        t += amt;
                    });
                    $("#total").val(t)
                    var total=$("#due").val(t);
                    $("#paid").attr('readonly',false);
                })
                $("#paid").keyup(function(e){
                    var total=$("#total").val();
                    var paid=$("#paid").val();
                    if(total>=paid){
                        $("#paid").attr('readonly',true);
                        $("#paid").attr('max',total);
                        // $("#paid").val('0');
                    }
                    else{
                        $("#paid").attr('readonly',false);
                    }
                    var due= total-paid;
                        $("#due").val(due);
                })
        
    })
</script>
@endsection