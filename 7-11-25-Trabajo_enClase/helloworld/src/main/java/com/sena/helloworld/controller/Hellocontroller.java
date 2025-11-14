package com.sena.helloworld.controller;



import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sena.helloworld.controller.dto.PersonaDTO;
import com.sena.helloworld.controller.dto.Response;
import org.springframework.web.bind.annotation.PostMapping;




/*@RestController = Configura */
@RestController
public class Hellocontroller {
    /*
     * GET = Obtener información
     * POST = Crear registro
     * PUT = Actualizar registro completo
     * PATCH = Actualizar registro parcial
     * DELETE = Eliminar registro
     */

    @GetMapping("/hello")
    public String helloWorld() {
        return "Hello, World!";
    }

    @GetMapping("/hello2") /*Mapeo de la ubicación de los controladores*/
    public ResponseEntity<Object> hello2(){
        Response Response = new Response();
        Response.setMessage("Hello world");
        return new ResponseEntity<>(Response,HttpStatus.OK);
    }

    @GetMapping("/saludo/{nombre}")
    public ResponseEntity<Response> saludo(@PathVariable String nombre){
        Response Response = new Response();
        Response.setMessage("hola " + nombre);
        return new ResponseEntity<>(Response,HttpStatus.OK);
    }

    @PostMapping("/saludo2")
    public ResponseEntity<Response> saludo2(@RequestBody PersonaDTO persona){
        Response Response = new Response();
        Response.setMessage("Cordial saludo" +
        "Nombre: " +persona.getNombre()+
        "Apellido: " +persona.getApellido()+
        "Edad: " +persona.getEdad()
        );
        
        return new ResponseEntity<>(Response,HttpStatus.OK);
    }
    
    

    /*
     * status response:
     * 100 - Información
     * 200 - Se ejecutó correctamente la petición
     *  200 OK
     * 300 - Errores de redirección
     * 400 - Errores del cliente
     *  404 NOT FOUND
     * 500 - Errores del servidor
     * 
     * Error capa 8 - Error entre la silla y la pantalla :)
     * Error 300 - Entre la silla y el asiento :)
     */
}