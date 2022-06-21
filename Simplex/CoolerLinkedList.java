import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CoolerLinkedList<T> {
    private Node<T> head;
    private Node<T> tail;
    private int size;

    public CoolerLinkedList() {
        this.size = 0;
    }

    public CoolerLinkedList(T t) {
        this.head = new Node<T>(null, t, null);
        this.tail = this.head();
        this.size = 1;
    }

    public CoolerLinkedList(CoolerLinkedList<T> cll) {
        this.head = cll.head();
        this.tail = cll.tail();
        this.size = cll.size();
    }

    public Node<T> head() {
        return this.head;
    }

    public Node<T> tail() {
        return this.tail;
    }

    public int size() {
        return this.size;
    }

    public boolean add(T t) {
        if (this.size == 0) {
            this.head = new Node<T>(null, t, null);
            this.tail = this.head();
            this.size++;
            return true;
        }
        this.tail().setNext(new Node<T>(this.tail(), t, null));
        this.tail = this.tail().next();
        this.size++;
        return true;
    }

    public Node<T> get(int idx) {
        Node<T> out;
        if (idx > this.size() / 2) {
            out = this.tail();
            for (int i = 0; i < this.size() - idx; i++) {
                out = out.previous();
            }
            return out;
        }
        out = this.head();
        for (int i = 0; i < idx; i++) {
            out = out.next();
        }
        return out;
    }

    public Node<T> remove(int idx) {
        Node<T> node = this.get(idx);
        node.next().setPrevious(node.previous());
        node.previous().setNext(node.next());
        this.size--;
        return node;
    }

    public Node<T> removeHead() {
        Node<T> out = this.head();
        this.head = this.head().next();
        this.size--;
        return out;
    }

    public Node<T> removeTail() {
        Node<T> out = this.tail();
        this.tail = this.tail().previous();
        return out;
    }

    public List<T> toList() {
        ArrayList<T> al = new ArrayList<T>();
        Iterator<Node<T>> itr = this.iterator();
        while (itr.hasNext()) {
            al.add(itr.next().data());
        }
        return al;
    }

    public Iterator<Node<T>> iterator() {
        return new CLLITR();
    }

    public Iterator<Node<T>> iterator(int idx) {
        return new CLLITR(idx);
    }

    public CLLITR CLLITR(int idx) {
        return new CLLITR(idx);
    }

    public Iterator<T> legacyIterator() {
        return new LegacyIterator();
    }

    private final class LegacyIterator implements Iterator<T> {
        private Node<T> current;

        public LegacyIterator() {
            this.current = CoolerLinkedList.this.head();
        }

        public boolean hasNext() {
            return this.current.next() != null;
        }

        public T next() {
            Node<T> out = this.current;
            this.current = this.current.next();
            return out.data();
        }
    }

    protected final class CLLITR implements Iterator<Node<T>> {
        private Node<T> current;
        private int idx;

        public CLLITR() {
            this.current = CoolerLinkedList.this.head();
            this.idx = 0;
        }

        public CLLITR(int idx) {
            this.current = CoolerLinkedList.this.get(idx);
            this.idx = idx;
        }

        public boolean hasNext() {
            return this.idx < CoolerLinkedList.this.size();
        }

        public boolean hasPrevious() {
            return this.idx > 0;
        }

        public Node<T> next() {
            Node<T> out = this.current;
            this.current = this.current.next();
            this.idx++;
            return out;
        }

        public Node<T> previous() {
            Node<T> out = this.current;
            this.current = this.current.previous();
            this.idx--;
            return out;
        }

        public int nextIdx() {
            return this.idx;
        }

        public int previousIdx() {
            return this.idx;
        }
    }

    public void reverseAll() {
        Iterator<Node<T>> itr = this.iterator();
        while (itr.hasNext()) {
            itr.next().switchOrder();
        }
        Node<T> aux = this.head();
        this.head = this.tail();
        this.tail = aux;
    }

    @Override
    public String toString() {
        Iterator<Node<T>> itr = this.iterator();
        String out = "{";
        while (((CLLITR) itr).nextIdx() < this.size() - 1) {
            out += itr.next().toString() + ", ";
        }
        return out + itr.next() + "}";
    }

    protected final class Node<T> {
        private Node<T> previous;
        private T data;
        private Node<T> next;

        public Node(Node<T> previous, T t, Node<T> next) {
            this.setPrevious(previous);
            this.data = t;
            this.setNext(next);
        }

        public void setPrevious(Node<T> previous) {
            this.previous = previous;
        }

        public void setNext(Node<T> next) {
            this.next = next;
        }

        public Node<T> previous() {
            return this.previous;
        }

        public Node<T> next() {
            return this.next;
        }

        public T data() {
            return this.data;
        }

        private void switchOrder() {
            Node<T> prev = this.previous();
            this.setPrevious(this.next());
            this.setNext(prev);
        }

        @Override
        public String toString() {
            return this.data().toString();
        }
    }
}