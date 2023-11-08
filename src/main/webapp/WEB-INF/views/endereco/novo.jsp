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
<title>Adicionar Endereço</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.contrast {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
}

.contrast img {
	max-height: 100%;
	width: auto;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>

<c:import url="../componentes/cabecalho.jsp" />

<div class="container mt-5 mb-5 position-relative">
	<div class="row justify-content-center">
		<div class="col-md-7">
			<div class="form bg-white p-4 shadow">
				<div class="row">
					<div class="col-md-6 order-md-2">
						<div class="contrast">
							<img src="../resources/imagens/3.png" alt="Mapa"
								class="img-fluid">
						</div>
					</div>
					<div class="col-md-6 order-md-1">

						<form action="adiciona" method="POST">
							<div class="mt-4 mb-4">
								<h1>Adicionar Endereços</h1>
								<p>Cadastrar aqui novos endereços.</p>
							</div>

							<div id="mensagem-erro" class="alert alert-danger"
								style="display: none;">CEP não encontrado. Verifique e
								tente novamente.</div>
							<div id="mensagem-carregando" class="alert alert-info"
								style="display: none;">Calma, estamos procurando...</div>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="cep">CEP:</label> <input type="text" id="cep"
										name="cep" pattern="[0-9]{5}-?[0-9]{3}" maxlength="9" required
										class="form-control">
								</div>
								
								<div class="form-group col-md-6">
									<label for="estado">Estado:</label> <input type="text"
										id="estado" name="estado" min="2" maxlength="2" required class="form-control"
										pattern="[A-Z]{2}"
										title="Informe dois caracteres em maiúsculo">
								</div>
							</div>

							<div class="form-group">
								<label for="cidade">Cidade:</label> <input type="text"
									id="cidade" name="cidade" required class="form-control">
							</div>

							<div class="form-group">
								<label for="bairro">Bairro:</label> <input type="text"
									id="bairro" name="bairro" maxlength="50" pattern="[A-Za-z\s]+"
									title="Digite seu bairro" required class="form-control">
							</div>

							<div class="form-group">
								<label for="rua">Rua:</label> <input type="text" name="rua"
									maxlength="50" pattern="[A-Za-z0-9\s]+" title="Digite sua rua"
									required class="form-control">
							</div>

							<div class="form-group">
								<label for="numero">Número:</label> <input type="number"
									name="numero" maxlength="12" pattern="[0-9]+"
									title="Digite o número de seu endereço" class="form-control">
							</div>

							<button class="btn btn-primary" type="submit">Criar</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../componentes/footer.jsp" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script type="text/javascript" src="../resources/js/searchcep.js"></script>