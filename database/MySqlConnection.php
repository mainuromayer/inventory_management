<?php

class MySqlConnection{
    
    public function connect(){
        @$conn = new mysqli('localhost','root','','inventory_management');
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
          }
        return $conn;
    }
}