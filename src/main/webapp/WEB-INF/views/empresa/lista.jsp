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
<title>Listar Empresa</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5" style="margin-bottom: 14em;">
	<header>
		<h1>Listar Empresas</h1>
	</header>

	<table class="table datatable" id="table"
		class="table table-striped table-bordered dt-responsive nowrap"
		style="width: 100%">
		<thead>
			<tr>
				<th class="d-none" scope="col">ID</th>
				<th class="font-semibold uppercase px-6" scope="col">CNPJ</th>
				<th class="font-semibold uppercase px-6" scope="col">Razão
					Social</th>
				<th class="font-semibold uppercase px-6" scope="col">Nome</th>
				<th class="font-semibold uppercase px-6" scope="col">CEP</th>
				<th class="font-semibold uppercase px-6" scope="col">UF</th>
				<th class="font-semibold uppercase px-6" scope="col">Cidade</th>
				<th class="font-semibold uppercase px-6" scope="col">Email</th>
				<th class="font-semibold uppercase px-6" scope="col">Opções</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="empresa" items="${empresa}">
				<tr>
					<td class="coluna d-none align-middle">${empresa.id}</td>
					<td class="coluna align-middle">${empresa.cnpj}</td>
					<td class="coluna align-middle">${empresa.razao}</td>
					<td class="coluna align-middle">${empresa.nome}</td>
					<td class="coluna align-middle">${empresa.cep}</td>
					<td class="coluna align-middle">${empresa.estado}</td>
					<td class="coluna align-middle">${empresa.cidade}</td>
					<td class="coluna align-middle">${empresa.email}</td>
					<td class="coluna align-middle">
						<div class="d-flex justify-content-center">
							<!-- Exibir -->
							<a href="<c:url value="/empresa/exibe?id=${empresa.id}"/>"
								class="btn btn-secondary" data-toggle="tooltip"
								data-bs-placement="bottom" title="Exibir"> <i
								class="fas fa-solid fa-eye text-white"></i>
							</a>
							<!-- Editar -->
							<a href="<c:url value='/empresa/edita?id=${empresa.id}' />"
								class="btn btn-primary" data-toggle="tooltip"
								data-placement="bottom" title="Editar"> <i
								class="fas fa-solid fa-pencil text-white"></i>
							</a>
							<!-- Excluir -->
							<a href="#" class="btn btn-danger" data-toggle="modal"
								data-target="#modal${empresa.id}" data-placement="bottom"
								title="Excluir"> <i class="fas fa-solid fa-trash text-white"></i>
							</a>
							<!-- Modal -->
							<div id="modal${empresa.id}" class="modal fade" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Exclusão
												da empresa cadastrada</h5>
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
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<script src="../resources/js/datatables.js"></script>