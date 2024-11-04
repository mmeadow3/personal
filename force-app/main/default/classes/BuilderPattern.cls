public with sharing class BuilderPattern {
  // The private Project SObject we are building
  private Project__c project;

  ///Instead of passing all of these into a constructor, we’ll build a project step by step using the Builder pattern.
  // Constructor initializes a new Project object
  public BuilderPattern() {
    project = new Project__c();
  }

  // Method to set the Project Name
  public BuilderPattern setName(String name) {
    project.Name = name;
    return this; // Returning the builder instance for method chaining
  }

  // Method to set the Description
  public BuilderPattern setDescription(String description) {
    project.Description__c = description;
    return this; // Returning the builder instance for method chaining
  }

  // Method to set the Status
  public BuilderPattern setStatus(String status) {
    project.Status__c = status;
    return this; // Returning the builder instance for method chaining
  }

  // Method to set the Start Date
  public BuilderPattern setStartDate(Date startDate) {
    project.StartDate__c = startDate;
    return this; // Returning the builder instance for method chaining
  }

  // Method to set the End Date
  public BuilderPattern setEndDate(Date endDate) {
    project.EndDate__c = endDate;
    return this; // Returning the builder instance for method chaining
  }

  // Method to finally "build" and return the Project SObject
  ////he build() method finalizes the creation of the object after all necessary properties have been set.
  public Project__c build() {
    ///// Extra example - lets validate in the builder to make sure the properties make sense, like End Date cant be before Start Date
    validateDates();
    return project;
  }

  private void validateDates() {
    // Validate End Date is after Start Date
    if (project.StartDate__c > project.EndDate__c) {
      //// also should normnally put a null check here just in case the dates aren't provided
      throw new BuildException('End Date must be after Start Date');
    }
    ////we tested this by changing the dates in the BuilderPatternManager class
    /// .setStartDate(Date.today().addDays(30))
    /// .setEndDate(Date.today())
  }

  // Exception class for the builder pattern
  public class BuildException extends Exception {
  }
}
