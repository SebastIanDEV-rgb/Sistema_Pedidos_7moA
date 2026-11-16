// 1. Detectar en qué página estamos mirando la URL actual
const rutaActual = window.location.pathname;
let filtroMenu = 'todo';

if (rutaActual.includes('hamburguesas.html')) {
    filtroMenu = 'Hamburguesas'; // Tiene que coincidir con el valor de 'tipo_menu' o 'categoria' en tu BD
} else if (rutaActual.includes('pizzas.html')) {
    filtroMenu = 'pizzas'; // Tiene que coincidir con el valor de 'tipo_menu' en tu BD
} else if (rutaActual.includes('junior.html')) {
    filtroMenu = 'junior'; // Tiene que coincidir con el valor de 'tipo_menu' en tu BD
} else if (rutaActual.includes('diabetico.html')) {
    filtroMenu = 'diabetico'; // Tiene que coincidir con el valor de 'tipo_menu' en tu BD
} else if (rutaActual.includes('SINTACC.html')) {
    filtroMenu = 'SINTACC'; // Tiene que coincidir con el valor de 'tipo_menu' en tu BD
} 

// 2. Hacer la petición GET a la API
fetch('http://localhost/Sistema_Pedidos_7moA-main/API/productos.php')
  .then(response => response.json())
  .then(productos => {
    const contenedor = document.getElementById('listaProductos');
    contenedor.innerHTML = '';

    // 3. Filtrar los productos según la página
    const productosFiltrados = productos.filter(prod => {
        if (filtroMenu === 'todo') return true; // En index.html muestra todos
        
        // Compara ignorando mayúsculas/minúsculas (ej: 'Hamburguesas' === 'hamburguesas')
        // Verifica tanto tipo_menu como categoria por las dudas
        const tipo = (prod.tipo_menu || '').toLowerCase();
        const cat = (prod.categoria || '').toLowerCase();
        
        return tipo === filtroMenu.toLowerCase() || cat === filtroMenu.toLowerCase();
    });

    // 4. Recorrer la lista YA FILTRADA y agregarlos al HTML
    productosFiltrados.forEach(prod => {
      const div = document.createElement('div');
      div.innerHTML = `
              <div class="card" style="width: 18rem; float: left; margin-right: 50px; margin-bottom: 50px; height: 250px;">
              <div class="card-body">
                  <h5 class="card-title">${prod.nombre}</h5>
                  <p class="card-text">${prod.descripcion_corta}</p>
                  <b><p>$${prod.precio_actual}</p></b>
                  <a class="btn btn-primary">agregar</a>
              </div>
              </div>
      `;

      contenedor.appendChild(div);
    });

  })
  .catch(error => console.error('Error al conectar con la API:', error));