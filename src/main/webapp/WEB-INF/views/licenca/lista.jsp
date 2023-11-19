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

<div class="container mt-5" style="margin-bottom: 7em;">
	<header>
		<h1>Funcionários com licenças</h1>
	</header>

	<table class="table datatable" id="table"
		class="table table-striped table-bordered dt-responsive nowrap"
		style="width: 100%">
		<thead>
			<tr>
				<th class="d-none" scope="col">ID</th>
				<th class="font-semibold uppercase px-6" scope="col">Funcionário</th>
				<th class="font-semibold uppercase px-6" scope="col">Endereço</th>
				<th class="font-semibold uppercase px-6" scope="col" width="20%">Histórico
					de licenças</th>
				<th class="font-semibold uppercase px-6" scope="col">Opções</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="licencaafastamento" items="${licencaafastamento}">
				<tr>
					<td class="coluna d-none align-middle">${licencaafastamento.funcionarios.id}</td>
					<td class="coluna align-middle px-6 py-4">
						<div class="flex items-center space-x-3">
							<div class="inline-flex w-10 h-10">
								<img class='w-10 h-10 object-cover rounded-full'
									alt='User avatar'
									src='https://avatars.dicebear.com/v2/male/e41a2391f99a1417cf11423e8fbe99b4.svg' />
							</div>
							<div>
								<div>
									<p>${licencaafastamento.funcionarios.nome}</p>
									<p class="text-gray-500 text-sm font-semibold tracking-wide">
										${licencaafastamento.funcionarios.email}</p>
								</div>
							</div>
						</div>
					</td>
					<td class="coluna align-middle">
						<div>${licencaafastamento.funcionarios.endereco.cep}</div>
						<div>${licencaafastamento.funcionarios.endereco.cidade}</div>
						<div>${licencaafastamento.funcionarios.endereco.rua}</div>
					</td>
					<td class="coluna align-middle">
						<!-- Histórico --> <a
						href="<c:url value='/licenca/licencasFuncionario?id=${licencaafastamento.funcionarios.id}'/>"
						class="btn btn-primary" data-toggle="tooltip"
						data-bs-placement="bottom" title="Histórico de Licenças"> <i
							class="fas fa-solid fa-circle-info text-white"></i>
					</a>
					</td>
					<td class="coluna align-middle">
						<!-- Exibir --> <a
						href="<c:url value="/licenca/exibe?id=${licencaafastamento.id}"/>"
						class="btn btn-secondary" data-toggle="tooltip"
						data-bs-placement="bottom" title="Exibir"> <i
							class="fas fa-solid fa-eye text-white"></i>
					</a> <!-- Excluir --> <a href="#" class="btn btn-danger"
						data-toggle="modal" data-target="#modal${licencaafastamento.id}"
						data-placement="bottom" title="Excluir"> <i
							class="fas fa-solid fa-trash text-white"></i>
					</a> <!-- Modal -->
						<div id="modal${licencaafastamento.id}" class="modal fade"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Exclusão
											das licenças</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>Deseja realmente excluir as licenças do funcionário?</p>
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