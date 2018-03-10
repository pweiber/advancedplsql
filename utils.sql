select * from DBA_SEGMENTS;

select * from dba_data_files;

alter database datafile 
   '/dbs01/devcloud/system01.dbf' 
autoextend on
maxsize unlimited;

ALTER DATABASE DATAFILE '/dbs01/devcloud/system01.dbf'
   RESIZE 10M;
