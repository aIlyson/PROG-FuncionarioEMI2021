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
<title>Adicionar Empresa</title>
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
								<h1>Adicionar Empresa</h1>
								<p>Cadastrar aqui uma nova empresa.</p>
							</div>

							<div id="mensagem-erro" class="alert alert-danger"
								style="display: none;">CNPJ não encontrado. Verifique e
								tente novamente.</div>
							<div id="mensagem-carregando" class="alert alert-info"
								style="display: none;">Calma, estamos procurando...</div>

							<div class="form-group">
								<label for="cnpj">CNPJ:<span class="text-danger">*</span></label>
								<input type="text" id="cnpj" name="cnpj" maxlength="18" required
									pattern="\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}"
									title="Digite um CNPJ válido (XX.XXX.XXX/XXXX-XX)"
									class="form-control">
							</div>

							<div class="form-group">
								<label for="razao">Razão social:<span
									class="text-danger">*</span></label><br /> <input id="razao"
									type="text" name="razao" maxlength="150" required class="form-control">
							</div>

							<div class="form-group">
								<label for="nome">Nome Fantasia:<span
									class="text-danger">*</span></label> <input type="text" id="nome"
									name="nome" maxlength="150" pattern="[A-Za-z\s]+"
									title="Digite o nome,  por favor, coloque sem acentuação"
									required class="form-control">
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="cep">CEP:<span class="text-danger">*</span></label>
									<input type="text" id="cep" name="cep" required
										class="form-control">
								</div>

								<div class="form-group col-md-6">
									<label for="estado">Estado:<span class="text-danger">*</span></label>
									<input type="text" id="estado" name="estado" min="2"
										maxlength="2" required class="form-control" pattern="[A-Z]{2}"
										title="Informe dois caracteres em maiúsculo">
								</div>
							</div>

							<div class="form-group">
								<label for="cidade">Cidade:<span class="text-danger">*</span></label>
								<input type="text" id="cidade" pattern="[A-Za-z\s]+"
									title="Digite o nome,  por favor, coloque sem acentuação" name="cidade" required
									class="form-control">
							</div>

							<div class="form-group">
								<label for="email">E-mail:</label> <input type="email"
									id="email" name="email" maxlength="100" required
									class="form-control">

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
<script type="text/javascript" src="../resources/js/searchcnpj.js"></script>