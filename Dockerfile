FROM eclipse-temurin:8-jdk

RUN useradd -ms /bin/bash appuser

COPY scoring-engine-0.0.1-SNAPSHOT.jar /opt/

RUN chown -R appuser:appuser /opt
USER appuser

EXPOSE 4011
CMD ["/bin/bash", "-c", "java -XX:+PrintFlagsFinal $JAVA_OPTIONS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar /opt/scoring-engine-0.0.1-SNAPSHOT.jar"]

