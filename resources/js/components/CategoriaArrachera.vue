<template>
    <div class="container my-5">
        <h2>Arrachera</h2>
        <div class="row">
            <div class="col-md-4 mt-4" v-for="arrachera in this.arracheras" v-bind:key="arrachera.id">
                <div class="card">
                    <img class="card-img-top" :src="`storage/${arrachera.imagen_principal}`" alt="card de pastor">
                    <div class="card-body">
                        <h3 class="card-title text-primary font-weight-bold">{{arrachera.nombre}}</h3>
                        <p class="card-text">{{arrachera.direccion}}</p>
                        <p class="card-text">
                            <span class="font-weight-bold">Horario:</span>
                                {{arrachera.apertura}}-{{arrachera.cierre}}
                        </p>
                        <router-link :to="{name:'establecimiento',params:{id:arrachera.id}}">
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
    //     Se cambia todo al store    pastors:[] //Guardar la respuesta
    //     }
    // },
    mounted(){
        axios.get('/api/categorias/arrachera') //Consultar todos los tacos tipo pastor con get
            .then(respuesta=>{
                // this.pastors=respuesta.data; //Guardar la respuesta en vue
                this.$store.commit("AGREGAR_ARRACHERAS",respuesta.data); //Haces un comit al store para agregar los datos, pones la mutacion y la respuesta
            })
    },
    computed:{ //Para acceder a lo que se esta guardando en store
        arracheras(){ //Es el nombre que se le da cuando se va a ir iterando
            return this.$store.state.arracheras;
        }
    }
}
</script>
