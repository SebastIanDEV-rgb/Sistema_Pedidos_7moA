<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST");

include_once './config/database.php';

$database = new Database();
$db = $database->getConnection();

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        // Consultar por ID específico: clientes.php?id=1
        if (isset($_GET['id'])) {
            $query = "SELECT * FROM clientes WHERE id_cliente = :id";
            $stmt = $db->prepare($query);
            $stmt->bindParam(":id", $_GET['id']);
            $stmt->execute();
            $cliente = $stmt->fetch();

            if ($cliente) {
                echo json_encode($cliente);
            } else {
                http_response_code(404);
                echo json_encode(["mensaje" => "Cliente no encontrado."]);
            }
        } else {
            // Listar todos los clientes
            $query = "SELECT * FROM clientes";
            $stmt = $db->prepare($query);
            $stmt->execute();
            $clientes = $stmt->fetchAll();

            http_response_code(200);
            echo json_encode($clientes);
        }
        break;

    case 'POST':
        // Recibir los datos enviados en el cuerpo JSON
        $data = json_decode(file_get_contents("php://input"));

        // Validar que los datos requeridos no estén vacíos
        if (!empty($data->id_cliente) && !empty($data->nombre) && !empty($data->apellido)) {
            $query = "INSERT INTO clientes (id_cliente, nombre, apellido, telefono, piso_dpto, barrio_zona) 
                      VALUES (:id_cliente, :nombre, :apellido, :telefono, :piso_dpto, :barrio_zona)";

            $stmt = $db->prepare($query);

            $stmt->bindParam(":id_cliente", $data->id_cliente);
            $stmt->bindParam(":nombre", $data->nombre);
            $stmt->bindParam(":apellido", $data->apellido);
            $stmt->bindParam(":telefono", $data->telefono);
            $stmt->bindParam(":piso_dpto", $data->piso_dpto);
            $stmt->bindParam(":barrio_zona", $data->barrio_zona);

            if ($stmt->execute()) {
                http_response_code(201);
                echo json_encode(["mensaje" => "Cliente creado exitosamente."]);
            } else {
                http_response_code(500);
                echo json_encode(["mensaje" => "Error al registrar el cliente."]);
            }
        } else {
            http_response_code(400);
            echo json_encode(["mensaje" => "Faltan datos obligatorios (id_cliente, nombre, apellido)."]);
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(["mensaje" => "Método no permitido."]);
        break;
}
?>