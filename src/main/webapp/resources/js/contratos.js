	document.getElementById('gerador').addEventListener(
		'click',
		function() {
			var matricula = Math.floor(Math.random() * 1000000000)
				.toString().padStart(9, '0')
				+ '-' + Math.floor(Math.random() * 10);
			document.getElementById('matricula').value = matricula;
		});

	$(document).ready(function() {
		$('#matricula').mask('999999999-9');
	});

	function arquivarContrato() {
		document.getElementById('status').value = 'Arquivado';
		document.forms[0].submit();
	}

	function verificarRenovacao() {
		var dataEncerramento = document.getElementById('dataEncerramento').value;
		var statusElement = document.getElementById('status');

		if (dataEncerramento != '${contratos.dataEncerramento}') {
			statusElement.value = 'Renovado';
		}
	}
