<template>
    <div class="container my-5">
        <h2 class="text-center mb-5">{{establecimiento.nombre}}</h2>
        <div class="row align-items-start">
            <div class="col-md-8">
                <img class="img-fluid" :src="`../storage/${establecimiento.imagen_principal}`" alt="imagen establecimiento">
                <p class="mt-2 mt-5">{{establecimiento.descripcion}}</p>
                <galeria-imagenes></galeria-imagenes>
            </div>
            <aside class="col-md-4">
                <!-- Para traer el mapa a vuejs hay que usar vue leaflet -->
                <div class="">
                    <mapa-ubicacion></mapa-ubicacion>
                </div>
                    <div class="p-4  bg-primary">
                        <h2 class="text-center text-white mt-2 mb-4">Mas informacion</h2>
                        <p class="text-white mt-1">
                            <span class="font-weight-bold">
                                Ubicacion:
                            </span>
                            {{establecimiento.direccion}}
                        </p>
                        <p class="text-white mt-1">
                            <span class="font-weight-bold">
                                Colonia:
                            </span>
                            {{establecimiento.colonia}}
                        </p>

                        <p class="text-white mt-1">
                            <span class="font-weight-bold">
                                Horario:
                            </span>
                            {{establecimiento.apertura}}-{{establecimiento.cierre}}
                        </p>
                        <p class="text-white mt-1">
                            <span class="font-weight-bold">
                                Telefono:
                            </span>
                            {{establecimiento.telefono}}
                        </p>
                    </div>
            </aside>
        </div>
    </div>
</template>
<script>
import MapaUbicacion from './MapaUbicacion.vue';
import GaleriaImagenes from './GaleriaImagenes.vue';
export default {
    components:{
        MapaUbicacion,
        GaleriaImagenes
    },
    mounted(){
        // this.$route.params //Tienes acceso a los params que mandas de un template a otro a traves de oute
        const{id}=this.$route.params;
        axios.get('/api/establecimientos/'+id) //Consultar todos los tacos tipo pastor con get, es con axios
            .then(respuesta=>{
                // this.suaderos=respuesta.data; //Guardar la respuesta en vue
                this.$store.commit('AGREGAR_ESTABLECIMIENTO',respuesta.data);
            })
    },
    computed:{
        establecimiento(){
            // return this.$store.state.establecimiento; Otra forma
            return this.$store.getters.obtenerEstablecimiento;
        }

    }
}
</script>
