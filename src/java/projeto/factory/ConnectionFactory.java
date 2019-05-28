package projeto.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Classe que faz a conexão com o banco de dados
 */
public class ConnectionFactory {

    // variáveis para a conexão com o banco de dados
    private final String driver = "com.mysql.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/bd_clientes";
    private final String usuario = "root";
    private final String senha = "";
    private static ConnectionFactory connectionFactory = null;

    //Método construtor da classe
    private ConnectionFactory() throws SQLException {
        try {
            // Configura o driver para a conexão
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            throw new SQLException("driver");
        }
    }

    //Método que retorna uma conexão com o banco de dado
    public Connection getConnection() throws SQLException {
        // Variável para receber a conexão
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(url, usuario, senha);
        } catch (SQLException e) {
            throw new SQLException(String.valueOf(e.getMessage()));
        }

        // Retorna uma conexão caso ocorra sucesso
        return conn;
    }

    //Método que retorna uma instância da conexão
    public static ConnectionFactory getInstance() throws SQLException {
        if (connectionFactory == null) {
            connectionFactory = new ConnectionFactory();
        }
        return connectionFactory;
    }
}
