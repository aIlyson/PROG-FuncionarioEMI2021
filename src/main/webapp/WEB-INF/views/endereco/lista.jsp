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
<title>Listar Endereço</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5" style="margin-bottom: 14em;">
	<header>
		<h1>Listar estados</h1>
	</header>

	<table class="table datatable" id="tabela_id"
		class="table table-striped table-bordered dt-responsive nowrap"
		style="width: 100%">
		<thead>
			<tr>
				<th class="d-none" scope="col">ID</th>
				<th scope="col">Cep</th>
				<th scope="col">Estado</th>
				<th scope="col">Cidade</th>
				<th scope="col">Bairro</th>
				<th scope="col">Rua</th>
				<th scope="col">Número</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="endereco" items="${endereco}">
				<tr>
					<td class="coluna d-none align-middle">${endereco.id}</td>
					<td class="coluna align-middle">${endereco.cep}</td>
					<td class="coluna align-middle">${endereco.estado}</td>
					<td class="coluna align-middle">${endereco.cidade}</td>
					<td class="coluna align-middle">${endereco.bairro}</td>
					<td class="coluna align-middle">${endereco.rua}</td>
					<td class="coluna align-middle">${endereco.numero}&deg;</td>
					<td>
						<!-- Exibir --> <a
						href="<c:url value="/endereco/exibe?id=${endereco.id}"/>"
						class="btn btn-secondary" data-toggle="tooltip"
						data-bs-placement="bottom" title="Exibir"> <i
							class="fas fa-pencil-alt text-white"></i>
					</a> <!-- Editar --> <a
						href="<c:url value='/endereco/edita?id=${endereco.id}' />"
						class="btn btn-primary" data-toggle="tooltip"
						data-placement="bottom" title="Editar"> Editar </a> <!-- Excluir -->
						<a href="#" class="btn btn-danger" data-toggle="modal"
						data-target="#modal${endereco.id}" data-placement="bottom"
						title="Excluir"> Excluir </a> <!-- Modal -->
						<div id="modal${endereco.id}" class="modal fade" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Exclusão
											do endereço</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>Deseja realmente excluir o endereço?</p>
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