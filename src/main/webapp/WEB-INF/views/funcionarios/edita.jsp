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
<title>Editar Funcionário</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5">
	<form action="altera" method="POST"
		class="bg-white p-4 shadow-sm rounded">
		<fieldset>
			<legend>Alterar funcionário:</legend>

			<input type="hidden" name="id" value="${funcionarios.id}" required>
			<input type="hidden" name="endereco.id"
				value="${funcionarios.endereco.id}" required>

			<div class="form-group">
				<label for="nome">Nome:<span class="text-danger">*</span></label> <input
					type="text" id="nome" name="nome" maxlength="150"
					pattern="[A-Za-z\s]+"
					title="Digite seu nome,  por favor, coloque sem acentuação"
					required class="form-control" value="${funcionarios.nome}">
			</div>

			<div class="form-group">
				<label for="dataNascimento" class="d-block mt-3">Data de
					Nascimento:<span class="text-danger">*</span>
				</label>
				<fmt:formatDate pattern="dd/MM/yyyy"
					value="${funcionarios.dataNascimento}" var="dataFormatada" />
				<input type="text" id="dataNascimento" name="dataNascimento"
					pattern="\d{1,2}/\d{1,2}/\d{4}"
					title="Formato inválido. Use dd/MM/yyyy" required
					class="form-control" value="${dataFormatada}">
			</div>

			<div class="form-group">
				<label for="email">E-mail:</label> <input type="email" id="email"
					name="email" required class="form-control"
					value="${funcionarios.email}">
			</div>

			<div class="form-group">
				<label for="status">Status:<span class="text-danger">*</span></label>
				<select id="status" name="status" required class="form-control">
					<option value="true">Ativo</option>
					<option value="false">Inativo</option>
				</select>
			</div>

			<security:csrfInput />

			<div class="form-group">
				<a href="<c:url value='/funcionarios/lista' />"
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

<script>
	$(document).ready(function() {
		$('#dataNascimento').mask('00/00/0000', {
			placeholder : '__/__/____'
		});
	});
</script>

</body>
</html>


