package org.ohdsi.utilities;

import org.ohdsi.analysis.Utils;

public class TestResourceReader {
    public final static String ESTIMATION_SPECIFICATION_LOCATION = "/estimation/ComparativeCohortAnalysis.json";
    
    public static String getEstimationSpecification() {
        return Utils.GetResourceAsString(ESTIMATION_SPECIFICATION_LOCATION);
    }
}
