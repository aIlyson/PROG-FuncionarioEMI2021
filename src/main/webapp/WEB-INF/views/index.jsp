<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Início</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/typewriter-effect@2.18.0/dist/core.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/index.css" />">

<style>
.background-image {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	background-attachment: fixed;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: -1;
	width: 100%;
	height: 100%;
}

.background {
	background-image: url('<c:url value="/resources/imagens/COMP.jpg" />');
	background-color: rgba(46, 46, 46, 0.5);
	filter: brightness(50%);
}
</style>
</head>

<c:import url="componentes/cabecalho.jsp" />


<section class="hero-section py-3 py-md-5">
	<div class="background-image background"></div>

	<div class="container">
		<div class="row">
			<div class="col-12 col-lg-6 pt-3 mb-5 mb-lg-0">
				<div class="col-12 pt-3 mb-5 mb-lg-0">
					<h1 class="site-headline font-weight-bold mb-3">
						Sistema projetado desenvolvido com Bootstrap 5, Java e Spring
						Framework, com funcionalidades para monitorar e consultar
						informações de <span id="typewriter"
							class="text-primary font-weight-bold"> <span
							class="Typewriter__wrapper"></span> <span
							class="Typewriter__cursor">|</span>
						</span>.
					</h1>
					<p class="mt-4">Cada projeto deve ser capaz de fazer login com
						usuário e senha, deve armazenar os dados no banco MySQL, deve
						gerenciar permissões de usuários, deve gerar relatórios (se
						possível em PDF). Para cada tabela do banco de dados, deve ser
						possível cadastrar, editar, visualizar e excluir (CRUD) os dados
						utilizando a interface Web.</p>
				</div>
			</div>
			<div class="col-12 col-lg-6 text-center">
				<table>
					<tr>
						<th>ID</th>
						<th>Projeto</th>
					</tr>
					<tr>
						<td>1</td>
						<td>Atendimento de extraclasse dos alunos do campus</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Gestão do almoxarifado do Campus</td>
					</tr>
					<tr>
						<td>3</td>
						<td>Gestão de Atendimentos do setor saúde e pedagogia do
							Campus</td>
					</tr>
					<tr>
						<td>4</td>
						<td>Gestão de empréstimo de chaves e equipamentos do SAE</td>
					</tr>
					<tr class="selected">
						<td>5</td>
						<td>Gestão de funcionários de uma empresa (lotação, dados
							pessoais, dados contratuais, histórico de cargos, histórico de
							salários, dependentes, licenças/afastamentos, férias)</td>
					</tr>
					<tr>
						<td>6</td>
						<td>Gestão de reservas de salas do Campus</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>

<script
	src="https://cdn.jsdelivr.net/npm/typewriter-effect@2.18.0/dist/core.js"></script>
<script>
	var typewriterFuncionarios = new Typewriter(document
			.getElementById('typewriter'), {
		loop : true
	});

	typewriterFuncionarios.typeString('Funcionários').pauseFor(2500)
			.deleteAll().typeString('Contratos').pauseFor(2500).deleteAll()
			.typeString('Cargos').pauseFor(2500).start();
</script>

</body>
</html>

<!-- 
   /\_/\
  ( o.o )
   > ^ <
   ~~~~~~~~ Swao
-->
