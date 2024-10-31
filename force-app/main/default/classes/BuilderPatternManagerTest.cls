@isTest
public class BuilderPatternManagerTest {
    @isTest
    static void testCreateProject() {
        // Start a new project using the builder pattern
        Project__c project = new BuilderPattern()
            .setName('Test Project')
            .setDescription('A test project')
            .setStatus('Not Started')
            .build();
        
        // Assert the correct values were set
        System.assertEquals('Test Project', project.Name, 'this is the third parameter to make PMD happy');
        System.assertEquals('A test project', project.Description__c, 'this is the third parameter to make PMD happy');
        System.assertEquals('Not Started', project.Status__c, 'this is the third parameter to make PMD happy');
    }
}