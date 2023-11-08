	$(document).ready(
			function() {
				$('#cep').mask('00000-000');

				$('#cep').blur(
						function() {
							var cep = $(this).val().replace('-', '');

							if (!cep.trim()) {
								$('#mensagem-erro').hide();
								$('#mensagem-carregando').hide();
								$('#estado').val('').prop('readonly', false);
								$('#cidade').val('').prop('readonly', false);
								return;
							}

							$('#mensagem-erro').hide();
							$('#mensagem-carregando').show();

							if (cep.length === 8) {
								$.getJSON('https://viacep.com.br/ws/' + cep
										+ '/json/', function(data) {
									$('#mensagem-carregando').hide();

									if (!data.erro) {
										$('#estado').val(data.uf).prop(
												'readonly', true);
										$('#cidade').val(data.localidade).prop(
												'readonly', true);
									} else {

										$('#mensagem-erro').show();
									}
								});
							}
						});
			});