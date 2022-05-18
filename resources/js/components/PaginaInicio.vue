
<template>
    <div>
        <vue-page-transition name="fade-in-right">
            <router-view></router-view> <!--Es lo que ira cambiando de acuerdo al route -->
        </vue-page-transition>
    </div>
</template>
<script>
import store from './store'
export default {
    store,
}
</script>
