//tradução
$(document).ready(function() {
	$('#table').DataTable({
		language: {
			info: "Exibindo de _START_ a _END_ de um total de _TOTAL_",
			infoEmpty: "Nenhum cargo encontrado",
			infoFiltered: "(filtrado de um total de _MAX_)",
			emptyTable: "Sem tabelas disponíveis",
			search: "Pesquisar:",
			paginate: {
				first: "Primeiro",
				previous: "Anterior",
				next: "Próximo",
				last: "Último"
			},
			aria: {
				sortAscending: ": ativar para classificar a coluna em ordem crescente",
				sortDescending: ": ativar para classificar a coluna em ordem decrescente"
			}
		},
		lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
		pageLength: 10
	});
});
