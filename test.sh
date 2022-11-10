mvn run -DskipTests

mvn package -DskipTests

jar tvf target/demo-0.0.1-SNAPSHOT.jar

java -jar target/demo-0.0.1-SNAPSHOT.jar

https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
For Windows App Service type Name and Value as:
Name=WEBSITE_TIME_ZONE
Value=Eastern Standard Time
For Linux App Service type Name and Value as:
Name=TZ
Value=America/New_York

https://learn.microsoft.com/zh-cn/azure/developer/java/migration/migrate-spring-boot-to-app-service

https://learn.microsoft.com/zh-cn/azure/app-service/quickstart-java?tabs=javase&pivots=platform-linux-development-environment-maven


mvn com.microsoft.azure:azure-webapp-maven-plugin:2.5.0:config
mvn package azure-webapp:deploy -DskipTests

az webapp log download --name webappsp --resource-group webappspring

az webapp log tail --name webappsp --resource-group webappspring