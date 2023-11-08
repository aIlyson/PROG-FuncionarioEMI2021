<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Editar Cargo</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

	<c:import url="../componentes/cabecalho.jsp" />


	<div class="container mt-5">
		<form action="altera" method="POST"
			class="bg-white p-4 shadow-sm rounded">
			<fieldset>
				<legend>Alterar cargo:</legend>
				<input type="hidden" name="id" value="${cargo.id}" required>

				<div class="form-group">
					<label for="nome">Nome<span class="text-danger">*</span></label> <input
						type="text" class="form-control" name="nome" autofocus
						maxlength="250" pattern="[A-Za-z\s]+"
						title="Preencha o campo apenas com texto" required
						value="${cargo.nome}">
				</div>

				<div class="form-group">
					<label for="salario">Salário</label> <input type="number"
						class="form-control" name="salario"
						pattern="[0-9]+(\.[0-9]{1,2})?" min="0" max="9999999" required
						value="${cargo.salario}">
				</div>

				<security:csrfInput />

				<div class="form-group">
					<a href="<c:url value='/cargo/lista' />"
						class="btn btn-secondary btn-lg"> <span
						class="fas fa-times"></span> Cancelar
					</a>
					<button type="submit" class="btn btn-primary btn-lg">
						<span class="fas fa-refresh"></span> Atualizar
					</button>
				</div>
			</fieldset>
		</form>
	</div>

</body>
</html>


