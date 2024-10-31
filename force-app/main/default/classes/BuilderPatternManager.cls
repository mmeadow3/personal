public with sharing class BuilderPatternManager {
        public static void createProject() {
            // Using the Builder pattern to create a project
            Project__c newProject = new BuilderPattern()    ////// this is also polymorphism
                .setName('AI Integration Project')
                .setDescription('A project to integrate AI into our systems')
                .setStatus('In Progress')
                .setStartDate(Date.today().addDays(30))
                .setEndDate(Date.today())
                .build();
    
            // Insert the project into Salesforce
            // Check if the user has permission to create Project__c records
            if (Schema.sObjectType.Project__c.isCreateable()) {  ///// This line is just to make the PMD happy
                insert newProject;
            } else {
                // Handle lack of permissions appropriately
                // For example, throw a custom error or log the issue
                System.debug('User does not have permission to insert this object');
            }
        }
}
//// And this bad boy can be called by:: BuilderPatternManager.createProject();

//Separation of Concerns: The construction logic is decoupled from the representation,
    // The ProjectBuilder class is responsible for building the Project__c object in a clean and readable way.
//Fluent Interface: The builder methods (setName, setDescription, etc.) return the instance of the builder itself (this), 
    //enabling method chaining for cleaner code.
//Flexibility: You can build an object step-by-step, only setting the fields you care about. 
    //This reduces the need for overloaded constructors or optional parameters.