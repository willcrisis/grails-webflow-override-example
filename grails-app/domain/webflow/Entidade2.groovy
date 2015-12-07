package webflow

/**
 * Created with IntelliJ IDEA.
 * User: willian.krause
 * Date: 23/05/14
 * Time: 16:39
 * To change this template use File | Settings | File Templates.
 */
class Entidade2 implements Serializable {
    String outroCampo
    Integer maisUm

    static belongsTo = [entidade1: Entidade1]

    static constraints = {
        outroCampo nullable: false, blank: false
        maisUm nullable: true
    }
}
