// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('.dt').DataTable({
  		/*scrollY:  '500px',
  		fixedHeader: {
		      "header": true,
		    },
		    "bLengthChange": false,*/
		"language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
	  	/*language: {
		    "decimal": "",
	        "emptyTable": "No hay información",
	        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
	        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
	        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
	        "infoPostFix": "",
	        "thousands": ",",
	        "lengthMenu": "Mostrar _MENU_ Entradas",
	        "loadingRecords": "Cargando...",
	        "processing": "Procesando...",
	        "search": "Buscar:",
	        "zeroRecords": "Sin resultados encontrados",
	        "paginate": {
	            "first": "Primero",
	            "last": "Ultimo",
	            "next": "Siguiente",
	            "previous": "Anterior"
	        },
		    "aria": {
		        "sortAscending":  ": Ordenar ascendente",
		        "sortDescending": ": Ordenar descendente"
		    }
		}*/
	});
});
