postgresql



<entry [Thu 2014:07:24 11:04:24 EST] LOGIN ON COMMAND LINE>

psql -d mydb -U myuser

If you need to log into a Postgres database on a server named myhost, you can use this Postgres login command:

psql -h myhost -d mydb -U myuser

If for some reason you are not prompted for a password when issuing these commands, you can use the -W option, leading to these two command alternatives:

psql -d mydb -U myuser -W
psql -h myhost -d mydb -U myuser -W
	
</entry>
<entry [Mon 2013:11:25 22:25:04 EST] DUMP DATABASE>


sudo -u postgres pg_dump confluence > confluence.dump
 
	
</entry>
<entry [Sat 2013:11:23 16:10:43 EST] FIXED ERROR ON dropdb: 'database removal failed: ERROR:  database "confluence" is being accessed by other users'>

PROBLEM

GET THIS ERROR ON dropdb COMMAND

sudo -u postgres dropdb confluence

	dropdb: database removal failed: ERROR:  database "confluence" is being accessed by other users

DIAGNOSIS

CHECK ACTIVITY ON DATABASE

sudo -u postgres psql -tAc "SELECT * FROM pg_stat_activity WHERE datname='confluence'";

	18146|confluence|6543|18145|confuser||127.0.0.1||60983|2013-11-24 00:20:57.009512+00||2013-11-24 00:28:07.005654+00|2013-11-24 00:28:07.005697+00|f|idle|SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED

OR

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'confluence'
  AND pid <> pg_backend_pid();

	t
	(1 row)

	
SOLUTION

TERMINATE ACTIVE PROCESSES ON confluence DATABASE

(NB: MUST RUN COMMAND TWICE TO BE ABLE TO DROP DATABASE)



	t

sudo -u postgres psql -tAc "SELECT * FROM pg_stat_activity WHERE datname='confluence'";
18146|confluence|6724|18145|confuser||127.0.0.1||60987|2013-11-24 00:41:57.009976+00||2013-11-24 00:42:47.005662+00|2013-11-24 00:42:47.005706+00|f|idle|SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED


sudo -u postgres psql -tAc " SELECT pg_terminate_backend(6724) "
	t

sudo -u postgres dropdb confluence

	OK


ALTERNATIVES:

