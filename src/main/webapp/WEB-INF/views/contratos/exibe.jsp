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
<title>Dados Contratuais</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5" style="margin-bottom: 16em;">
	<header>
		<h1>Dados contratuais</h1>
	</header>

	<!-- Table -->

	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th scope="col" width="30%">Id</th>
			<td class="coluna align-middle">${contratos.id}</td>
		</tr>
		<tr>
			<th>Empresa</th>
			<td class="coluna align-middle">${contratos.empresa.nome}</td>
		</tr>
		<tr>
			<th>Funcionário</th>
			<td class="coluna align-middle">${contratos.funcionarios.nome}</td>
		</tr>
		<tr>
			<th>Funcionário</th>
			<td class="coluna align-middle">${contratos.cargo.nome}</td>
		</tr>
		<tr>
			<th>Salário</th>
			<td class="coluna align-middle"><fmt:formatNumber
					value="${contratos.cargo.salario}" type="currency"
					currencyCode="BRL" currencySymbol="R$ " /></td>
		</tr>
		<tr>
			<th>Matrícula</th>
			<td class="coluna align-middle">${contratos.matricula}</td>
		</tr>
		<tr>
			<th>Data Inicial</th>
			<td class="coluna align-middle"><fmt:formatDate
					pattern="dd/MM/yyyy" value="${contratos.dataInicio}"
					var="dataFormatada" /> ${dataFormatada}</td>
		</tr>
		<tr>
			<th>Data de Encerramento</th>
			<td class="coluna align-middle text-danger"><fmt:formatDate
					pattern="dd/MM/yyyy" value="${contratos.dataEncerramento}"
					var="dataFormatada" /> ${dataFormatada}</td>
		</tr>
		<tr>
			<th>Status</th>
			<td class="coluna align-middle">${contratos.status}</td>
		</tr>
		
	</table>

	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/contratos/novo" />" class="btn btn-secondary"><span
			class="fas fa-check"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/contratos/edita?id=${contratos.id}" />"
			class="btn btn-primary"><span class="fas fa-pencil"></span>
			Editar </a>
		<!-- Excluir -->
		<a href="#" class="btn btn-danger" data-toggle="modal"
			data-target="#modal${contratos.id}" data-placement="bottom"
			title="Excluir"><span class="fas fa-trash"></span> Excluir </a>
	</div>
	<!-- Modal -->
	<div id="modal${contratos.id}" class="modal fade" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Exclusão do
						contrato</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<p>Deseja realmente encerrar esse contrato?</p>
					<img
						src="https://img.freepik.com/vetores-premium/logotipo-bonito-do-animal-do-cao-triste_828181-5.jpg"
						alt="Dog Sad" class="img-fluid"
						style="max-width: 50%; display: block; margin: 0 auto;">
				</div>
				<div class="modal-footer">
					<a href="<c:url value='/contratos/remove?id=${contratos.id}' />"
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