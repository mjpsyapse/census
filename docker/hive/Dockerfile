FROM openjdk:11

RUN useradd --create-home --shell /bin/bash hive
USER hive

ARG HADOOP_VERSION=2.10.1
ENV HADOOP_HOME=/home/hive/hadoop

WORKDIR /home/hive

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz -P $HOME && \
    tar xf $HOME/hadoop-$HADOOP_VERSION.tar.gz -C $HOME && \
    rm $HOME/hadoop-$HADOOP_VERSION.tar.gz && \
    mv $HOME/hadoop-$HADOOP_VERSION $HADOOP_HOME

ARG HIVE_VERSION=3.1.3
ENV HIVE_HOME=/home/hive/hive
ENV PATH=$HIVE_HOME/bin:$PATH

RUN wget https://dlcdn.apache.org/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz -P $HOME && \
    tar xf $HOME/apache-hive-$HIVE_VERSION-bin.tar.gz -C $HOME && \
    rm $HOME/apache-hive-$HIVE_VERSION-bin.tar.gz && \
    mv $HOME/apache-hive-$HIVE_VERSION-bin $HIVE_HOME

RUN wget https://jdbc.postgresql.org/download/postgresql-42.3.4.jar -O $HIVE_HOME/lib/postgresql-jdbc.jar

RUN cp $HADOOP_HOME/share/hadoop/tools/lib/hadoop-aws-2.10.1.jar $HIVE_HOME/lib/. && \
    cp $HADOOP_HOME/share/hadoop/tools/lib/aws-java-sdk-bundle-1.11.271.jar $HIVE_HOME/lib/.

RUN rm $HIVE_HOME/lib/postgresql-9.4.1208.jre7.jar

EXPOSE 9083
ENTRYPOINT ["hive"]
CMD ["--service", "metastore"]
