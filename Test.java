import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeoutException;
import java.util.logging.Logger;

public class Test {

    private static final Logger logger = Logger.getLogger(Test.class.getName());

    public static void main(String[] args) throws InterruptedException, ExecutionException, TimeoutException {

        List<Integer> a = new LinkedList<Integer>(Arrays.asList(1, 2, 3, 4, 5));

        a.stream().filter(i -> i >= 3).forEach(i -> logger.info("" + i));

        List<String> myList = Arrays.asList("a1", "a2", "b1", "c2", "c1");

        myList.stream().filter(s -> s.startsWith("c")).map(String::toUpperCase).sorted().forEach(i -> logger.info(i));

        Arrays.stream(new int[] {1, 2, 3}).mapToObj(n -> "Obj" +n).forEach(System.out::print);



    }
}