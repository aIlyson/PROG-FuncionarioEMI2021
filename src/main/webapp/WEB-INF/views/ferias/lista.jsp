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
<title>Monitorar Férias</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
</head>

<c:import url="../componentes/cabecalho.jsp" />

<div class="container mt-5" style="margin-bottom: 7em;">
	<header>
		<h1>Monitorar Férias</h1>
	</header>

	<table class="table datatable" id="table"
		class="table table-striped table-bordered dt-responsive nowrap"
		style="width: 100%">
		<thead>
			<tr>
				<th class="d-none" scope="col">ID</th>
				<th class="font-semibold uppercase px-6" scope="col">Funcionário</th>
				<th class="font-semibold uppercase px-6" scope="col">Matrícula</th>
				<th class="font-semibold uppercase px-6" scope="col">D. Inicial</th>
				<th class="font-semibold uppercase px-6" scope="col">D.
					Encerramento</th>
				<th class="font-semibold uppercase px-6" scope="col">Período de
					Férias</th>
				<th class="font-semibold uppercase px-6" scope="col">Opções</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ferias" items="${ferias}">
				<tr>
					<td class="coluna d-none align-middle">${ferias.id}</td>
					<td class="coluna align-middle px-6 py-4">
						<div class="flex items-center space-x-3">
							<div class="inline-flex w-10 h-10">
								<img class='w-10 h-10 object-cover rounded-full'
									alt='User avatar'
									src='https://avatars.dicebear.com/v2/male/e41a2391f99a1417cf11423e8fbe99b4.svg' />
							</div>
							<div>
								<div>
									<p>${ferias.contratos.funcionarios.nome}</p>
									<p class="text-gray-500 text-sm font-semibold tracking-wide">
										${ferias.contratos.funcionarios.email}</p>
								</div>
							</div>
						</div>
					</td>
					<td class="coluna align-middle">${ferias.contratos.matricula}</td>
					<td class="coluna align-middle"><fmt:formatDate
							pattern="dd/MM/yyyy" value="${ferias.dataInicio}"
							var="dataFormatada" /> ${dataFormatada}</td>
					<td class="coluna align-middle text-danger"><fmt:formatDate
							pattern="dd/MM/yyyy" value="${ferias.dataEncerramento}"
							var="dataFormatada" /> ${dataFormatada}</td>
					<td class="coluna align-middle"><fmt:formatDate
							pattern="dd/MM/yyyy" value="${ferias.dataInicio}"
							var="dataInicioFormatada" /> <fmt:formatDate
							pattern="dd/MM/yyyy" value="${ferias.dataEncerramento}"
							var="dataEncerramentoFormatada" /> <c:set var="inicioTotal"
							value="${ferias.dataInicio.time}" /> <c:set
							var="encerramentoTotal" value="${ferias.dataEncerramento.time}" />
						<c:set var="totalDias"
							value="${(encerramentoTotal - inicioTotal) / (1000 * 60 * 60 * 24)}" />
						<fmt:formatNumber value="${totalDias}" type="number"
							pattern="#,##0" var="totalDiasFormatado" />
						<p>${totalDiasFormatado}‎‎‎_Dias</p></td>
					<td class="coluna align-middle">
						<!-- Exibir --> <a
						href="<c:url value="/ferias/exibe?id=${ferias.id}"/>"
						class="btn btn-secondary" data-toggle="tooltip"
						data-bs-placement="bottom" title="Exibir"> <i
							class="fas fa-solid fa-eye text-white"></i>
					</a> <!-- Editar --> <a
						href="<c:url value='/ferias/edita?id=${ferias.id}' />"
						class="btn btn-primary" data-toggle="tooltip"
						data-placement="bottom" title="Editar"> Editar </a> <!-- Excluir -->
						<a href="#" class="btn btn-danger" data-toggle="modal"
						data-target="#modal${ferias.id}" data-placement="bottom"
						title="Excluir"> Excluir </a> <!-- Modal -->
						<div id="modal${ferias.id}" class="modal fade" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Exclusão
											da férias</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>Deseja realmente excluir essa data de férias?</p>
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
					</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<button onclick="location.href='novo'" class="btn btn-primary">Voltar</button>
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