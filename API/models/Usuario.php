<?php

class Usuario {
    public $id = 1;
    public $nombre = '';
    public $apellido1 = '';
    public $apellido2 = '';
    public $correo = '';
    public $usuario = '';
    public $contrasenna = '';
    public $fkIdRolUsuario = '';

    
    public $telefono;
    public $estadoTel;
    public $idTelefono;
    public $fkIdUsuario;
            
    function toJson() {
        $data = array(
        'usuario' => array(
            'nombre' => $this->nombre,
            'id'=>$this->id,
            'apellido1'=> $this->apellido1,
            'apellido2'=> $this->apellido2,
            'correo'=> $this->correo,
            'usuario'=> $this->usuario,
            '$fkIdRolUsuario'=> $this->$fkIdRolUsuario,
            'contrasenna'=> $this->contrasenna
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
