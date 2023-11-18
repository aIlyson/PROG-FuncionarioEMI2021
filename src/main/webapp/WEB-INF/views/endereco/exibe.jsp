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
<title>Dados Endereço</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5" style="margin-bottom: 16em;">
	<header>
		<h1>Dados do endereço</h1>
	</header>

	<!-- Table -->

	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th scope="col" width="30%">Id</th>
			<td class="coluna align-middle">${endereco.id}</td>
		</tr>
		<tr>
			<th>CEP</th>
			<td class="coluna align-middle">${endereco.cep}</td>
		</tr>
		<tr>
			<th>Estado</th>
			<td class="coluna align-middle">${endereco.estado}</td>
		</tr>
		<tr>
			<th>Cidade</th>
			<td class="coluna align-middle">${endereco.cidade}</td>
		</tr>
		<tr>
			<th>Bairro</th>
			<td class="coluna align-middle">${endereco.bairro}</td>
		</tr>
		<tr>
			<th>Rua</th>
			<td class="coluna align-middle">${endereco.rua}</td>
		</tr>
		<tr>
			<th>Número</th>
			<td class="coluna align-middle">${endereco.numero}</td>
		</tr>

	</table>

	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/endereco/novo" />" class="btn btn-secondary"><span
			class="fas fa-check"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/endereco/edita?id=${endereco.id}" />"
			class="btn btn-primary"><span class="fas fa-pencil"></span>
			Editar </a>
		<!-- Excluir -->
		<a href="#" class="btn btn-danger" data-toggle="modal"
			data-target="#modal${endereco.id}" data-placement="bottom"
			title="Excluir"><span class="fas fa-trash"></span> Excluir </a>
	</div>
	<!-- Modal -->
	<div id="modal${endereco.id}" class="modal fade" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Exclusão do
						endereço</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Deseja realmente excluir esse endereço?</p>
				</div>
				<div class="modal-footer">
					<a href="<c:url value='/endereco/remove?id=${endereco.id}' />"
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