<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dados Funcionário</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5" style="margin-bottom: 16em;">
	<header>
		<h1>Dados do funcionário</h1>
	</header>

	<!-- Table -->

	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th scope="col" width="30%">Id</th>
			<td class="coluna align-middle">${funcionarios.id}</td>
		</tr>
		<tr>
			<th>Nome</th>
			<td class="coluna align-middle">${funcionarios.nome}</td>
		</tr>
		<tr>
			<th>Nascimento</th>
			<td class="coluna align-middle">${funcionarios.dataNascimento}</td>
		</tr>
		<tr>
			<th>Email</th>
			<td class="coluna align-middle">${funcionarios.email}</td>
		</tr>

		<tr>
			<th>Endereço</th>
			<td class="coluna align-middle">
				<div>${funcionarios.endereco.cep}</div>
				<div>${funcionarios.endereco.cidade}</div>
				<div>${funcionarios.endereco.rua}</div>
			</td>
		</tr>
		<tr>
			<th>Status</th>
			<td class="coluna align-middle">${funcionarios.status}</td>
		</tr>

	</table>

	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/funcionarios/novo" />" class="btn btn-secondary"><span
			class="fas fa-check"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/funcionarios/edita?id=${funcionarios.id}" />"
			class="btn btn-primary"><span class="fas fa-pencil"></span>
			Editar </a>
		<!-- Excluir -->
		<a href="#" class="btn btn-danger" data-toggle="modal"
			data-target="#modal${funcionarios.id}" data-placement="bottom"
			title="Excluir"><span class="fas fa-trash"></span> Excluir </a>
	</div>
	<!-- Modal -->
	<div id="modal${funcionarios.id}" class="modal fade" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Exclusão do
						cargo</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Deseja realmente excluir o funcionário?</p>
				</div>
				<div class="modal-footer">
					<a href="<c:url value='/funcionarios/remove?id=${funcionarios.id}' />"
						class="btn btn-danger">Excluir</a>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>
	<button onclick="location.href='lista'" class="btn btn-primary">Voltar</button>

</div>

<c:import url="../componentes/footer.jsp" />


<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>