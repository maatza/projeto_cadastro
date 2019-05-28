<%@page import="projeto.model.Cliente"%>
<%@page import="projeto.model.Pessoa"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario = (String) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>FIDELIZAÇÃO DE CLIENTES</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <!-- Chamada ao css do framework Bootstrap -->
        <link href="view/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- jQuery necessaria para o funcionamento do Bootstrap -->
        <script src="view/bootstrap/js/jquery-1.11.1.js"></script>

        <!-- Chamada ao framework Bootstrap -->
        <script src="view/bootstrap/js/bootstrap.min.js"></script>

    </head>
    <body>
        <!-- Menu de navegação fixo no topo -->
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" 
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">..................................... FIDELIZAÇÃO DE CLIENTES .....................................</a>
            </div>
        </nav>
        <div class="container col-md-8 col-md-offset-2">
            <div class="table-responsive">
                <div class="panel panel-primary">
                    <div class="panel-heading" style="height: 50px;">                        
                        <div style="float: left;" >
                            <h3 class="panel-title h1">Clientes Cadastrados</h3>
                        </div>
                        <div style="float: right" >
                            <a class="panel a" href="/ProjetoAv1/cadastrar_cli.jsp"> Novo cadastro </a>&nbsp;  
                            <a class="panel a" href="/ProjetoAv1/pesquisar_cli.html"> Pesquisar clientes </a>  
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>Telefone</th>
                                    <th>Valor Acumulado</th>
                                    <th>Editar</th>
                                    <th>Excluir</th>
                                </tr>
                            </thead>
                            <tbody>                     
                                <%
                                    /**
                                     * Cria uma lista para receber os registros
                                     * do atributo listaPessoas originado do
                                     * servlet Controle
                                     */
                                    List<Cliente> clientes = (ArrayList) request.getAttribute("listaClientes");

                                    // Percorre a lista dos registros e apresenta no navegador
                                    for (Cliente c : clientes) {
                                %>

                                <tr>
                                    <td><%=c.getId()%></td>
                                    <td><%=c.getNome()%></td>
                                    <td><%=c.getTelefone()%></td>
                                    <td><%=c.getValorAcumulado()%></td>
                                    <%
                                        if (usuario == null) {
                                    %>
                                    <td><span class="glyphicon glyphicon-lock"></span></td>
                                    <td><span class="glyphicon glyphicon-lock"></span></td>
                                        <%} else {%>
                                    <td><a href="ControleCliente?acao=editar_cli&id=<%=c.getId()%>"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>&nbsp;Editar</a></td>
                                    <td><a href="ControleCliente?acao=excluir_cli&id=<%=c.getId()%>"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;Excluir</a></td>
                                    <%}%>
                                </tr>
                                <%
                                    } // Fim do laço de repetição
                                %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
