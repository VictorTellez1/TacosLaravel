<?php

namespace App\Http\Controllers;

use App\Models\Imagen;
use App\Models\Categoria;
use Illuminate\Http\Request;
use App\Models\Establecimiento;
use Intervention\Image\Facades\Image;

class EstablecimientoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categorias=Categoria::all();
        return view('establecimientos.create',compact('categorias'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data=$request->validate([
        'nombre'=>'required',
        'categoria_id'=>'required|numeric',
        'imagen_principal'=>'required',
        'direccion'=>'required',
        'colonia'=>'required',
        'lat'=>'required',
        'lng'=>'required',
        'telefono'=>'required|numeric',
        'descripcion'=>'required|min:30',
        'apertura'=>'date_format:H:i',
        'cierre'=>'date_format:H:i|after:apertura',
        'uuid'=>'required|uuid'

         ]);
        //Guardar la imagen
        $ruta_imagen=$request['imagen_principal']->store('principales','public');
        //Resize imagen
        $img=Image::make(public_path("storage/{$ruta_imagen}"))->fit(800,600);
        $img->save();
        //Guardar en la base de datos

        auth()->user()->establecimiento()->create([
            'nombre'=>$data['nombre'],
            'categoria_id'=>$data['categoria_id'],
            'imagen_principal'=>$ruta_imagen,
            'direccion'=>$data['direccion'],
            'colonia'=>$data['colonia'],
            'lat'=>$data['lat'],
            'lng'=>$data['lng'],
            'telefono'=>$data['telefono'],
            'descripcion'=>$data['descripcion'],
            'apertura'=>$data['apertura'],
            'cierre'=>$data['cierre'],
            'uuid'=>$data['uuid'],
        ]);

        return back()->with('estado1','Tu informacion se ha creado correctamente,aqui puedes actualizar tu info');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Establecimiento  $establecimiento
     * @return \Illuminate\Http\Response
     */
    public function show(Establecimiento $establecimiento)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Establecimiento  $establecimiento
     * @return \Illuminate\Http\Response
     */
    public function edit(Establecimiento $establecimiento)
    {
        $categorias=Categoria::all();
        //Obtener el establecimiento
        $establecimiento=auth()->user()->establecimiento;
        $establecimiento->apertura=date("H:i",strtotime($establecimiento->apertura));
        $establecimiento->cierre=date("H:i",strtotime($establecimiento->cierre));
        //Obtiene las imagenes del establecimiento
        $imagenes=Imagen::where('id_establecimiento','=',$establecimiento->uuid)->get();
        return view('establecimientos.edit',compact('categorias','establecimiento','imagenes'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Establecimiento  $establecimiento
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Establecimiento $establecimiento)
    {
        //Ejectuar el policy
        $this->authorize('update',$establecimiento);
        $data=$request->validate([
            'nombre'=>'required',
            'categoria_id'=>'required|numeric',
            'imagen_principal'=>'image|max:1000',
            'direccion'=>'required',
            'colonia'=>'required',
            'lat'=>'required',
            'lng'=>'required',
            'telefono'=>'required|numeric',
            'descripcion'=>'required|min:30',
            'apertura'=>'date_format:H:i',
            'cierre'=>'date_format:H:i',
            'uuid'=>'required|uuid'

        ]);
        $establecimiento->nombre=$data['nombre'];
        $establecimiento->categoria_id=$data['categoria_id'];
        $establecimiento->direccion=$data['direccion'];
        $establecimiento->colonia=$data['colonia'];
        $establecimiento->lat=$data['lat'];
        $establecimiento->lng=$data['lng'];
        $establecimiento->telefono=$data['telefono'];
        $establecimiento->descripcion=$data['descripcion'];
        $establecimiento->apertura=$data['apertura'];
        $establecimiento->cierre=$data['cierre'];
        $establecimiento->uuid=$data['uuid'];

        //Actualizar la imagen
        if(request('imagen_principal')){
            //Guardar la imagen
            $ruta_imagen=$request['imagen_principal']->store('principales','public');
            //Resize imagen
            $img=Image::make(public_path("storage/{$ruta_imagen}"))->fit(800,600);
            $img->save();
            $establecimiento->imagen_principal=$ruta_imagen;
        }
        //Guardar en la base de adtos
        $establecimiento->save();
        return back()->with('estado','Tu informacion se ha actualizado correctamente');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Establecimiento  $establecimiento
     * @return \Illuminate\Http\Response
     */
    public function destroy(Establecimiento $establecimiento)
    {
        //
    }
}
