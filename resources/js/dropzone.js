
document.addEventListener('DOMContentLoaded',()=>{
    if(document.querySelector('#dropzone'))
    {
        Dropzone.autoDiscover=false;
        const dropzone=new Dropzone('div#dropzone',{
        url:'/imagenes/store', //Donde se van a guardar las imagenes endpoint
        dictDefaultMessage:'Sube hasta 10 imagenes', //Traducir el mensaje por default
        maxFiles:10, //Numero maximo de files
        require:true, //Si es requerido
        acceptedFiles:".png,.jpg,.gif,.bmp,.jpeg", //Formatos validos a subir
        addRemoveLinks:true,
        dictRemoveFile:"Eliminar Imagen",
        headers:{
            "X-CSRF-TOKEN":document.querySelector('meta[name=csrf-token]').content //Pasar el csrf para validacion
        },
        init:function(){
            const galeria=document.querySelectorAll('.galeria');
            if(galeria.length>0){
                galeria.forEach(imagen=>{
                    const imagenPublicada={};
                    imagenPublicada.size=1;
                    imagenPublicada.name=imagen.value;
                    imagenPublicada.nombreServidor=imagen.value;
                    this.options.addedfile.call(this,imagenPublicada);
                    this.options.thumbnail.call(this,imagenPublicada,`/storage/${imagenPublicada.name}`);
                    imagenPublicada.previewElement.classList.add('dz-success')
                    imagenPublicada.previewElement.classList.add('dz-complete')

                })
            }
        },
        success:function(file,respuesta)
        {

            console.log(respuesta); //Repuesta del servidor
            file.nombreServidor=respuesta.archivo; //Identificar la imagen que se va a elimianr
        },
        sending:function(file,xhr,formData)
        {
            formData.append('uuid',document.querySelector('#uuid').value); //Se envia el uuid

        },
        removedfile:function(file,respuesta)
        {
            console.log(file); //Saber que archivo se esta borrando
            const params={
                imagen:file.nombreServidor,
                uuid:document.querySelector('#uuid').value
            }
            axios.post('/imagenes/destroy',params)
                .then(respuesta=>{
                    console.log(respuesta);
                    //Eliminar del doom
                    file.previewElement.parentNode.removeChild(file.previewElement)
                })
        }
    })
    }
})
