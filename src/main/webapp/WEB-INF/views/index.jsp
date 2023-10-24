<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Início</title>
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>

<body>
	<h1>Cada equipe deve escolher um projeto abaixo:</h1>

	<table>
		<tr onmouseover="activated(this)" onmouseout="disabled(this)">
			<th>ID</th>
			<th>Projeto</th>
		</tr>
		<tr onmouseover="activated(this)" onmouseout="disabled(this)">
			<td>1</td>
			<td>Meu projeto: Atendimento de extraclasse dos alunos do campus</td>
		</tr>
		<tr onmouseover="activated(this)" onmouseout="disabled(this)">
			<td>2</td>
			<td>Gestão do almoxarifado do Campus</td>
		</tr>
		<tr onmouseover="activated(this)" onmouseout="disabled(this)">
			<td>3</td>
			<td>Gestão de Atendimentos do setor saúde e pedagogia do Campus</td>
		</tr>
		<tr onmouseover="activated(this)" onmouseout="disabled(this)">
			<td>4</td>
			<td>Gestão de empréstimo de chaves e equipamentos do SAE</td>
		</tr>
		<tr onmouseover="activated(this)" onmouseout="disabled(this)"
			class="selected">
			<td>5</td>
			<td>Gestão de funcionários de uma empresa (lotação, dados
				pessoais, dados contratuais, histórico de cargos, histórico de
				salários, dependentes, licenças/afastamentos, férias)</td>
		</tr>
		<tr onmouseover="activated(this)" onmouseout="disabled(this)">
			<td>6</td>
			<td>Gestão de reservas de salas do Campus</td>
		</tr>
	</table>

	<p>
		<strong>Tarefa: Realizar a especificação de requisitos e
			fazer o modelo lógico do banco de dados (utilizando o MySQL
			Workbench) para entregar na próxima semana.</strong>
	</p>

	<p>Cada projeto deve ser capaz de fazer login com usuário e senha,
		deve armazenar os dados no banco MySQL, deve gerenciar permissões de
		usuários, deve gerar relatórios (se possível em PDF). Para cada tabela
		do banco de dados, deve ser possível cadastrar, editar, visualizar e
		excluir (CRUD) os dados utilizando a interface Web.</p>

	<script>
		function activated(row) {
			row.style.backgroundColor = "#ffe6e6";
		}

		function disabled(row) {
			row.style.backgroundColor = "";
		}
	</script>

</body>
</html>
