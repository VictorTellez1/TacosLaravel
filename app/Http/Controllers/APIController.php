<?php

namespace App\Http\Controllers;

use App\Models\Imagen;
use App\Models\Categoria;
use Illuminate\Http\Request;
use App\Models\Establecimiento;

class APIController extends Controller
{
    //Metodo para obtener todos los establecimientos
    public function index()
    {
        $establecimientos=Establecimiento::with('categoria')->get(); //With es un especie de opcion que te permite traer una relacion que se haya declarado
        return response()->json($establecimientos);
    }
    public function establecimientoscategoria(Categoria $categoria)
    {
        $establecimientos=Establecimiento::where('categoria_id','=',$categoria->id)->with('categoria')->get();
        return response()->json($establecimientos);
    }
    //Metodo para obtener todas las categorias
    public function categorias()
    {
        $categorias=Categoria::all();
        return response()->json($categorias);
    }
    //Muestra las categorias en especifico
    public function categoria(Categoria $categoria)
    {
        $establecimientos=Establecimiento::where('categoria_id','=',$categoria->id)->with('categoria')->take(3)->get(); //with puede tener dentro una relacion para traer mas informacion de la propia relacion
        return response()->json($establecimientos);
    }
    //Muestra un establecimiento en especifico
    public function show(Establecimiento $establecimiento)
    {
        $imagenes=Imagen::where('id_establecimiento',$establecimiento->uuid)->get();
        $establecimiento->imagenes=$imagenes;
        return response()->json($establecimiento);
    }
}
