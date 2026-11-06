<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");

include_once './config/database.php';

$database = new Database();
$db = $database->getConnection();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT id_categoria, nombre, descripcion, tipo_menu FROM categorias";
    $stmt = $db->prepare($query);
    $stmt->execute();
    $categorias = $stmt->fetchAll();

    http_response_code(200);
    echo json_encode($categorias);
} else {
    http_response_code(405);
    echo json_encode(["mensaje" => "Método no permitido."]);
}
?>