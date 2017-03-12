<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/API/Data/DB.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/API/models/Usuario.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/API/models/UsuarioPuntos.php';

class DbUsuario {

    function agregarUsuario($usuario){
        $db = new DB();
        $sql = "INSERT INTO usuario (fkIdRolUsuario,nombre, apellido1, apellido2, correo,usuario,contrasenna) VALUES ("
                .$usuario->idRol.",'"
                .$usuario->nombre."', '"
                .$usuario->apellido1. "', '"
                .$usuario->apellido2. "', '"
                .$usuario->correo. "','"
                .$usuario->usuario. "','"
                .$usuario->contrasenna. "')";
        $id = $db->agregar($sql);
        if ($id >0){
            foreach ($usuario  as $telefono){
                 $sql = "INSERT INTO telefono (fkIdUsuarioTelefono,telefono, estado) VALUES ("
                .$telefono->$id.","
                .$telefono->telefono."', '"
                .$telefono->estado. "')";
                 $db->agregar($sql);
            }
        }
        $usuario->id = $id;
        return $usuario;
    }
    
    function actualizarUsuario($usuario){
        $db = new DB();
        $sql = "UPDATE usuario SET "
                . "fkIdRolUsuario='".$usuario->idRol."', "
                . "nombre='".$usuario->nombre."', "
                . "apellido1='".$usuario->apellido1."', "
                . "apellido2='".$usuario->apellido2."', "
                . "correo='".$usuario->correo."', "
                . "usuario='".$usuario->usuario."', "
                . "contrasenna='".$usuario->contrasenna."'"
                . "WHERE pkIdUsuario=".$usuario->id;
        if($db->actualizar($sql)) {
            foreach ($usuario  as $telefono){
                $sql = "UPDATE telefono SET "
                . "fkIdUsuarioTelefono='".$usuario->id."', "
                . "telefono='".$telefono->telefono."', "
                . "estado='".$telefono->estado."' "
                . "WHERE pkIdTelefono=".$telefono->idTel;
                $db->actualizar($sql);
            }
        } 
        return $usuario;
    }
   
    
    function obtenerUsuario($busqueda, $opcion){
        $sql = "SELECT pkIdUsuario,fkIdRolUsuario,nombre, apellido1,apellido2,correo,usuario,contrasenna FROM usuario ";
        if($opcion == 1){
            $sql+= " WHERE pkIdUsuario=".$busqueda;
         } elseif ($opcion == 2) {
            $sql+= " WHERE usuario=".$busqueda;
        }
        $db = new DB();
        $row = $db->obtenerUno($sql);
        $usuario = $this->parseDataList($row,1);
        return $usuario;
    }
       
    function obtenerTelefono($id){
        $sql = "SELECT pkIdTelefono,fkIdUsuarioTelefono, telefono,estado FROM usuario WHERE fkIdUsuarioTelefono=".$id;
        $db = new DB();
        $row = $db->obtenerUno($sql);
        $usuario = $this->parseDataList($row,2);//parseRowAUsuario($row);
        return $usuario;
    }
    
    
    function listarUsuarios(){
        $sql = "SELECT * FROM usuario";
        $db = new DB();
        $rowList = $db->listar($sql);
        $usuarioList = $this->parseRowAUsuarioList($rowList);
        return $usuarioList;
    }
    
    
    function parseRowTelefono($row) {
        $user = new Usuario();
        if(isset($row['pkIdTelefono'])){
            $user->pkIdTelefono = $row['pkIdTelefono'];
        }
        if(isset($row['fkIdUsuarioTelefono'])){
            $user->fkIdUsuarioTelefono = $row['fkIdUsuarioTelefono'];
        }
        if(isset($row['telefono'])){
            $user->telefono = $row['telefono'];
        }
          if(isset($row['estado'])){
            $user->estado = $row['estado'];
        }
       return $user;
    }
    
   
    
    function parseRowUsuario($row) {
        $user = new Usuario();
        if(isset($row['nombre'])){
            $user->nombre = $row['nombre'];
        }
        if(isset($row['pkIdUsuario'])){
            $user->id = $row['pkIdUsuario'];
        }
        if(isset($row['apellido1'])){
            $user->apellido1 = $row['apellido1'];
        }
          if(isset($row['apellido2'])){
            $user->apellido1 = $row['apellido2'];
        }
        if(isset($row['correo'])){
            $user->correo = $row['correo'];
        }
        if(isset($row['usuario'])){
            $user->usuario = $row['usuario'];
        }
        if(isset($row['fkIdRolUsuario'])){
            $user->tipo = $row['fkIdRolUsuario'];
        }
        if(isset($row['contrasenna'])){
            $user->contrasenna = $row['contrasenna'];
        }
      
        return $user;
    }
    
    
    function parseDataList($rowList, $opcion) {
        $parseDatos = array();
        foreach ($rowList as $row) {
            if ($opcion==1){
                  array_push($parseDatos, $this->parseRowUsuario($row));
             }  else{
                  array_push($parseDatos, $this->parseRowTelefono($row));  
            }
          
        }
        return $parseDatos;
    }
    
    
    
} 
