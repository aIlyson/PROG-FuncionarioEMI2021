$(document).ready(function() {
    $('#cep').mask('00000-000');

    $('#cep').blur(function() {
        var cep = $(this).val().replace('-', '');

        if (!cep.trim()) {
            resetFields();
            return;
        }

        $('#mensagem-erro').hide();
        $('#mensagem-carregando').show();

        if (cep.length === 8) {
            $.getJSON('https://viacep.com.br/ws/' + cep + '/json/', function(data) {
                $('#mensagem-carregando').hide();

                if (!data.erro) {
                    $('#estado').val(data.uf).prop('disabled', true);
                    $('#cidade').val(data.localidade).prop('disabled', true);
                    $('#bairro').val(data.bairro); 
                } else {
                    resetFields();
                    $('#mensagem-erro').show();
                }
            });
        } else {
            resetFields();
            $('#mensagem-carregando').hide();
            $('#mensagem-erro').show();
        }
    });

    function resetFields() {
        $('#estado').val('').prop('disabled', false);
        $('#cidade').val('').prop('disabled', false);
        $('#bairro').val('');
        $('#mensagem-erro').hide();
        $('#mensagem-carregando').hide();
    }
});
