@extends('layouts.dashboard-layouts')
@section('content')
 <!-- Counts Section -->
 <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
            <li class="breadcrumb-item active">Expanse Details</li>
            <!-- <li class=" offset-10"> <button class=" btn btn-sm btn-success expense-create">Home</button></li> -->
          </ul>
        </div>
      </div>
 <section class="dashboard-counts section-padding">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                  <h4 class="justify-content-center">Expnse Details Table</h4>
                <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>Employee Name</th>
                          <td>{{$expense->Employee->name ?? ''}}</td>
                          <th>Total Expanse</th>
                          <td>{{$expense->total_expense ?? ''}}</td>
                        </tr>
                        <tr>
                          <th> Categorye</th>
                          <td>{{$expense->Category->name ?? ''}}</td>
                          <th>Expanse Date</th>
                          <td>{{$expense->date ?? ''}}</td>
                        </tr>
                        <tr>
                          <th> Sub Categorye</th>
                          <td>{{$expense->SubCategory->name ?? ''}}</td>
                        </tr>
                      </thead>
                    </table>
                 
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>SL</th>
                          <th>Expense Description</th>
                          <th>Amount</th>
                        </tr>
                      </thead>
                      <tbody>
                          @foreach($expenseDetails as $key=>$data)
                        <tr>
                          <th scope="row">{{$loop->iteration}}</th>
                          <td>{{$data->expense ?? ''}}</td>
                          <td>{{$data->amount ?? ''}}</td>
                         
                        </tr>
                        @endforeach
                      </tbody>
                      <tfoot> 
                        <tr>
                          <th></th>
                          <th>Total Amount</th>
                          <th>{{$expense->total_expense}}</th>
                        </tr>
                     </tfoot>
                    </table>
                  </div>
                  <div class="row">
                    <div class="col-sm-6 col-md-2">
                      <a href="#" class="btn  btn-success">Accept</a>
                    </div>
                    <div class="col-sm-6 col-md-2">
                      <a href="#" class="btn  btn-danger">Reject</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
@endsection