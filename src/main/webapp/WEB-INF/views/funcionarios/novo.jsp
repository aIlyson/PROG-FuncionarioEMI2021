<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adicionar Funcionário</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5 position-relative"
	style="margin-bottom: 6em;">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="form bg-white p-4 shadow">
				<div class="row">
					<div class="col-md-9">
						<form action="adiciona" method="POST">
							<div class="mt-4 mb-4">
								<h1>Adicionar Funcionário</h1>
								<p>Cadastrar aqui novos funcionários.</p>
							</div>


							<div class="form-group">
								<label for="nome">Nome:<span class="text-danger">*</span></label>
								<input type="text" id="nome" name="nome" maxlength="150"
									pattern="[A-Za-z\s]+"
									title="Digite seu nome,  por favor, coloque sem acentuação"
									required class="form-control">
							</div>

							<div class="form-group">
								<label for="dataNascimento" class="d-block mt-3">Data de
									Nascimento:<span class="text-danger">*</span>
								</label> <input type="text" id="dataNascimento" name="dataNascimento"
									pattern="\d{1,2}/\d{1,2}/\d{4}"
									title="Formato inválido. Use dd/MM/yyyy" required
									class="form-control">
							</div>
							
							<div class="form-group">
								<label for="endereco.id">Endereço:<span
									class="text-danger">*</span></label>
								<div class="mb-3">
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#enderecoModal">Selecionar
										Endereço</button>
								</div>

								<!-- Modal -->
								<div class="modal fade" id="enderecoModal" tabindex="-1"
									role="dialog" aria-labelledby="enderecoModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="enderecoModalLabel">Selecione
													um Endereço</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="table-responsive">
													<table class="table table-bordered table-hover">
														<thead class="thead-dark">
															<tr>
																<th class="d-none" scope="col">ID</th>
																<th scope="col" class="text-center">Selecionar</th>
																<th scope="col" class="text-center">Cep</th>
																<th scope="col" class="text-center">Estado</th>
																<th scope="col" class="text-center">Cidade</th>
																<th scope="col" class="text-center">Bairro</th>
																<th scope="col" class="text-center">Rua</th>
																<th scope="col" class="text-center">Número</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="endereco" items="${enderecos}">
																<tr>
																	<td class="coluna d-none text-center align-middle">${endereco.id}</td>
																	<td class="coluna text-center align-middle"><input
																		type="radio" name="endereco.id" value="${endereco.id}">
																	</td>
																	<td class="coluna text-center align-middle">${endereco.cep}</td>
																	<td class="coluna text-center align-middle">${endereco.estado}</td>
																	<td class="coluna text-center align-middle">${endereco.cidade}</td>
																	<td class="coluna text-center align-middle">${endereco.bairro}</td>
																	<td class="coluna text-center align-middle">${endereco.rua}</td>
																	<td class="coluna text-center align-middle">${endereco.numero}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Fechar</button>

											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="email">E-mail:</label> <input type="email"
									id="email" name="email" maxlength="100" required
									class="form-control">
							</div>

							<div class="form-group">
								<label for="status">Status:<span class="text-danger">*</span></label>
								<select id="status" name="status" required class="form-control">
									<option value="true">Ativo</option>
									<option value="false">Inativo</option>
								</select>
							</div>
							<button class="btn btn-primary" type="submit">Criar</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:if test="${not empty mensagem}">
	<script>
		alert("${mensagem}");
	</script>
</c:if>

<c:import url="../componentes/footer.jsp" />


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$('#dataNascimento').mask('00/00/0000', {
			placeholder : '__/__/____'
		});
	});
</script>