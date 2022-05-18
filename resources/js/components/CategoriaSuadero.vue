<template>
    <div class="container my-5">
        <h2>Suadero</h2>
        <div class="row">
            <div class="col-md-4 mt-4" v-for="suadero in this.suaderos" v-bind:key="suadero.id">
                <div class="card">
                    <img class="card-img-top" :src="`storage/${suadero.imagen_principal}`" alt="card de pastor">
                    <div class="card-body">
                        <h3 class="card-title text-primary font-weight-bold">{{suadero.nombre}}</h3>
                        <p class="card-text">{{suadero.direccion}}</p>
                        <p class="card-text">
                            <span class="font-weight-bold">Horario:</span>
                                {{suadero.apertura}}-{{suadero.cierre}}
                        </p>
                        <router-link :to="{name:'establecimiento',params:{id:suadero.id}}">
                            <a class="btn btn-primary d-block">Ver Lugar</a>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    // data:function(){ //Para guardar la respuesta y no perder la referencia del $this
    //     return{
    //         suaderos:[] //Guardar la respuesta
    //     }
    // },
    mounted(){
        axios.get('/api/categorias/suadero') //Consultar todos los tacos tipo pastor con get, es con axios
            .then(respuesta=>{
                // this.suaderos=respuesta.data; //Guardar la respuesta en vue
                this.$store.commit("AGREGAR_SUADEROS",respuesta.data)
            })
    },
    computed:{
        suaderos(){
            return this.$store.state.suaderos;
        }

    }
}
</script>
