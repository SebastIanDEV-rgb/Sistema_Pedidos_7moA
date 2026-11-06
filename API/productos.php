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
        // Si se pasa un ID por parametro: productos.php?id=501
        if (isset($_GET['id'])) {
            $query = "SELECT * FROM productos WHERE id_producto = :id";
            $stmt = $db->prepare($query);
            $stmt->bindParam(":id", $_GET['id']);
            $stmt->execute();
            $resultado = $stmt->fetch();

            if ($resultado) {
                echo json_encode($resultado);
            } else {
                http_response_code(404);
                echo json_encode(["mensaje" => "Producto no encontrado"]);
            }
        } else {
            // Listar todos los productos
            $query = "SELECT p.id_producto, p.nmombre AS nombre, p.descripcion_corta, 
                 p.descripcion_detallada, p.imagen_url, p.precio_actual, 
                 p.cantidad_disponible, c.nombre AS categoria, c.tipo_menu
          FROM productos p
          LEFT JOIN categorias c ON p.id_categoria = c.id_categoria";
            $stmt = $db->prepare($query);
            $stmt->execute();
            $productos = $stmt->fetchAll();
            
            http_response_code(200);
            echo json_encode($productos);
        }
        break;

    case 'POST':
        // Leer el cuerpo en formato JSON
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id_producto) && !empty($data->nmombre) && !empty($data->precio_actual)) {
            $query = "INSERT INTO productos (id_producto, id_categoria, dni_empleado, id_preparan, nmombre, descripcion_corta, descripcion_detallada, imagen_url, precio_actual, pausa, cantidad_disponible)
                      VALUES (:id_producto, :id_categoria, :dni_empleado, :id_preparan, :nmombre, :descripcion_corta, :descripcion_detallada, :imagen_url, :precio_actual, :pausa, :cantidad_disponible)";

            $stmt = $db->prepare($query);

            $stmt->bindParam(":id_producto", $data->id_producto);
            $stmt->bindParam(":id_categoria", $data->id_categoria);
            $stmt->bindParam(":dni_empleado", $data->dni_empleado);
            $stmt->bindParam(":id_preparan", $data->id_preparan);
            $stmt->bindParam(":nmombre", $data->nmombre);
            $stmt->bindParam(":descripcion_corta", $data->descripcion_corta);
            $stmt->bindParam(":descripcion_detallada", $data->descripcion_detallada);
            $stmt->bindParam(":imagen_url", $data->imagen_url);
            $stmt->bindParam(":precio_actual", $data->precio_actual);
            $pausa = isset($data->pausa) ? $data->pausa : 0;
            $stmt->bindParam(":pausa", $pausa);
            $stmt->bindParam(":cantidad_disponible", $data->cantidad_disponible);

            if ($stmt->execute()) {
                http_response_code(201);
                echo json_encode(["mensaje" => "Producto creado con éxito."]);
            } else {
                http_response_code(500);
                echo json_encode(["mensaje" => "No se pudo crear el producto."]);
            }
        } else {
            http_response_code(400);
            echo json_encode(["mensaje" => "Datos incompletos."]);
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(["mensaje" => "Método no permitido."]);
        break;
}
?>