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
<title>Dados Licença Funcinário</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5" style="margin-bottom: 16em;">
	<header>
		<h1>Dados da licença de ${licencaafastamento.funcionarios.nome}</h1>
	</header>

	<!-- Table -->
	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th scope="col" width="30%">Id</th>
			<td class="coluna align-middle">${licencaafastamento.id}</td>
		</tr>
		<tr>
			<th>Nome</th>
			<td class="coluna align-middle">${licencaafastamento.funcionarios.nome}</td>
		</tr>
		<tr>
			<th>Data de Nascimento</th>
			<td class="coluna align-middle"><fmt:formatDate
					pattern="dd/MM/yyyy"
					value="${licencaafastamento.funcionarios.dataNascimento}"
					var="dataFormatada" /> ${dataFormatada}</td>
		</tr>
		<tr>
			<th>Email</th>
			<td class="coluna align-middle">${licencaafastamento.funcionarios.email}</td>
		</tr>
		<tr>
			<th>Endereço</th>
			<td class="coluna align-middle">
				<div>${licencaafastamento.funcionarios.endereco.cep}</div>
				<div>${licencaafastamento.funcionarios.endereco.cidade}</div>
				<div>${licencaafastamento.funcionarios.endereco.rua}</div>
			</td>
		</tr>
		<tr>
			<th>Endereço</th>
			<td class="coluna align-middle">
				<div>${licencaafastamento.funcionarios.endereco.cep}</div>
				<div>${licencaafastamento.funcionarios.endereco.cidade}</div>
				<div>${licencaafastamento.funcionarios.endereco.rua}</div>
			</td>
		</tr>
		<tr>
			<th>Tipo da licença escolhida</th>
			<td class="coluna align-middle"><span
				class="text-white text-sm w-1/3 pb-1 font-semibold px-2 rounded-full"
				style="background-color: 
            ${licencaafastamento.tipoLicenca eq 'Medica' ? '#2484FF' 
            : licencaafastamento.tipoLicenca eq 'Maternidade' ? '#D8bBFD8' 
            : licencaafastamento.tipoLicenca eq 'Paternidade' ? '#000080' 
            : licencaafastamento.tipoLicenca eq 'Casamento' ? '#E2AFBF' 
            : licencaafastamento.tipoLicenca eq 'Arquivado' ? '#800000' 
            : licencaafastamento.tipoLicenca eq 'Militar' ? '#003424' 
            : licencaafastamento.tipoLicenca eq 'Luto' ? '#111111' 
            : ''};">
					${licencaafastamento.tipoLicenca eq 'Medica' ? 'Médica' 	
          : licencaafastamento.tipoLicenca eq 'Maternidade' ? 'Maternidade' 
          : licencaafastamento.tipoLicenca eq 'Paternidade' ? 'Paternidade' 
          : licencaafastamento.tipoLicenca eq 'Casamento' ? 'Casamento' 
          : licencaafastamento.tipoLicenca eq 'Acidente' ? 'Acidente de trabalho' 
          : licencaafastamento.tipoLicenca eq 'Militar' ? 'Militar' 
          : licencaafastamento.tipoLicenca eq 'Luto' ? 'Luto' 
          : ''}
			</span></td>
		</tr>
		<tr>
			<th>Data Inicial</th>
			<td class="coluna align-middle"><fmt:formatDate
					pattern="dd/MM/yyyy" value="${licencaafastamento.dataInicio}"
					var="dataFormatada" /> ${dataFormatada}</td>
		</tr>
		<tr>
			<th>Data de Encerramento</th>
			<td class="coluna align-middle text-danger"><fmt:formatDate
					pattern="dd/MM/yyyy" value="${licencaafastamento.dataFim}"
					var="dataFormatada" /> ${dataFormatada}</td>
		</tr>
		
	</table>

	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/licenca/novo" />" class="btn btn-secondary"><span
			class="fas fa-check"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/licenca/edita?id=${licencaafastamento.id}" />"
			class="btn btn-primary"><span class="fas fa-pencil"></span>
			Editar </a>
		<!-- Excluir -->
		<a href="#" class="btn btn-danger" data-toggle="modal"
			data-target="#modal${licencaafastamento.id}" data-placement="bottom"
			title="Excluir"><span class="fas fa-trash"></span> Excluir </a>
	</div>
	<!-- Modal -->
	<div id="modal${licencaafastamento.id}" class="modal fade"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Exclusão da
						licença</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Deseja realmente excluir a licença
						${licencaafastamento.tipoLicenca}?</p>
				</div>
				<div class="modal-footer">
					<a
						href="<c:url value='/licenca/remove?id=${licencaafastamento.id}' />"
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