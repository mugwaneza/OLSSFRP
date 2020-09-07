
name := "y"

version := "1.0-SNAPSHOT"

resolvers += DefaultMavenRepository

resolvers += "Maven Repo" at "https://repo1.maven.org/maven2/"

resolvers += "Maven Repo apache" at "https://repo.maven.apache.org/maven2/"

libraryDependencies ++= Seq(
  javaJdbc,
  javaEbean,
  cache,
"org.mindrot" % "jbcrypt" % "0.3m"
)     

play.Project.playJavaSettings

libraryDependencies += "mysql" % "mysql-connector-java" % "5.1.38"
