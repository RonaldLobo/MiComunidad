<?php

class Telefono {
    
    
    public $telefono;
    public $estadoTel;
    public $idTelefono;
            
    
   
    function toJson() {
        $data = array(
        'telefono' => array(
            'nombre' => $this->nombre,
            'id'=>$this->id,
            'apellido'=> $this->apellido1,
            'correo'=> $this->correo,
            'usuario'=> $this->usuario,
            'tipo'=> $this->tipo,
            'contrasenna'=> $this->contrasenna,
            'rol'=> $this->rol
            )
        );
        return json_encode($data);
    }
    
    
    function parseDto($user) {
        if(isset($user->nombre)){
            $this->nombre = $user->nombre;
        }
        if(isset($user->id)){
            $this->id = $user->id;
        }
        if(isset($user->apellido1)){
            $this->apellido1 = $user->apellido1;
        }
        if(isset($user->correo)){
            $this->correo = $user->correo;
        }
        if(isset($user->usuario)){
            $this->usuario = $user->usuario;
        }
        if(isset($user->tipo)){
            $this->tipo = $user->tipo;
        }
        if(isset($user->contrasenna)){
            $this->contrasenna = $user->contrasenna;
        }
        if(isset($user->rol)){
            $this->rol = $user->rol;
        }
    }
    
    
}
    
