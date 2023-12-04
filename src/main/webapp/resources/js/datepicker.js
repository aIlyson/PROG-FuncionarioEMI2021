	document.addEventListener('DOMContentLoaded', function() {
		function getDataAtual() {
			const hoje = new Date();
			const dataFormatada = new Intl.DateTimeFormat('pt-BR').format(hoje);
			return dataFormatada.replace(/(\d{2})\/(\d{2})\/(\d{4})/, '$1/$2/$3');
		}

		function setDataEncerramento() {
			const dataInicio = document.getElementById('dataInicio').value.trim();
			document.getElementById('dataEncerramento').value = dataInicio || '';
		}

		const picker = document.getElementById('picker');
		const dataInicioInput = document.getElementById('dataInicio');

		picker.addEventListener('click', function() {
			dataInicioInput.value = getDataAtual();
			setDataEncerramento();
		});

		dataInicioInput.addEventListener('input', setDataEncerramento);
	});