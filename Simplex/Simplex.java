import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

public class Simplex {
    private Function foo;
    private Map<Integer, Restriction> restrictions;

    public Simplex(Function foo, Restriction... restrictions) {
        this.foo = foo;
        this.restrictions = new TreeMap<Integer, Restriction>();
        for (int i = 0; i < restrictions.length; i++) {
            this.restrictions.put(i, restrictions[i]);
        }
    }

    public int[][] toMatrix() {
        /*
         * 0 1 2 3 1 = min
         * 0 2 3 4 0 1 0
         * 1 2 1 0 1 0 0
         */
        int[][] out = new int[this.restrictions.size() + 1][this.restrictions.size() + this.foo.getDegree() + 3];
        Iterator<Integer> itr = this.foo.legacyIterator();
        int j = 0;
        for (int i = 1; i < out[0].length - 3; i++) {
            out[0][i] = i;
        }
        for (int i = 0; i < out[0].length - 2; i++) {
            out[0][i + out[0].length - 4] = i + 1;
        }
        out[1][0] = 0;
        while (itr.hasNext()) {
            out[1][j + 1] = itr.next().intValue();
        }
        for (int i = this.foo.getDegree(); i < out[0].length; i++) {
            out[1][i] = 0;
        }
        out[1][this.foo.getDegree() + this.restrictions.size() - 1] = this.foo.getIndep();
        return out;
    }

    @Override
    public String toString() {
        String out = "";
        int[][] m = this.toMatrix();
        for (int i = 0; i < m.length; i++) {
            for (int j = 0; j < m[i].length; j++) {
                out += m[i][j] + " ";
            }
            out += "\n";
        }
        return out;
    }
}
