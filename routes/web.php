<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ImagenController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\EstablecimientoController;

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



Auth::routes(['verify'=>true]);
Route::group(['middleware'=>['auth','verified']],function(){
    Route::get('/establecimiento/create',[EstablecimientoController::class,'create'])->name('establecimiento.create')->middleware('revisar');
    Route::get('/establecimiento/edit',[EstablecimientoController::class,'edit'])->name('establecimiento.edit');
    Route::post('/establecimiento',[EstablecimientoController::class,'store'])->name('establecimientos.store');
    Route::put('/establecimiento/{establecimiento}',[EstablecimientoController::class,'update'])->name('establecimiento.update');
    Route::post('/imagenes/store',[ImagenController::class,'store'])->name('imagenes.store');
    Route::post('/imagenes/destroy',[ImagenController::class,'destroy'])->name('imagenes.destroy');

});

Route::get('/{any}',InicioController::class)->name('inicio')->where("any",".*");

