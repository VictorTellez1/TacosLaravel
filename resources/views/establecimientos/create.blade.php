@extends('layouts.app')
@section('titulo')
    Crear
@endsection
@section('styles')
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" integrity="sha512-hoalWLoI8r4UszCkZ5kL8vayOGVae1oxXe/2A4AO6J9+580uKHDO3JdHb7NzwwzK5xr/Fs0W40kiNHxM9vyTtQ==" crossorigin="" />
<link
      rel="stylesheet"
      href="https://unpkg.com/esri-leaflet-geocoder/dist/esri-leaflet-geocoder.css"
    />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/basic.css" integrity="sha512-+Vla3mZvC+lQdBu1SKhXLCbzoNCl0hQ8GtCK8+4gOJS/PN9TTn0AO6SxlpX8p+5Zoumf1vXFyMlhpQtVD5+eSw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@endsection
@section('content')
@if (session('estado'))
<div class="alert alert-primary" role="alert">
    {{session('estado')}}
</div>
@endif
    <div class="container">
        <h1 class="text-center mt-4">Registrar Establecimiento</h1>
        <div class="mt-5 row ">
            <form
                class="col-md-9 col-xs-12 card-body"
                action="{{route('establecimientos.store')}}"
                method="POST"
                enctype="multipart/form-data"
            >
            @csrf
                <fieldset class="border p-4">
                    <legend class="text-primary">Nombre del puest,especialidad e imagen principal</legend>
                    <div class="form-group">
                        <label for="nombre">Nombre Puesto</label>
                        <input
                            id="nombre"
                            type="text"
                            class="form-control @error('nombre') is-invalid @enderror"
                            placeholder="Nombre del puesto"
                            name="nombre"
                            value="{{old('nombre')}}"
                        >
                        @error('nombre')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="categoria">Especialidad</label>
                        <select
                            class="form-control @error('categoria_id') is-invalid @enderror"
                            name="categoria_id"
                            id="categoria"
                        >
                            <option value="" selected disabled>--Selecciona la especialidad del puesto</option>
                            @foreach ($categorias as $categoria )
                                <option
                                    value="{{$categoria->id}}"
                                    {{old('categoria_id')===$categoria->id ? 'selected' : ''}}
                                    >{{$categoria->nombre}}</option>
                            @endforeach
                        </select>
                        @error('categoria_id')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="imagen_principal">Imagen Principal</label>
                        <input
                            id="imagen_principal"
                            type="file"
                            class="form-control @error('imagen_principal') is-invalid @enderror"
                            name="imagen_principal"
                            value="{{old('imagen_principal')}}"
                        >
                        @error('imagen_principal')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                        @enderror
                    </div>
                </fieldset>
                <fieldset class="border p-4">
                    <legend class="text-primary">Ubicacion</legend>
                    <div class="form-group">
                        <label for="formbuscador">Coloca la direccion del Establecimiento</label>
                        <input
                            id="formbuscador"
                            type="text"
                            placeholder="Direccion de la siguiente forma: Calle + Municipio"
                            class="form-control"
                        >
                        <p class="text-secundary mt-5 mb-3 text-center">El asistente colocara una direccion estimada, o mueve el pin hacia el lugar correcto</p>
                    </div>
                    <div class="form-group">
                        <div id="mapa" style="height:400px;"></div>

                    </div>
                    <p class="informacion">Confirma que los siguientes campos son correctos</p>
                    <div class="form-group">
                        <label for="direccion">Direccion</label>
                        <input
                            type="text"
                            id="direccion"
                            name="direccion"
                            class="form-control @error ('direccion') is-invalid @enderror"
                            placeholder="Direccion"
                            value="{{old('direccion')}}"
                        >
                        @error('direccion')
                        <div class="invalid-feedback">
                            {{$message}}
                        </div>
                    @enderror
                    </div>
                    <div class="form-group">
                        <label for="direccion">Colonia</label>
                        <input
                            type="text"
                            id="colonia"
                            name="colonia"
                            class="form-control @error ('colonia') is-invalid @enderror"
                            placeholder="Colonia"
                            value="{{old('colonia')}}"
                        >
                        @error('colonia')
                        <div class="invalid-feedback">
                            {{$message}}
                        </div>
                    @enderror
                    </div>
                    <input type="hidden" id="lat" name="lat" value="{{old("lat")}}">
                    <input type="hidden" id="lng" name="lng" value="{{old("lgn")}}">
                </fieldset>
                <fieldset class="border p-4 mt-5">
                    <legend  class="text-primary">Información Establecimiento: </legend>
                        <div class="form-group">
                            <label for="telefono">Teléfono</label>
                            <input
                                type="numeric"
                                class="form-control @error('telefono')  is-invalid  @enderror"
                                id="telefono"
                                placeholder="Teléfono Establecimiento"
                                name="telefono"
                                value="{{ old('telefono') }}"
                            >

                                @error('telefono')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                        </div>



                        <div class="form-group">
                            <label for="nombre">Descripción</label>
                            <textarea
                                class="form-control  @error('descripcion')  is-invalid  @enderror"
                                name="descripcion"
                            >{{ old('descripcion') }}</textarea>

                                @error('descripcion')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                        </div>

                        <div class="form-group">
                            <label for="nombre">Hora Apertura:</label>
                            <input
                                type="time"
                                class="form-control @error('apertura')  is-invalid  @enderror"
                                id="apertura"
                                name="apertura"
                                value="{{ old('apertura') }}"
                            >
                            @error('apertura')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="nombre">Hora Cierre:</label>
                            <input
                                type="time"
                                class="form-control @error('cierre')  is-invalid  @enderror"
                                id="cierre"
                                name="cierre"
                                value="{{ old('cierre') }}"
                            >
                            @error('cierre')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                            @enderror
                        </div>
                </fieldset>
                <fieldset class="border p-4 mt-5">
                    <legend class="text-primary">Imagenes Establecimiento : </legend>
                        <div class="form-group">
                            <label for="imagenes">Imagenes</label>
                            <div id="dropzone" class="dropzone form-control p-5">
                        </div>
                </fieldset>
                <input type="hidden" id="uuid" name="uuid" value="{{Str::uuid()->toString()}}">
                <input type="submit" class="btn btn-primary mt-3 d-block" value="Registrar Puesto de Tacos">
            </form>

        </div>
    </div>

@endsection
@section('scripts')
<script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js" integrity="sha512-BB3hKbKWOc9Ez/TAwyWxNXeoV9c1v6FIeYiBieIWkpLjauysF18NzgR1MBNBXf8/KABdlkX68nAhlwcDFLGPCQ==" crossorigin=""></script>
<script src="https://unpkg.com/esri-leaflet" defer></script>
<script src="https://unpkg.com/esri-leaflet-geocoder" defer></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/min/dropzone.min.js" integrity="sha512-oQq8uth41D+gIH/NJvSJvVB85MFk1eWpMK6glnkg6I7EdMqC1XVkW7RxLheXwmFdG03qScCM7gKS/Cx3FYt7Tg==" crossorigin="anonymous" referrerpolicy="no-referrer" defer></script>

@endsection
