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
<title>Monitorar Contrato</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
</head>

<c:import url="../componentes/cabecalho.jsp" />

<div class="container mt-5" style="margin-bottom: 7em;">
	<header>
		<h1>Monitorar contratos</h1>
	</header>

	<table class="table datatable" id="table"
		class="table table-striped table-bordered dt-responsive nowrap"
		style="width: 100%">
		<thead>
			<tr>
				<th class="d-none" scope="col">ID</th>
				<th class="font-semibold uppercase px-6" scope="col">Funcionario</th>
				<th class="font-semibold uppercase px-6" scope="col">Empresa</th>
				<th class="font-semibold uppercase px-6" scope="col">Cargo</th>
				<th class="font-semibold uppercase px-6" scope="col">Matrícula</th>
				<th class="font-semibold uppercase px-6" scope="col">D. Inicial</th>
				<th class="font-semibold uppercase px-6" scope="col">D.
					Encerramento</th>
				<th class="font-semibold uppercase px-6" scope="col">Status</th>
				<th class="font-semibold uppercase px-6" scope="col">Opções</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="contratos" items="${contratos}">
				<tr>
					<td class="coluna d-none align-middle">${contratos.id}</td>
					<td class="coluna align-middle px-6 py-4">
						<div class="flex items-center space-x-3">
							<div class="inline-flex w-10 h-10">
								<img class='w-10 h-10 object-cover rounded-full'
									alt='User avatar'
									src='https://avatars.dicebear.com/v2/male/e41a2391f99a1417cf11423e8fbe99b4.svg' />
							</div>
							<div>
								<div>
									<p>${contratos.funcionarios.nome}</p>
									<p class="text-gray-500 text-sm font-semibold tracking-wide">
										${contratos.funcionarios.email}</p>
								</div>
							</div>
						</div>
					</td>
					<td class="coluna align-middle"
						<c:if test="${contratos.status eq 'Arquivado' || contratos.status eq 'Inativo' || contratos.status eq 'Rescindido'}">
                style="text-decoration: line-through;" title="Esse contrato está suspenso"
            </c:if>>${contratos.empresa.nome}</td>
					<td class="coluna align-middle">
						<div>${contratos.cargo.nome}</div>
						<div>
							<fmt:formatNumber value="${contratos.cargo.salario}"
								type="currency" currencyCode="BRL" currencySymbol="R$ " />
						</div>
					</td>
					<td class="coluna align-middle"
						<c:if test="${contratos.status eq 'Arquivado' || contratos.status eq 'Inativo' || contratos.status eq 'Rescindido'}">
                style="text-decoration: line-through;" title="Esse matrícula está suspensa"
            </c:if>>${contratos.matricula}</td>
					<td class="coluna align-middle"><fmt:formatDate
							pattern="dd/MM/yyyy" value="${contratos.dataInicio}"
							var="dataFormatada" /> ${dataFormatada}</td>
					<td class="coluna align-middle text-danger"><fmt:formatDate
							pattern="dd/MM/yyyy" value="${contratos.dataEncerramento}"
							var="dataFormatada" /> ${dataFormatada}</td>
					<td class="coluna align-middle"><span
						class="text-white text-sm w-1/3 pb-1 font-semibold px-2 rounded-full"
						style="background-color: 
            ${contratos.status eq 'Ativo' ? '#00cc66' 
            : contratos.status eq 'Inativo' ? '#ff6666' 
            : contratos.status eq 'Vencido' ? '#8B4513' 
            : contratos.status eq 'Arquivado' ? '#FFCA2C' 
            : contratos.status eq 'Rescindido' ? '#111111' 
            : contratos.status eq 'Renovado' ? '#36621B' 
            : ''};">
							${contratos.status eq 'Ativo' ? 'Ativo' 
          : contratos.status eq 'Inativo' ? 'Inativo' 
          : contratos.status eq 'Vencido' ? 'Vencido' 
          : contratos.status eq 'Arquivado' ? 'Arquivado' 
          : contratos.status eq 'Rescindido' ? 'Rescindido' 
          : contratos.status eq 'Renovado' ? 'Renovado' 
          : ''}
					</span></td>

					<td class="coluna align-middle">
						<div class="d-flex justify-content-center">
							<!-- Exibir -->
							<a href="<c:url value="/contratos/exibe?id=${contratos.id}"/>"
								class="btn btn-secondary" data-toggle="tooltip"
								data-bs-placement="bottom" title="Exibir"> <i
								class="fas fa-solid fa-eye text-white"></i>
							</a>

							<!-- Editar -->
							<a href="<c:url value='/contratos/edita?id=${contratos.id}' />"
								class="btn btn-primary" data-toggle="tooltip"
								data-placement="bottom" title="Editar"> <i
								class="fas fa-solid fa-pencil text-white"></i>
							</a>

							<!-- Excluir -->
							<a href="#" class="btn btn-danger" data-toggle="modal"
								data-target="#modal${contratos.id}" data-placement="bottom"
								title="Excluir"> <i class="fas fa-solid fa-trash text-white"></i>
							</a>

							<!-- Modal -->
							<div id="modal${contratos.id}" class="modal fade" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Exclusão
												do contrato</h5>
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
											<a
												href="<c:url value='/contratos/remove?id=${contratos.id}' />"
												class="btn btn-danger">Excluir</a>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Fechar</button>
										</div>
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