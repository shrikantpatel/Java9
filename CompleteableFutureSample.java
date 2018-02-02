import java.util.Date;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.function.Supplier;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

public class CompleteableFutureSample {

    public static void main(String[] args) throws InterruptedException, ExecutionException {

        System.out.println(System.getProperty("java.version"));
        System.out.println("T1 - " + new Date());
        Future<String> f = callAsyncMethod();
        System.out.println("T4 - " + new Date());
        try {
            System.out.println("Test - " + f.get());

        } catch (CancellationException ce) {
            ce.printStackTrace(); //temp only for test code.
        }

        //using the supplier interface
        CompletableFuture<String> cf = CompletableFuture.supplyAsync(() -> "Have a nice day");
        System.out.println(cf.get());

        cf.thenAccept(s -> {
            System.out.println("Good to see you, " + s);
        });


        // playing the CompletionStage interface part of the Completable Future.
        // combining the functional composition style monads
        // I had similar question that also go answered by
        // https://stackoverflow.com/questions/43019126/completablefuture-thenapply-vs-thencompose
        CompletableFuture<String> completableFuture = CompletableFuture.supplyAsync(()-> {return "";})
                .thenCompose(s -> CompletableFuture.supplyAsync(() -> s + " World"));

        //


        System.out.println(completableFuture.get());

    }

    private static Future<String> callAsyncMethod() throws InterruptedException, ExecutionException {

        CompletableFuture<String> cf = new CompletableFuture<String>();

        Executors.newCachedThreadPool().submit(() -> {
            System.out.println("T2 - " + new Date());
            Thread.sleep(5000);
            //cf.complete("My execution is complete");
            // if you cancel the completable future it throws run time exception CancellationException
            cf.cancel(true);
            System.out.println("T3 - " + new Date());
            return null;
        });

        return cf;

    }

}