package projeto.dao;

import projeto.model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import projeto.factory.ConnectionFactory;

public class ClienteDAO {

    private final Connection conexao;
    PreparedStatement ps = null;
    String sqlSel = "SELECT * FROM tb_clientes ORDER BY nome ASC;";

    public ClienteDAO() throws SQLException {
        this.conexao = ConnectionFactory.getInstance().getConnection();
    }

    public String inserir(Cliente c) throws SQLException {
        String sql = "INSERT INTO tb_clientes "
                + "(nome, telefone, valorAcumulado) "
                + "VALUES (?, ?, ?) ";
        try {
            PreparedStatement psI = conexao.prepareStatement(sql);
            psI.setString(1, c.getNome());
            psI.setString(2, c.getTelefone());
            psI.setFloat(3, c.getValorAcumulado());
            psI.execute();
            conexao.close();
            return "Registro incluído com sucesso!";
        } catch (SQLException e) {
            return e.getMessage();
        }
    }

    public List<Cliente> editar(Cliente c) throws SQLException {

        String sql = "SELECT * FROM tb_clientes WHERE id = ?;";

        List lstCliente = new ArrayList();

        try {
            PreparedStatement psC = conexao.prepareStatement(sql);
            psC.setInt(1, c.getId());

            ResultSet rs = psC.executeQuery();
            rs.next();

            c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            c.setValorAcumulado(rs.getFloat("valorAcumulado"));

            lstCliente.add(c);
            conexao.close();
        } catch (SQLException e) {
            return null;
        }
        return lstCliente;
    }

    public String excluir(Cliente p) throws SQLException {
        String sql = "DELETE FROM tb_clientes WHERE id = ?;";
        try {
            PreparedStatement psE = conexao.prepareStatement(sql);
            psE.setInt(1, p.getId());
            psE.executeUpdate();
            conexao.close();
        } catch (SQLException e) {
            return e.getMessage();
        }
        return "Registro excluído com sucesso!";
    }

    public String alterar(Cliente p) {
        String sql = "UPDATE tb_clientes SET "
                + "nome = ?, telefone = ?, valorAcumulado = ? "
                + "WHERE id = ?;";
        try {
            PreparedStatement psA = conexao.prepareStatement(sql);
            psA.setString(1, p.getNome());
            psA.setString(2, p.getTelefone());
            psA.setFloat(3, p.getValorAcumulado());
            psA.setInt(4, p.getId());
            psA.executeUpdate();
            conexao.close();
        } catch (SQLException e) {
            return e.getMessage();
        }
        return "Registro alterado com sucesso!";
    }

    public List<Cliente> pesquisar(Cliente p) throws SQLException {
        List lista = listar(p);
        return lista;
    }

    private List listar(Cliente p) throws SQLException {
        sqlSel = "SELECT * FROM tb_clientes "
                + "WHERE nome like ?   "
                + "ORDER BY nome ASC;  ";
        ps = conexao.prepareStatement(sqlSel);
        ps.setString(1, p.getNome());
        return listar();
    }

    public List<Cliente> listar() {
        List lista = new ArrayList();
        try {
            if (ps == null) {
                this.ps = conexao.prepareStatement(sqlSel);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente p = new Cliente();

                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setTelefone(rs.getString("telefone"));
                p.setValorAcumulado(rs.getFloat("valorAcumulado"));

                lista.add(p);
            }
            conexao.close();
        } catch (SQLException e) {
            lista = null;
        }
        return lista;
    }
}
