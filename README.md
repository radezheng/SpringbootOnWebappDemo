# 在Azure Webapp上直接部署Springboot应用

## 迁移参考下面链接 

https://learn.microsoft.com/zh-cn/azure/developer/java/migration/migrate-spring-boot-to-app-service
<br/>
https://learn.microsoft.com/zh-cn/azure/app-service/quickstart-java?tabs=javase&pivots=platform-linux-development-environment-maven

确保本地运行正常:
```shell
mvn run -DskipTests

mvn package -DskipTests

jar tvf target/demo-0.0.1-SNAPSHOT.jar

java -jar target/demo-0.0.1-SNAPSHOT.jar
```


## 添加通过Maven部署到Azure Webapp的插件

```shell
mvn com.microsoft.azure:azure-webapp-maven-plugin:2.5.0:config
mvn package azure-webapp:deploy -DskipTests

```
查看日志:
 (需要在Web App的 App Service Logs中开启应用日志[Application Logging (Filesystem)](https://docs.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs#application-logging-filesystem) )
 
```shell
# 下载完整日志
az webapp log download --name webappsp --resource-group webappspring

# 查看实时日志
az webapp log tail --name webappsp --resource-group webappspring
```

## Azure Webapp 日志时区默认是UTC，需要修改为本地时区

 - For Windows App Service type Name and Value as:
    - Name=WEBSITE_TIME_ZONE
    - Value=China Standard Time

 - For Linux App Service type Name and Value as:
    - Name=TZ
    - Value=Asia/Shanghai
<br/>
时区参考： https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
