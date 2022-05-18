<template>
    <div class="mapa">
        <l-map
            :zoom="zoom"
            :center="center"
            :options="mapOptions"
        >
            <l-tile-layer :url="url" :attribution="attribution"/>
            <l-marker :lat-lng="{lat,lng}">
                <l-tooltip>
                    <div>{{establecimiento.nombre}}</div>
                </l-tooltip>
            </l-marker>
        </l-map>
    </div>
</template>

<script>
import {latLng} from 'leaflet';
import {LMap,LTileLayer,LMarker,LTooltip} from 'vue2-leaflet'
export default {
    components:{
        LMap,
        LTileLayer,
        LMarker,
        LTooltip
    },
      data() {
        return {
            zoom: 16,
            center: latLng(19.6854788, -99.2278656),
            url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            attribution:
                '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
            currentZoom: 11.5,
            mapOptions: {
                zoomSnap: 0.5
            },
            showMap: true,
            lat: "",
            lng: ""
    };
  },
  created(){
      setTimeout(()=>{
            this.lat=this.$store.getters.obtenerEstablecimiento.lat; //En obtener establecimiento esta toda la info del establecimiento
            this.lng=this.$store.getters.obtenerEstablecimiento.lng;
            this.center=latLng(this.lat,this.lng);
      },1000);
  },
  computed:{ //Es es el que lee los datos del store
        establecimiento(){
            // return this.$store.state.establecimiento; Otra forma
            return this.$store.getters.obtenerEstablecimiento;
        }

    }
}
</script>
<style scoped>
    @import 'https://unpkg.com/leaflet@1.8.0/dist/leaflet.css';
    .mapa{
        height: 300px;
        width: 100%;
    }
</style>
