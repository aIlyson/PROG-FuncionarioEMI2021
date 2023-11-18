$(document).ready(function() {
	$('#dataInicio, #dataEncerramento').mask('99/99/9999', {
		placeholder: 'DD/MM/YYYY'
	});
});

function validarDatas() {
	var dataInicio = $('#dataInicio').val();
	var dataEncerramento = $('#dataEncerramento').val();

	if (!isValidDate(dataInicio) || !isValidDate(dataEncerramento)) {
		alert('Por favor, insira datas válidas no formato DD/MM/YYYY.');
		return false;
	}

	var dateInicio = new Date(dataInicio.split('/').reverse().join('-'));
	var dateEncerramento = new Date(dataEncerramento.split('/').reverse().join('-'));

	if (dateEncerramento < dateInicio) {
		alert('A data de encerramento não pode ser menor que a data de início.');
		return false;
	}

	return true;
}

function isValidDate(dateString) {
	var regex = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/;
	return regex.test(dateString);
}
$(document).ready(function() {
	$('#dataNascimento').mask('99/99/9999', {
		placeholder: 'DD/MM/YYYY'
	});
});

function validarDataNascimento() {
	var dataNascimento = $('#dataNascimento').val();

	if (!isValidDate(dataNascimento)) {
		alert('Por favor, insira uma data de nascimento válida no formato DD/MM/YYYY.');
		return false;
	}

	return true;
}

function isValidDate(dateString) {
	var regex = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/;
	return regex.test(dateString);
}