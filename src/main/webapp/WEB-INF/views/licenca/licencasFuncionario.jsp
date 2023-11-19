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
<title>Monitorar Licença</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
</head>

<c:import url="../componentes/cabecalho.jsp" />

<div class="container mt-5" style="margin-bottom: 10em;">
	<header>
		<h2>Licenças de ${funcionario.nome}</h2>
	</header>

	<table class="table datatable" id="table">
		<thead>
			<tr>
				<th class="d-none" scope="col">ID</th>
				<th class="font-semibold uppercase px-6" scope="col">Tipo de
					Licença</th>
				<th class="font-semibold uppercase px-6" scope="col">Data
					Início</th>
				<th class="font-semibold uppercase px-6" scope="col">Data
					Encerramento</th>
				<th class="font-semibold uppercase px-6" scope="col">Período de
					licença</th>
				<th class="font-semibold uppercase px-6" scope="col">Opções</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="licencaafastamento" items="${licencasDoFuncionario}">
				<tr>
					<td class="coluna d-none align-middle">${licencaafastamento.id}</td>
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
					<td class="coluna align-middle"><fmt:formatDate
							pattern="dd/MM/yyyy" value="${licencaafastamento.dataInicio}"
							var="dataFormatada" /> ${dataFormatada}</td>
					<td class="coluna align-middle"><fmt:formatDate
							pattern="dd/MM/yyyy" value="${licencaafastamento.dataFim}"
							var="dataFormatada" /> ${dataFormatada}</td>
					<td class="coluna align-middle"><fmt:formatDate
							pattern="dd/MM/yyyy" value="${licencaafastamento.dataInicio}"
							var="dataInicioFormatada" /> <fmt:formatDate
							pattern="dd/MM/yyyy" value="${licencaafastamento.dataFim}"
							var="dataFimFormatada" /> <c:set var="inicioTotal"
							value="${licencaafastamento.dataInicio.time}" /> <c:set
							var="encerramentoTotal"
							value="${licencaafastamento.dataFim.time}" /> <c:set
							var="totalDias"
							value="${(encerramentoTotal - inicioTotal) / (1000 * 60 * 60 * 24)}" />
						<fmt:formatNumber value="${totalDias}" type="number"
							pattern="#,##0" var="totalDiasFormatado" />
						<p>${totalDiasFormatado}‎‎‎‎‎‎&nbsp;Dias</p></td>
					<td class="coluna align-middle">
						<!-- Editar --> <a
						href="<c:url value='/licenca/edita?id=${licencaafastamento.id}' />"
						class="btn btn-primary" data-toggle="tooltip"
						data-placement="bottom" title="Editar"> Editar </a> <!-- Excluir -->
						<a href="#" class="btn btn-danger" data-toggle="modal"
						data-target="#modal${licencaafastamento.id}" data-placement="bottom"
						title="Excluir"> Excluir </a> <!-- Modal -->
						<div id="modal${licencaafastamento.id}" class="modal fade"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Exclusão
											da licença</h5>
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
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<button onclick="location.href='lista'" class="btn btn-primary">Voltar</button>
</div>

<c:import url="../componentes/footer.jsp" />


<script
	src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<script src="../resources/js/datatables.js"></script>