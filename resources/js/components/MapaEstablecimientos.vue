import { latLng } from 'leaflet';
<template>
    <div class="mapa">
        <l-map
            :zoom="zoom"
            :center="center"
            :options="mapOptions"

        >
            <l-tile-layer :url="url" :attribution="attribution"/>
            <l-marker
                v-for="establecimiento in establecimientos"
                v-bind:key="establecimiento.id"
                :lat-lng="obtenerCoordenadas(establecimiento)"
                @click="redireccionar(establecimiento.id)"
            >
                <l-tooltip>
                    <div>
                        {{establecimiento.nombre}}-{{establecimiento.categoria.nombre}}
                    </div>

                </l-tooltip>
            </l-marker>
        </l-map>
    </div>
</template>
<script>
import {latLng} from 'leaflet'
import {LMap,LTileLayer,LMarker,LTooltip,LIcon} from 'vue2-leaflet'
export default {
    components:{
        LMap,
        LTileLayer,
        LMarker,
        LTooltip,
        LIcon,
    },data() {
    return {
        zoom: 12,
        center: latLng(19.6854788, -99.2278656),
        url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        attribution:
            '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
        currentZoom: 8.5,
        currentCenter: latLng(19.6854788, -99.2278656),
        showParagraph: false,
        mapOptions: {
            zoomSnap: 0.5
        },
        showMap: true
        };
    },
    created(){ //Sacar la informacion del endpoint
        axios('/api/establecimientos')
            .then(respuesta=>{
                this.$store.commit('AGREGAR_ESTABLECIMIENTOS',respuesta.data) //Enviar la informacion al state vuex
            })

    },
    computed:{ //Sacar la informacion del state e iterar
        establecimientos(){
            return this.$store.getters.obtenerEstablecimientos
        }
    },
    methods:{ //Es un metodo porque toma un parametro
        obtenerCoordenadas(establecimiento){
            return {
                lat:establecimiento.lat,
                lng:establecimiento.lng
            }
        },
        redireccionar(id){
            this.$router.push({name:'establecimiento',params:{id}})
        }
    },
    watch:{ //Que parte del state va a estar revisando por si cambia
        "$store.state.categoria":function(){ //Queremos revisar si cambia la categoria
            axios.get('/api/' + this.$store.getters.obtenerCategoria)
                .then(respuesta=>{
                    this.$store.commit('AGREGAR_ESTABLECIMIENTOS',respuesta.data)
                })
        }
    }
}
</script>
<style scoped>
.mapa{
    height: 600px;
    width: 100%;
}
</style>
