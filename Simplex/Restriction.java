public class Restriction {

    private static final String[] VALID_TYPES = { "<", "<=", ">", ">=", "=", "!=" };
    private String type;
    private Function foo;

    public Restriction(String type, int indep, int... coefs) {
        if (!Restriction.checkType(type)) {
            throw new IllegalArgumentException("Illegal condition type");
        }
        this.type = type;
        this.foo = new Function(coefs.length, indep, coefs);
    }

    public String getType() {
        return this.type;
    }

    public int getIndep() {
        return this.foo.getIndep();
    }

    public int getDegree() {
        return this.foo.getDegree();
    }

    @Override
    public String toString() {
        String out = "";
        CoolerLinkedList<Integer>.CLLITR itr = this.foo.coefs().CLLITR(0);
        int i = 1;
        while (itr.nextIdx() < this.foo.getDegree() - 1) {
            out += itr.next().data() + "x" + i++ + " + ";
        }
        out += itr.next().data() + "x" + i + this.getType();
        return out += foo.getIndep();
    }

    public static boolean checkType(String type) {
        for (String s : VALID_TYPES) {
            if (type.equals(s)) {
                return true;
            }
        }
        return false;
    }
}
