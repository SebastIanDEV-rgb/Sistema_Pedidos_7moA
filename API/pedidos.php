<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");

include_once './config/database.php';

$database = new Database();
$db = $database->getConnection();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT p.id_pedido, p.estado, p.modalidad, p.fecha_hora_ingreso, p.total,
                     e.nombre AS empleado_nombre, r.direccion_calle_numero, c.nombre AS cliente_nombre
              FROM pedidos p
              LEFT JOIN empleado e ON p.dni_empleado = e.dni_empleado
              LEFT JOIN realiza r ON p.id_pedido = r.id_pedido
              LEFT JOIN clientes c ON r.id_cliente = c.id_cliente";

    $stmt = $db->prepare($query);
    $stmt->execute();
    $pedidos = $stmt->fetchAll();

    http_response_code(200);
    echo json_encode($pedidos);
} else {
    http_response_code(405);
    echo json_encode(["mensaje" => "Método no permitido."]);
}
?>