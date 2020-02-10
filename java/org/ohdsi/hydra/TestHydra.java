package org.ohdsi.hydra;

import java.io.File;
import java.io.IOException;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.ohdsi.analysis.Utils;
import org.ohdsi.utilities.TestResourceReader;

public class TestHydra {
    @Rule
    public TemporaryFolder tempTestFolder = new TemporaryFolder();
    
    @Test
    public void HydrateEstimationTest() throws IOException {
        String studySpecs = TestResourceReader.getEstimationSpecification();
        Hydra hydra = new Hydra(studySpecs);
        File studyPackage = tempTestFolder.newFile("hydraOutputTest.zip");
        hydra.hydrate(studyPackage.getAbsolutePath());
    }
}
