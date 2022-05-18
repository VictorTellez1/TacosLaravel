<template>
    <div class="container my-5">
        <h2>Bistec</h2>
        <div class="row">
            <div class="col-md-4 mt-4" v-for="bistec in this.bistecs" v-bind:key="bistec.id">
                <div class="card">
                    <img class="card-img-top" :src="`storage/${bistec.imagen_principal}`" alt="card de pastor">
                    <div class="card-body">
                        <h3 class="card-title text-primary font-weight-bold">{{bistec.nombre}}</h3>
                        <p class="card-text">{{bistec.direccion}}</p>
                        <p class="card-text">
                            <span class="font-weight-bold">Horario:</span>
                                {{bistec.apertura}}-{{bistec.cierre}}
                        </p>
                        <router-link :to="{name:'establecimiento',params:{id:bistec.id}}">
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
        axios.get('/api/categorias/bistec') //Consultar todos los tacos tipo pastor con get
            .then(respuesta=>{
                // this.pastors=respuesta.data; //Guardar la respuesta en vue
                this.$store.commit("AGREGAR_BISCTECS",respuesta.data); //Haces un comit al store para agregar los datos, pones la mutacion y la respuesta
            })
    },
    computed:{ //Para acceder a lo que se esta guardando en store
        bistecs(){ //Es el nombre que se le da cuando se va a ir iterando
            return this.$store.state.bistecs;
        }
    }
}
</script>
