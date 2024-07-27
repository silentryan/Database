# Learn

## Mysql数据模型
Client-----> DBMS------> Database

## Termology
1. RDBMS: 关系型数据库  
建立在关系模型基础上，由多张相互连接的二维表组成的数据库。

## MYSQL 数据类型
1. 数值类型
特别说明,可以用 signed 和 unsigned 来标识一个数字类型是有符号数或者无符号数
(1) TINYINT 1 bytes
(2) SMALLINT 2 bytes
(3) MEDIUMINT 3 bytes
(4) INT or INTEGER 4 bytes
(5) BIGINT 8 bytes
(6) FLOAT 4 bytes
(7) DOUBLE 8 bytes
(8) DECIMAL 依赖于 M (精度) 和 D (标度) 的值


2. 字符串类型
(1) CHAR 0-255 bytes 定长字符串
(2) VARCHAR 0-65535 bytes 变长字符串
(3) TINYBLOB 0-255 bytes 存放二进制数据
(3) BLOB 0-65535 bytes 存放二进制数据
(4) MEDIUMBLOB 0-16777215 bytes (2^24 - 1) 存放二进制数据
(5) LONGBLOB 0-4294967295 bytes 存放二进制数据
(6) TINYTEXT 0-255 bytes 存放文本字符串
(7) TEXT 0-65535 bytes 存放文本字符串
(8) MIDIUMTEXT 0-16777215 bytes (2^24 - 1) 存放文本字符串
(9) LONGTEXT 0-4294967295 bytes 存放文本字符串


3. 日期类型
(1) DATE 格式YYYY-MM-DD。 1000-01-01 -- 9999-12-31
(2) TIME 格式 HH:MM:SS 时间值或持续时间。取值范围 -838:59:59 -- 838:59:59
(3) YEAR 格式 YYYY 年份值。 取值范围 1901-2155
(4) DATETIME 格式 YYYY-MM-DD HH:MM:SS 混合日期和时间值. 取值范围 1000-01-01 00:00:00 -- 9999-12-31 23:59:59
(5) TIMESTAMP 格式 YYYY-MM-DD HH:MM:SS 混合日期和时间值，时间戳。 取值范围 1970-01-01 00:00:01 -- 2038-01-19 03:14:07

### SQL通用语法
注释：
单行注释：--注释内容或者 # (#为Mysql特有)


### DDL : Database Defination Language

1. DDL-数据库操作
```sql
-- 查询所有数据库
SHOW DATABASES;

--使用数据库
USE <database>;

--创建数据库
CREATE DATABASE [IF NOT EXISTS] 数据库名 [DEFAULT CHARSET 字符集] [COLLATE 排序规则];

--删除数据库
DROP DATABASE [IF EXISTS] 数据库名;

--查询当前数据库
SELECT DATABASE();
```

2. DDL-表操作
```sql
-- 查询当前数据
SHOW TABLES;

-- 查询表结构
DESC 表名;

-- 查询指定表的建表语句
SHOW CREATE TABLE 表名;

-- 创建表
CREATE TABLE 表名(
  字段 字段类型 [ comment 注释],
  ...  
)[comment 注释];

-- 添加表操作
ALTER TABLE 表名 ADD 字段名 类型(长度) [comment 注释] [约束];

-- 修改数据类型
ALTER TABLE 表名 MODIFY 字段名 新数据类型(长度);

-- 修改字段名和字段类型
ALTER TABLE 表名 CHANGE 旧字段 新字段名 类型(长度) [comment 注释] [约束];

-- 删除字段
ALTER TABLE 表名 DROP 字段名;

-- 修改表名
ALTER TABLE 表名 RENAME TO 新表名;

--删除表
DROP TABLE [IF EXISTS] 表名;

-- 删除该表，重新创建该表---> 注意所有数据全部删除
TRUNCATE TABLE 表名;

```



