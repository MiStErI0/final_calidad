/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function soloLetras(e,contenido,cantidad)
{
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = "8-37-39-46";

    tecla_especial = false;
    for (var i in especiales) {
        if (key === especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if(contenido.length>cantidad)
    {
        return false;
    }

    if (letras.indexOf(tecla) === -1 && !tecla_especial) {
        alert("solo se aceptan letras  ");
        
        return false;
    }
   
}

function soloNumeros(e,contenido,cantidad)
{
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    numero = "123456789";
    especiales = "8";

    tecla_especial = false;
    for (var i in especiales) {
        if (key === especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if(contenido.length>cantidad)
    {
        return false;
    }
    
    if (numero.indexOf(tecla) === -1 && !tecla_especial) {
        alert("solo se aceptan numeros  ");
        
        return false;
    }
}

function letrasynumeros(e,contenido,cantidad)
{
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    numero = "áéíóúabcdefghijklmnñopqrstuvwxyz123456789";
    especiales = "8";

    tecla_especial = false;
    for (var i in especiales) {
        if (key === especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if(contenido.length>cantidad)
    {
        return false;
    }
    
    if (numero.indexOf(tecla) === -1 && !tecla_especial) {
        alert("solo se aceptan numeros");
        return false;
    }
}