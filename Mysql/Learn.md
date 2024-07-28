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

## SQL通用语法
注释：
单行注释：--注释内容或者 # (#为Mysql特有)


## DDL : Database Defination Language
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


## DML: Data Manipulation Language
1. Insert
```sql
--给指定字段插入数据
INSERT INTO 表名(字段1，字段2,...) VALUES(值1,值2,...);

--给全部字段添加数据
INSERT INTO 表名 VALUES(值1,值2,...);
```

2. Update
```sql
UPDATE 表名 SET 字段1 = 值1,字段2 = 值2,.... [WHERE 条件];
```

3. Delete
```sql
-- 如果没有条件，则删除全部数据
DELETE FROM 表名 [WHERE 条件];
```

## DQL：Data Query Language
DQL语句执行顺序：FROM ---> wHERE ---> GROUP BY ---> SELECT ---> ORDER BY ---> LIMIT
```sql
SELECT [DISTINCT(去除重复)] [聚合函数] 字段列表 [AS 字段别名] FROM 表名列表 WHERE 条件列表 GROUP BY 分组字段列表 HAVING 分组后条件列表 ORDER BY 排序字段列表 LIMIT 分页参数
```  
  
1. 条件-这里只列出几个特殊的   
(1) BETWEEN...AND... 
在某个范围内。注意Between 后面接较小值， AND后面接较大值    
(2)IN(...)  
在in列表中的值，多选1  
(3) LIKE 占位符  
模糊匹配。_匹配单个字符， %匹配多个字符  
(4) IS NULL 和 IS NOT NULL  
为空字段  
(5) != 和 <> 都表达了不等于  

2. 聚合函数 : 将一列数据作为一个整体，进行纵向计算. null 值不参与聚合函数计算  
(1) count(): 统计数量  
(2) max(): 最大值  
(3) min(): 最小值  
(4) avg(): 平均值  
(5) sum(): 求和  

3. 分组查询  
Where 和 Having的区别：  
(1)判断时机不同: where是分组之前进行过滤， having是对分组之后的结果进行过滤  
(2)判断条件不同: where不能对聚合函数进行判断，而having可以  


4. 排序查询  
ORDER BY 字段1 排序方式  
排序方式：  
(1) ASC : 升序，默认值  
(2) DESC : 降序  

5. 分页查询  
LIMIT 起始索引，每页记录数  
注意：  
(1) 起始索引从0开始。起始索引 = （查询页码 - 1）* 每页显示记录数  
(2) 分页查询是数据库的方言，不同的数据库有不同的实现  
(3) 如何查询的是第一页数据。起始索引可以省略。因为0*任何数都登录0  


## DCL: Data Control Language  
数据控制语言，用来管理数据用户、控制数据库的访问，权限。  
```sql
-- 查询用户
USE mysql;
SELECT * FROM user;

-- 创建用户。如何该用户被允许从所有主机访问，该'主机名' = '%'
CREATE USER '用户名'@'主机名' IDENTIFIED BY '密码';

-- 修改用户密码
ALTER USER '用户名'@'主机名' IDENTIFIED WITH '老密码' BY '新密码';

-- 删除用户
DROP USER '用户名'@'主机名';
```

1. DCL权限控制。主要的DCL的权限 
(1) ALL, ALL PREVILEGES ：所有权限  
(2) SELECT ：查询数据  
(3) INSERT ：插入数据  
(4) UPDATE ：修改数据  
(5) DELETE ：删除数据  
(6) ALTER ：修改表  
(7) DROP ：删除数据库/表/视图  
(8) CREATE ：创建数据库/表 

```sql
--查询权限
SHOW GRANTS FOR '用户名'@'主机名';

--授予权限
GRANT 权限列表 ON 数据库名.表名 TO '用户名'@'主机名';

-- 撤销权限
REVOKE 权限列表 ON 数据库名.表名 FROM '用户名'@'主机名';

```