--
-- Create a default database
--
--- utf8 must be set to allow column with varchar(255)
CREATE DATABASE sftpgo DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

--
-- Default User
--
CREATE USER `sftpuser` identified by 'sftppassword';
GRANT ALL privileges ON `sftpgo`.* TO 'sftpuser'@'%';
FLUSH PRIVILEGES;

use sftpgo

BEGIN;
--
-- Create model User
--
CREATE TABLE `users` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `username` varchar(255) NOT NULL UNIQUE, `password` varchar(255) NULL, `public_keys` longtext NULL, `home_dir` varchar(255) NOT NULL, `uid` integer NOT NULL, `gid` integer NOT NULL, `max_sessions` integer NOT NULL, `quota_size` bigint NOT NULL, `quota_files` integer NOT NULL, `permissions` longtext NOT NULL, `used_quota_size` bigint NOT NULL, `used_quota_files` integer NOT NULL, `last_quota_update` bigint NOT NULL, `upload_bandwidth` integer NOT NULL, `download_bandwidth` integer NOT NULL);
COMMIT;
