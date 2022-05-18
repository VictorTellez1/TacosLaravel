<template>
    <div>
        <h2 class="mt-4">Galeria de Imagenes</h2>
        <ul class="row list-unstyled mt-4">
            <li class="col-md-4 mb-4" v-for="imagen in imagenes" v-bind:key="imagen.id">
                <!-- v-bind:jey es un valor unico, instalar lightbox2 -->
                <a :href='`/storage/${imagen.ruta_imagen}`' data-lightbox="imagenes" data-title="Imagen Negocio">
                    <img class="img-fluid" :src='`/storage/${imagen.ruta_imagen}`'>
                </a>

            </li>

        </ul>
    </div>
</template>
<script>
import Lightbox from 'lightbox2'
export default {
    components:{
        Lightbox
    },
    computed:{
        imagenes(){
            return this.$store.getters.obtenerImagenes;
        }
    }
}
</script>
<style scoped>
    @import "https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.css";
</style>
