public class Main {

    public static void main(String[] args) {
        Function foo = new Function(3, 1, 2, 3, 4);
        System.out.println(foo.toString());
        Restriction res = new Restriction(">", 0, 2, 1);
        System.out.println(res.toString());
        Simplex simplex = new Simplex(foo, res);
        System.out.println(simplex.toString());
    }
}
