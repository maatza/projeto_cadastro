package projeto.model;

public class Pessoa {
    
    //atributos da classe pessoa
    private int id;
    private String nome;
    private String telefone;

    //contrutor da classe pessoa
    public Pessoa() {
    }
    
    //getters and setters da classe pessoa
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}
