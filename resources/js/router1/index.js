import Vue from 'vue';
import VueRouter from 'vue-router';
import VuePageTransition from 'vue-page-transition';
import InicioEstablecimeintos from '../components/InicioEstablecimientos.vue';
import MostrarEstablecimiento from '../components/MostrarEstablecimiento.vue';
const routes=[
    {
        path:'/', //Pagina principal
        component:InicioEstablecimeintos //Componenete que se va a cargar al visitar esa pagina
    },
    {
        path:'/establecimiento/:id', //Otro componente que se va a cargar al entrar a ese direccion
        name:"establecimiento", //Le das un name
        component:MostrarEstablecimiento
    }
    // {
    //     path:'/nosotros',
    //     component:Nosotros Para tener otros componentes
    // },
]
const router =new VueRouter({ //Rutas que va a registrar
    mode:'history', //Quitar el signo de gato en la pagina inicial
    routes
});
Vue.use(VueRouter);
Vue.use(VuePageTransition);
export default router;
