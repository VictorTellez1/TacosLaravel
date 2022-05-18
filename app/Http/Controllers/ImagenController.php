<?php

namespace App\Http\Controllers;

use App\Models\Imagen;
use App\Models\Establecimiento;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;

class ImagenController extends Controller
{
    public function store(Request $request)
    {
        //Leer la imagen, se necesita la ruta
        $ruta_imagen=$request->file('file')->store('puestos','public'); //Crear el enlace simbolico, con php artisan storage:link
        //Resize a la imagen
        $imagen=Image::make(public_path("storage/{$ruta_imagen}"))->fit(800,450);
        $imagen->save();
        //Almacenar con modelo
        $imagenDB=new Imagen;
        $imagenDB->id_establecimiento=$request['uuid']; //Hacer referencia a que establecimiento pertenece una imagen
        $imagenDB->ruta_imagen=$ruta_imagen;
        $imagenDB->save();
        $respuesta=[
            'archivo'=>$ruta_imagen
        ];
        return response()->json($respuesta); //Revisar el request cuando se sube informacion tipo texto o plana
        // return $request->file('file'); //Revisar el request cuando se sube informacion tipo file
    }
    //Eliminar una imagen
    public function destroy(Request $request)
    {
        $uuid=$request->get('uuid');
        $establecimiento=Establecimiento::where('uuid',$uuid)->first();
        $this->authorize('delete',$establecimiento);
        $imagen=$request->get('imagen');
        if(File::exists('storage/'.$imagen)){
            //Elimina la imagen del servidor
            File::delete('storage/'.$imagen);
             //Elimina la imagen de la base de datos
             Imagen::where('ruta_imagen',$imagen)->delete();
             $respuesta=[
                'mensaje'=>"Imagen Eliminada",
                'imagen'=>$imagen,
                'uuid'=>$uuid

            ];
        }
        // $respuesta=[ //Es lo que se le esta mandado a dropzone
        //     'Imagen_eliminar'=>$imagen
        // ];

        Imagen::where('ruta_imagen','=',$imagen)->delete();
        return response()->json($respuesta);
    }
}
