<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();

Route::get('/dashboard', 'HomeController@dashboard')->name('dashboard');
 // category api router
 Route::get('category', 'CategoryController@data')->name('category');
 Route::post('category-store', 'CategoryController@store')->name('category.store');
 Route::get('category-edit/{id}', 'CategoryController@edit')->name('category.edit');
 Route::post('category-update', 'CategoryController@update')->name('category.update');
 Route::get('category-delete/{id}', 'CategoryController@SoftDelete')->name('category.delete');
//sub category api router
 Route::get('sub-category', 'SubCategoryController@data')->name('subcategory');
//  Route::get('sub-category', 'SubCategoryController@category');
 Route::post('sub-category-store', 'SubCategoryController@store')->name('subcategory.store');
 Route::get('sub-category-edit/{id}', 'SubCategoryController@edit')->name('subcategory.edit');
 Route::post('sub-category-update', 'SubCategoryController@update')->name('subcategory.update');
 Route::get('sub-category-delete/{id}', 'SubCategoryController@SoftDelete')->name('subcategory.delete');

 Route::get('employees', 'EmployeeController@data')->name('employee');
 Route::post('employee-store', 'EmployeeController@store')->name('employee.store');
 Route::get('employee-edit/{id}', 'EmployeeController@edit')->name('employee.edit');
 Route::post('employee-update', 'EmployeeController@update')->name('employee.update');
 Route::get('employee-delete/{id}', 'EmployeeController@SoftDelete')->name('employee.delete');
 
 Route::get('projects', 'Projectcontroller@data')->name('project');
 Route::post('project-store', 'ProjectController@store')->name('project.store');
 Route::get('project-edit/{id}', 'ProjectController@edit')->name('project.edit');
 Route::post('project-update', 'ProjectController@update')->name('project.update');
 Route::get('project-delete/{id}', 'ProjectController@SoftDelete')->name('project.delete');

 Route::get('expenses', 'ExpenseController@data')->name('expense');
 Route::get('expense-create', 'ExpenseController@Create')->name('expense.create');
 Route::post('expense-store', 'ExpenseController@store')->name('expense.store');
 Route::get('expense-edit/{id}', 'ExpenseController@edit')->name('expense.edit');
 Route::post('expense-update', 'ExpenseController@update')->name('expense.update');
 Route::get('expense-delete/{id}', 'ExpenseController@SoftDelete')->name('expense.delete');


Route::get('profile', 'UserController@Profile')->name('user.profile');
Route::post('profile-update', 'UserController@ProfileUpdate')->name('user.update');
Route::post('profile-password-change', 'UserController@ProfilePasswordUpdate')->name('user.passupdate');

//user management system
Route::get('admin-user','AdminManagementController@admin')->name('admin-user');
Route::get('admin-user-data','AdminManagementController@adminajax')->name('admin-user-ajax');
Route::post('admin-user-store','AdminManagementController@adminStore')->name('admin-user-store');
Route::post('admin-user-update','AdminManagementController@adminUpdate')->name('admin-user-update');
Route::post('admin-user-delete','AdminManagementController@adminDelete')->name('admin.delete');
Route::post('admin-user-active','AdminManagementController@adminActive')->name('admin.active');
Route::get('admin-user-find','AdminManagementController@adminFind')->name('admin-user-find');
