package MyObservatoryTest;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 * This class is to execute tests
 */
public class TestRun {

    /**
     * Replace "IOS" to "Android" if you wish to test Android endpoint
     */
    @BeforeClass
    public static void before() {
        System.setProperty("karate.env", "IOS");
        //System.setProperty("karate.env", "Android");
    }

    @Test
    public void testParallel() {

        /**
         * Replace "@9day_forecast" to other available tags in feature file for specific execution, else all available cases will be executed
         */
        Results results = Runner.path("classpath:MyObservatoryTest/feature").tags("@9day_forecast").parallel(4);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

}
