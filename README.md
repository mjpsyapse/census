# Census Data

Data pipeline for ingesting US census data

## References

* [General Setup](https://blog.min.io/interactive-sql-query-with-presto-on-minio-cloud-storage/)
* [Hive Architecture](https://cwiki.apache.org/confluence/display/Hive/Design)
* [Trino Hive Connector](https://trino.io/docs/current/connector/hive-s3.html)

## Setup

__Prerequisites__

* kubernetes (kubectl)
* kind (local kubernetes cluster)
* krew (kubectl plugin manager)
* helm
* aws cli

## Data Sources

Data is tricky to download.  Data has been downloaded from https://www2.census.gov/programs-surveys/cps/datasets/

To download the data, go to the `data/` or `metadata/` directories, and run `./fetch`.
