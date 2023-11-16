$(document).ready(function() {
	$('#cnpj').mask('00.000.000/0000-00');

	$('#cnpj').on('keydown', function(e) {
		if (e.which === 13 || e.which === 9) {
			e.preventDefault();

			var cnpj = $('#cnpj').val().replace(/[^0-9]/g, '');

			if (cnpj.length === 14) {
				$('#mensagem-carregando').show();
				$('#mensagem-erro').hide();

				$.ajax({
					url: 'https://www.receitaws.com.br/v1/cnpj/' + cnpj,
					method: 'GET',
					dataType: 'jsonp',
					complete: function(xhr) {
						response = xhr.responseJSON;

						$('#mensagem-carregando').hide();

						if (response.status === 'OK') {
							$('#razao').val(response.nome);
							$('#nome').val(response.fantasia);
							$('#cep').val(response.cep);
							$('#cidade').val(response.municipio);
							$('#estado').val(response.uf);
							$('#email').val(response.email);
							$('#razao, #cep, #estado').prop('disabled', true);
						} else {
							resetFields();
							$('#mensagem-erro').show();
						}
					}
				});
			} else {
				resetFields();
				$('#mensagem-erro').show();
			}
		}
	});

	function resetFields() {
		$('#razao, #nome, #cep, #cidade, #estado, #email').val('').prop('disabled', false);
	}
});