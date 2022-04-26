# book-store

Tech Stack Used

    **Java 11 
    Spring Boot
    Spring Data JPA
    Liquibase
    H2 Database
    Lombok**
    
**Build**

mvn clean install -DskipTests

**Run**

mvn spring-boot:run OR 
**Download jar from Actions tab summary** and run it with below command
java -jar <jar-name>
    
**Git Hub Actions workflow**
    
 This configured to run for any push onto maater branch or on merge of any pull request.
    
**Testinng API**  
To Test API you can import the postman collections in the project to postman and test the API.
    
**Terraform To Provision Infrastrure**    
You can run the terraform file in your local - so that it will upload the artifact to AWS. Prerequisite to do this you need install AWS CLI on your machine 
and configure AWS accekey key id and secret token.
