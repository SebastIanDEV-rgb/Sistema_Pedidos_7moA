
      // 2. Hacer la petición GET a la API usando fetch()
      fetch('http://localhost/Sistema_Pedidos_7moA-main/API/productos.php')
        .then(response => response.json()) // Convertir la respuesta a JSON
        .then(productos => {
          
          const contenedor = document.getElementById('listaProductos');
          contenedor.innerHTML = ''; // Limpiar el contenido previo

          // 3. Recorrer la lista de productos y agregarlos al HTML
          productos.forEach(prod => {
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
            `

            contenedor.appendChild(div);
          });

        })
        .catch(error => console.error('Error al conectar con la API:', error));

