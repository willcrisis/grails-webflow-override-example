package webflow

class Entidade1 implements Serializable {
    String campo1
    String campo2
    Long campo3
    Date campo4

    static constraints = {
        campo1 nullable: false, blank: false
        campo2 nullable: true, blank: true
        campo3 nullable: false
        campo4 nullable: false
    }
}
