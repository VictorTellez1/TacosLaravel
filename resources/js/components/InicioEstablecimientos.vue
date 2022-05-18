<template>
    <div>
        <listado-categorias></listado-categorias>
        <mapa-establecimientos></mapa-establecimientos>
        <categoria-pastor></categoria-pastor>
        <categoria-suadero></categoria-suadero>
        <categoria-bisctec></categoria-bisctec>
        <categoria-cabeza></categoria-cabeza>
        <categoria-carnitas></categoria-carnitas>
        <categoria-lengua></categoria-lengua>
        <categoria-arrachera></categoria-arrachera>
    </div>
</template>
<script>
import ListadoCategorias from './ListadoCategorias.vue'
import MapaEstablecimientos from './MapaEstablecimientos.vue'
import CategoriaPastor from './CategoriaPastor.vue'
import CategoriaSuadero from './CategoriaSuadero.vue'
import CategoriaBisctec from './CategoriaBistec.vue'
import CategoriaCabeza from './CategoriaCabeza.vue'
import CategoriaCarnitas from './CategoriaCarnitas.vue'
import CategoriaLengua from './CategoriaLengua.vue'
import CategoriaArrachera from './CategoriaArrachera.vue'
export default {
    components:{
        CategoriaPastor,
        CategoriaSuadero,
        MapaEstablecimientos,
        ListadoCategorias,
        CategoriaBisctec,
        CategoriaCabeza,
        CategoriaCarnitas,
        CategoriaLengua,
        CategoriaArrachera
    }
}
</script>
