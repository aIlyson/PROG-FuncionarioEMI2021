<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Editar Dados Contratuais</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5">
	<form action="altera" method="POST" onsubmit="return validarDatas()"
		class="bg-white p-4 shadow-sm rounded">
		<fieldset>
			<legend class="d-flex justify-content-between align-items-center">
				Alterar dados do contrato:
				<button type="button" class="btn btn-outline-warning"
					data-toggle="modal" data-target="#confirmarArquivamentoModal">
					<span class="fas fa-archive"></span> Arquivar Contrato
				</button>
			</legend>
			<!-- Modal -->
			<div class="modal fade" id="confirmarArquivamentoModal" tabindex="-1"
				role="dialog" aria-labelledby="confirmarArquivamentoModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="confirmarArquivamentoModalLabel">Arquivar
								Contrato</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">Tem certeza de que deseja arquivar
							este contrato?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancelar</button>
							<button type="button" class="btn btn-warning"
								onclick="arquivarContrato()">Arquivar Contrato</button>
						</div>
					</div>
				</div>
			</div>

			<input type="hidden" name="id" value="${contratos.id}" required>
			<input type="hidden" name="cargo.id" value="${contratos.cargo.id}"
				required> <input type="hidden" name="empresa.id"
				value="${contratos.empresa.id}" required> <input
				type="hidden" name="funcionarios.id"
				value="${contratos.funcionarios.id}" required>

			<div class="form-group">
				<label for="matricula">Matrícula:<span class="text-danger">*</span></label>
				<input type="text" id="matricula" name="matricula"
					class="form-control" required pattern="\d{9}-\d" maxlength="11"
					title="Digite 9 dígitos seguidos por um hífen e um dígito. Exemplo: 123456789-0"
					value="${contratos.matricula}"> <small>Exemplo:
					123456789-0</small>

			</div>

			<div class="form-group">
				<label for="dataInicio" class="d-block mt-3">Data Inicial:<span
					class="text-danger">*</span>
				</label>
				<fmt:formatDate pattern="dd/MM/yyyy" value="${contratos.dataInicio}"
					var="dataFormatada" />
				<input type="text" id="dataInicio" name="dataInicio"
					pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(2000|20[0-2][0-9]|2040)$"
					title="Formato inválido. Insira entre 01/01/2000 e 31/12/2040"
					required class="form-control" value="${dataFormatada}">
			</div>

			<div class="form-group">
				<label for="dataEncerramento" class="d-block mt-3">Data de
					Encerramento:<span class="text-danger">*</span>
				</label>
				<fmt:formatDate pattern="dd/MM/yyyy"
					value="${contratos.dataEncerramento}" var="dataFormatada" />
				<input type="text" id="dataEncerramento" name="dataEncerramento"
					pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(2000|20[0-2][0-9]|2040)$"
					title="Formato inválido. Insira entre 01/01/2000 e 31/12/2040"
					required class="form-control text-danger" value="${dataFormatada}"
					onchange="verificarRenovacao()">
			</div>

			<div class="form-group">
				<label for="status">Status:<span class="text-danger">*</span></label>
				<select id="status" name="status" required class="form-select">
					<option value="Ativo"
						<c:if test="${contratos.status eq 'Ativo'}">selected</c:if>>Ativo</option>
					<option value="Inativo"
						<c:if test="${contratos.status eq 'Inativo'}">selected</c:if>>Inativo</option>
					<option value="Renovado"
						<c:if test="${contratos.status eq 'Renovado'}">selected</c:if>>Renovado</option>
					<option value="Vencido"
						<c:if test="${contratos.status eq 'Vencido'}">selected</c:if>>Vencido</option>
					<option value="Rescindido"
						<c:if test="${contratos.status eq 'Rescindido'}">selected</c:if>>Rescindido</option>
					<option value="Arquivado"
						<c:if test="${contratos.status eq 'Arquivado'}">selected</c:if>>Arquivado</option>
				</select>
			</div>

			<security:csrfInput />

			<div class="form-group">
				<a href="<c:url value='/contratos/lista' />"
					class="btn btn-secondary btn-lg"> <span class="fas fa-times"></span>
					Cancelar
				</a>
				<button type="submit" class="btn btn-primary btn-lg">
					<span class="fas fa-refresh"></span> Atualizar
				</button>
			</div>
		</fieldset>
	</form>
</div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/validatedate.js"></script>
<script type="text/javascript" src="../resources/js/contratos.js"></script>

</body>
</html>
