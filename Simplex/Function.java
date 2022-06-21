import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class Function {

    private int degree;
    private CoolerLinkedList<Integer> coefs;
    private int indep;

    public Function(int degree, int[] coefs) {
        this.degree = degree;
        this.coefs = new CoolerLinkedList<Integer>();
        for (int e : coefs) {
            this.coefs.add(e);
        }
        this.indep = this.coefs.removeTail().data();
    }

    public Function(int degree, Collection<Integer> coefs) {
        this.degree = degree;
        this.coefs = new CoolerLinkedList<Integer>();
        coefs.forEach(e -> this.coefs.add(e));
        this.indep = this.coefs.removeTail().data();
    }

    public Function(int degree, int indep, int... coefs) {
        this.degree = degree;
        this.coefs = new CoolerLinkedList<Integer>();
        for (int e : coefs) {
            this.coefs.add(e);
        }
        this.indep = indep;
    }

    public Function(Function foo) {
        this(foo.getDegree(), foo.getCoefsList());
    }

    public int getDegree() {
        return this.degree;
    }

    public List<Integer> getCoefsList() {
        return this.coefs.toList();
    }

    public CoolerLinkedList<Integer> coefs() {
        return this.coefs;
    }

    public int getIndep() {
        return this.indep;
    }

    public int getDegree(int degree) {
        if (this.degree < degree - 1) {
            throw new IllegalArgumentException("Degree is too high");
        }
        return (degree == 0) ? this.getIndep() : this.coefs.get(degree - 1).data();
    }

    public Iterator<CoolerLinkedList<Integer>.Node<Integer>> iterator() {
        return this.coefs.iterator();
    }

    public Iterator<CoolerLinkedList<Integer>.Node<Integer>> descendingIterator() {
        return this.coefs.iterator(this.coefs.size());
    }

    public Iterator<Integer> legacyIterator() {
        return this.coefs.legacyIterator();
    }

    @Override
    public String toString() {
        String out = "";
        CoolerLinkedList<Integer>.CLLITR itr = this.coefs.CLLITR(0);
        int i = 1;
        while (itr.hasNext()) {
            out += itr.next().data() + "x" + i++ + " + ";
        }
        return out += this.getIndep();
    }

}