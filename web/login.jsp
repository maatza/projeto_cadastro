<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        String msg = (String) application.getAttribute("mensagem");
        msg = (msg == null) ? "Entre com o usuario e senha para acesso completo a ferramenta!" : msg;
%>
<div>
    <form action="loginres.jsp" method="post" >
        <div >
        <input type="text" class="input-text" name="usuario" size="10" placeholder="Usuário" >
        <input type="password" class="input-text" name="senha" size="10" placeholder="Senha" >
        <input type="submit" class="button-principal" name="acao" Value="Entrar" >
        </div>
    </form>
</div>
<%
} else {
%>
<div class="panel" >
    <form action="loginres.jsp" method="post" >
        <div >
            Usuï¿½rio:
            <input class="input-primary" type="text" name="usuario" size="10" value="<%=usuario%>" disabled >
            <input type="submit" name="acao" Value="Sair" >
        </div>
        <div  >Acesso autorizado!</div>
    </form>
</div>
<%}%>