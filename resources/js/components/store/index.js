import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
export default new Vuex.Store({
    state:{ //Donde se va a guardar la informacion, aqui se tiene que agregar la info de cada establecimiento
        pastors:[],
        suaderos:[],
        establecimiento:{}, //Es un objeto
        establecimientos:[],
        categorias:[],
        categoria:'',//La categoria que estara activa al momento del filtrar
        bistecs:[],
        cabezas:[],
        carnitas:[],
        lenguas:[],
        arracheras:[]

    },

    mutations:{
        AGREGAR_PASTORS(state,pastors){
            state.pastors=pastors;
        }, //Acciones que estan pasando, se esta agregando el arreglo de pastor
        AGREGAR_SUADEROS(state,suaderos){
            state.suaderos=suaderos;
        },
        AGREGAR_ESTABLECIMIENTO(state,establecimiento){
            state.establecimiento=establecimiento;
        },
        AGREGAR_IMAGEN(state,establecimiento){
            state.establecimiento.imagenes=establecimiento.imagenes;
        },
        AGREGAR_ESTABLECIMIENTOS(state,establecimientos){
            state.establecimientos=establecimientos
        },
        AGREGAR_CATEGORIAS(state,categorias){
            state.categorias=categorias
        },
        SELECCIONAR_CATEGORIA(state,categoria){
            state.categoria=categoria
        },
        AGREGAR_BISCTECS(state,bistecs){
            state.bistecs=bistecs
        },
        AGREGAR_CABEZAS(state,cabezas){
            state.cabezas=cabezas;
        },
        AGREGAR_CARNITAS(state,carnitas){
            state.carnitas=carnitas;
        },
        AGREGAR_LENGUAS(state,lenguas){
            state.lenguas=lenguas;
        },
        AGREGAR_ARRACHERAS(state,arracheras){
            state.arracheras=arracheras;
        }
    },
    getters:{
        obtenerEstablecimiento:state=>{
            return state.establecimiento
        },
        obtenerImagenes: state=>{
            return state.establecimiento.imagenes
        },
        obtenerEstablecimientos: state=>{
            return state.establecimientos
        },
        obtenerCategorias:state=>{
            return state.categorias
        },
        obtenerCategoria:state=>{
            return state.categoria
        }
    },
});

