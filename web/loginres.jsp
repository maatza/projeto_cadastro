<%
    String acao = request.getParameter("acao");
    String u = request.getParameter("usuario");
    String s = request.getParameter("senha");

    if (acao.equals("Entrar")) {
        if (u.equals("fidelidade") && s.equals("fidelidade")) {
            session.setAttribute("usuario", u);
        } else {
            application.setAttribute("mensagem", "Dados invalidos!!");
        }
    } else if (acao.equals("Sair")) {
        application.removeAttribute("mensagem");
        session.invalidate();
    }
    response.sendRedirect("index.jsp");
%>