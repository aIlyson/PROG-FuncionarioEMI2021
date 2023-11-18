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
<title>Dados Empresa</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5" style="margin-bottom: 16em;">
	<header>
		<h1>Dados da empresa</h1>
	</header>

	<!-- Table -->

	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th scope="col" width="30%">Id</th>
			<td class="coluna align-middle">${empresa.id}</td>
		</tr>
		<tr>
			<th>CNPJ</th>
			<td class="coluna align-middle">${empresa.cnpj}</td>
		</tr>
		<tr>
			<th>Razão Social</th>
			<td class="coluna align-middle">${empresa.razao}</td>
		</tr>
		<tr>
			<th>Nome</th>
			<td class="coluna align-middle">${empresa.nome}</td>
		</tr>
		<tr>
			<th>CEP</th>
			<td class="coluna align-middle">${empresa.cep}</td>
		</tr>
		<tr>
			<th>Estado</th>
			<td class="coluna align-middle">${empresa.estado}</td>
		</tr>
		<tr>
			<th>Cidade</th>
			<td class="coluna align-middle">${empresa.cidade}</td>
		</tr>
		<tr>
			<th>Email</th>
			<td class="coluna align-middle">${empresa.email}</td>
		</tr>
	</table>
	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/empresa/novo" />" class="btn btn-secondary"><span
			class="fas fa-check"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/empresa/edita?id=${empresa.id}" />"
			class="btn btn-primary"><span class="fas fa-pencil"></span>
			Editar </a>
		<!-- Excluir -->
		<a href="#" class="btn btn-danger" data-toggle="modal"
			data-target="#modal${empresa.id}" data-placement="bottom"
			title="Excluir"> <span class="fas fa-trash"></span> Excluir
		</a>
	</div>
	<!-- Modal -->
	<div id="modal${empresa.id}" class="modal fade" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Exclusão da
						empresa cadastrada</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Deseja realmente excluir essa empresa?</p>
				</div>
				<div class="modal-footer">
					<a href="<c:url value='/empresa/remove?id=${empresa.id}' />"
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