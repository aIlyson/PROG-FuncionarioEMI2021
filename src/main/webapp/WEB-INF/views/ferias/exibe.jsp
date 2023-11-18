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
<title>Dados Férias</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5" style="margin-bottom: 16em;">
	<header>
		<h1>Dados de férias</h1>
	</header>

	<!-- Table -->

	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th scope="col" width="30%">Id</th>
			<td class="coluna align-middle">${ferias.id}</td>
		</tr>
		<tr>
			<th scope="col" width="30%">Funcionário</th>
			<td class="coluna align-middle">${ferias.contratos.funcionarios.nome}</td>
		</tr>
		<tr>
			<th scope="col" width="30%">Email</th>
			<td class="coluna align-middle">${ferias.contratos.funcionarios.email}</td>
		</tr>
		<tr>
			<th scope="col" width="30%">Matrícula</th>
			<td class="coluna align-middle">${ferias.contratos.matricula}</td>
		</tr>
		<tr>
			<th>Data Inicial</th>
			<td class="coluna align-middle"><fmt:formatDate
					pattern="dd/MM/yyyy" value="${ferias.dataInicio}"
					var="dataFormatada" /> ${dataFormatada}</td>
		</tr>
		<tr>
			<th>Data de Encerramento</th>
			<td class="coluna align-middle text-danger"><fmt:formatDate
					pattern="dd/MM/yyyy" value="${ferias.dataEncerramento}"
					var="dataFormatada" /> ${dataFormatada}</td>
		</tr>
		<tr>
			<th>Período de férias</th>
			<td class="coluna align-middle"><c:set var="inicioTotal"
					value="${ferias.dataInicio.time}" /> <c:set
					var="encerramentoTotal" value="${ferias.dataEncerramento.time}" />
				<c:set var="totalDias"
					value="${(encerramentoTotal - inicioTotal) / (1000 * 60 * 60 * 24)}" />
				<fmt:formatNumber value="${totalDias}" type="number" pattern="#,##0"
					var="totalDiasFormatado" />
				<p>${totalDiasFormatado}_Dias</p></td>
		</tr>


	</table>

	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/ferias/novo" />" class="btn btn-secondary"><span
			class="fas fa-check"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/ferias/edita?id=${ferias.id}" />"
			class="btn btn-primary"><span class="fas fa-pencil"></span>
			Editar </a>
		<!-- Excluir -->
		<a href="#" class="btn btn-danger" data-toggle="modal"
			data-target="#modal${ferias.id}" data-placement="bottom"
			title="Excluir"><span class="fas fa-trash"></span> Excluir </a>
	</div>
	<!-- Modal -->
	<div id="modal${ferias.id}" class="modal fade" tabindex="-1"
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
					<a href="<c:url value='/ferias/remove?id=${ferias.id}' />"
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