IF NO OTHER USER IS CONNECTED, THIS IS BECAUSE PostgreSQL HAS PENDING TRANSACTIONS THAT HAVE NOT BEEN COMMITTED
(which should never happen except if the database is shut down in an unclean manner (machine crash).

CHECK FOR PENDING TRANSACTIONS:

sudo -u postgres psql -tAc "SELECT database, gid FROM pg_prepared_xacts";


If you get a result, then for each transaction gid you must execute a ROLLBACK from the database having the problem:
ROLLBACK PREPARED 'the_gid';
For instance:

nuxeo=# SELECT database, gid FROM pg_prepared_xacts;
 database | gid
----------+-----
 nuxeo | 131075_MS03ZjAwMDEzYTo0YTg5MjA5NzoxMDczMg==
(1 row)
nuxeo=# ROLLBACK PREPARED '131075_MS03ZjAwMDEzYTo0YTg5MjA5NzoxMDczMg==';
ROLLBACK PREPARED
If you have lots of transactions you can run this psql scripts:
\t
\a
\o /tmp/remove-transactions.sql
SELECT 'ROLLBACK PREPARED ''' || gid || ''';'  AS cmd
  FROM pg_prepared_xacts
  WHERE database=current_database();
\o
\i /tmp/remove-transactions.sql


OR

RESTART THE DATABASE

/etc/init.d/postgresql restart
 * Restarting PostgreSQL 9.2 database server                   



</entry>
<entry [Fri 2013:11:22 13:26:32 EST] LOGIN AND DESCRIBE TABLES>


DIVING INTO jira DATABASE IN POSTGRESQL

CHANGE TO postgres USER
sudo -s -H -u postgres

LOG INTO jira DATABASE
psql jira

OR DO BOTH:
sudo -u postgres psql jira


SHOW TABLES
\d

desc table

\d cwd_membership
             Table "public.cwd_membership"
      Column       |          Type          | Modifiers 
-------------------+------------------------+-----------
 id                | numeric(18,0)          | not null
 parent_id         | numeric(18,0)          | 
 child_id          | numeric(18,0)          | 
 membership_type   | character varying(60)  | 
 group_type        | character varying(60)  | 
 parent_name       | character varying(255) | 
 lower_parent_name | character varying(255) | 
 child_name        | character varying(255) | 
 lower_child_name  | character varying(255) | 
 directory_id      | numeric(18,0)          | 
Indexes:
    "pk_cwd_membership" PRIMARY KEY, btree (id)
    "uk_mem_parent_child_type" UNIQUE, btree (parent_id, child_id, membership_type)
    "idx_mem_dir_child" btree (lower_child_name, membership_type, directory_id)
    "idx_mem_dir_parent" btree (lower_parent_name, membership_type, directory_id)
    "idx_mem_dir_parent_child" btree (lower_parent_name, lower_child_name, membership_type, directory_id)


\d cwd_user

                 Table "public.cwd_user"
       Column        |           Type           | Modifiers 
---------------------+--------------------------+-----------
 id                  | numeric(18,0)            | not null
 directory_id        | numeric(18,0)            | 
 user_name           | character varying(255)   | 
 lower_user_name     | character varying(255)   | 
 active              | numeric(9,0)             | 
 created_date        | timestamp with time zone | 
 updated_date        | timestamp with time zone | 
 first_name          | character varying(255)   | 
 lower_first_name    | character varying(255)   | 
 last_name           | character varying(255)   | 
 lower_last_name     | character varying(255)   | 
 display_name        | character varying(255)   | 
 lower_display_name  | character varying(255)   | 
 email_address       | character varying(255)   | 
 lower_email_address | character varying(255)   | 
 credential          | character varying(255)   | 
 deleted_externally  | numeric(9,0)             | 
 external_id         | character varying(255)   | 
Indexes:
    "pk_cwd_user" PRIMARY KEY, btree (id)
    "uk_user_name_dir_id" UNIQUE, btree (lower_user_name, directory_id)
    "idx_display_name" btree (lower_display_name)
    "idx_email_address" btree (lower_email_address)
    "idx_first_name" btree (lower_first_name)
    "idx_last_name" btree (lower_last_name)
    "uk_user_externalid_dir_id" btree (external_id, directory_id)


\d cwd_group

          Table "public.cwd_group"
      Column       |           Type           | Modifiers 
-------------------+--------------------------+-----------
 id                | numeric(18,0)            | not null
 group_name        | character varying(255)   | 
 lower_group_name  | character varying(255)   | 
 active            | numeric(9,0)             | 
 local             | numeric(9,0)             | 
 created_date      | timestamp with time zone | 
 updated_date      | timestamp with time zone | 
 description       | character varying(255)   | 
 lower_description | character varying(255)   | 
 group_type        | character varying(60)    | 
 directory_id      | numeric(18,0)            | 
Indexes:
    "pk_cwd_group" PRIMARY KEY, btree (id)
    "uk_group_name_dir_id" UNIQUE, btree (lower_group_name, directory_id)
    "idx_group_active" btree (lower_group_name, active)
    "idx_group_dir_id" btree (directory_id)




	
</entry>
<entry [Mon 2013:09:23 01:42:21 EST] HOW TO LOGIN, SHOW TABLES, QUIT, ETC.>

LOGIN
sudo -u postgres psql confluence

SHOW TABLES
\d

EXIT
\q

DESC TABLE
\d+ cwd_membership


</entry>
<entry [Sat 2013:09:21 21:55:33 EST] POSTGRESQL EQUIVALENTS OF MYSQL 'SHOW DATABASE', ETC.>

mysql: SHOW TABLES
postgresql: \d
postgresql: SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

mysql: SHOW DATABASES
postgresql: \l
postgresql: SELECT datname FROM pg_database;

mysql: SHOW COLUMNS
postgresql: \d table
postgresql: SELECT column_name FROM information_schema.columns WHERE table_name ='table';

mysql: DESCRIBE TABLE
postgresql: \d+ table
postgresql: SELECT column_name FROM information_schema.columns WHERE table_name ='table';


</entry>