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


-- 查看数据库默认字符集
SHOW VARIABLES LIKE 'character%';
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

## 函数

1. 字符串函数
- CONCAT(s1,s2,...) ：字符串拼接
- LOWER(str)： 将字符串全部转为小写
- UPPER(str)： 将字符串全部转为大写
- LPAD(str, n, pad)： 左填充，用字符串pad对str的左边进行填充，达到n个字符串长度
- RPAD(str, n, pad)： 右填充，用字符串pad对str的右边进行填充，达到n个字符串长度
- TRIM(str)：去掉字符串头部和尾部的空格
- SUBSTRING(str, start, len)： 返回从字符串str从start位置起的len个长度的字符串


2. 数值函数
- CEIL(x)：向上取整
- FLOOR(x)：向下取整
- MOD(x,y)：返回x/y 的模
- RAND(x)： 返回0~1内的随机数
- ROUND(x,y)：求参数x四舍五入的值，保留y位小数 

3. 日期函数
- CURDATE()： 返回当前日期
- CURTIME()： 返回当前时间
- NOW()：返回当前日期和时间
- YEAR(date)： 得到指定date的 年份
- MONTH(date)：得到指定date的 月份
- DAY(date)：得到指定date的 day
- DATE_ADD(date, INTERVAL expr type)： 返回一个日期/时间值加上一个时间间隔expr后的时间值
- DATEDIFF(date1, date2)： 返回起始时间date1和结束时间date2之前的**天数**

4. 流程控制函数
- IF(value, t, f) ：如果value为true，则返回t,否则返回f
- IFNULL(value1, value2) ：如何value1不为空，返回value1，否则返回value2
- CASE WHEN [val1] THEN [res1]...ELSE [default] END ：如果val1 为true,返回res1，否则返回else default默认值
- CASE [expr] WHEN [val1] THEN [res1]...ELSE [default] END ：如果expr == val1,返回res1，否则返回else default默认值

6. 聚合函数 : 将一列数据作为一个整体，进行纵向计算. null 值不参与聚合函数计算  
- count(): 统计数量  
- max(): 最大值  
- min(): 最小值  
- avg(): 平均值  
- sum(): 求和 


## 约束 Constrsaint
约束是作用表中字段上的规则，用于限制存储在表中的数据。用于保证数据库中数据的正确、有效性和完整性。

1. 常见约束
- NOT NULL: 非空约束
- UNIQUE：唯一约束
- PRIMARY KEY： 主键约束
- DEFAULT：默认约束。保存数据时，如果未指定该字段的值，则采用默认值
- CHECK：检查约束，保证字段值满足某一个条件
- FOREIGN KEY：外键约束。用来让两张表直接的数据之间建立连接，保证数据的一致性和完整性。 删除以及更新外键，会有如下行为
  + No action: 在父表删除/更新记录时，应首先检查是否有对应外键。有则不允许修改
  + RESTRICT： 在父表删除/更新记录时，应首先检查是否有对应外键。有则不允许修改
  + CASCADE：在父表删除/更新记录时，应首先检查是否有对应外键。有则删除/更新对应子表中的记录
  + Set NUll：在父表删除/更新记录时，应首先检查是否有对应外键。有则将对应子表字段设置为空。(不能给外键字段添加 Not null约束)
  + Set Default: 在父表删除/更新记录时，应首先检查是否有对应外键。有则将对应字段设置成一个默认值。 Innodb不支持

```sql
--创建表时添加外键
CREATE TABLE 表名(
  字段名 数据类型,
  [CONSTRAINT] [外键名称] FOREIGN KEY(外键字段) REFERENCES 主表名(关联字段)
);

-- 添加外键
ALTER table 表名 add constraint 外键名称 foreign key (外键字段) referenceS 主表名(关联字段);

-- 删除外键
ALTER TABLE 表名 DROP FOREIGN KEY 外键名称;

-- 给外键设置删除更新行为
ALTER table 表名 add constraint 外键名称 foreign key (外键字段) referenceS 主表名(关联字段) ON UPDATE 行为 ON DELETE 行为;

```

## 多表查询
1. 表与表之间的关系
  - 1对多： 以1为主表，多表为子表，使用外键关联主表
  - 多对多： 建立第三张中间表，中间表至少包含两个外键，分别关联两方主键
  - 1对1 ： 多用于单表拆分，将一张表拆分成两种表，以提升操作效率。可以以任意一表为子表，并设置外键，增加UNIQUE约束

2. 多表查询
  - 连接查询：
    + 内连接：相当与查询A， B交集部分数据
    + 外连接：左外连接-查询左边所有数据，包括交集部分；右外连接-查询右边所有数据，包括交集部分。
    + 自连接：当前表与自身的连接查询，自连接必须使用表别名

  - 联合查询。将多次查询的结果合并起来，形成一个新的查询结果集。要求不同表的字段类型相同，数量一致。

  - 子查询 ： SQL语句中嵌套SELECT语句。又称嵌套查询
    + 标量子查询： 子查询返回的结果是单个值
    + 列子查询： 子查询返回的结果是一列 (可以是多行)。
    + 行子查询： 行子查询返回的结果是一行
    + 表子查询：子查询返回的结果是多行多列

```sql
--左外连接语法
SELECT 字段 FROM 左表 LEFT [OUTER] JOIN 右表 ON 连接条件;

-- 右外连接语法
SELECT 字段 FROM 右表 RIGHT [OUTER] JOIN 左表 ON 连接条件;

-- 自连接查询
SELECT 字段 FROM 表A 别名A JOIN 表A 别名B ON 条件;

-- 联合查询. without 'ALL'， 会去重
SELECT 字段列表 FROM 表A...
UNION [ALL]
SELECT 字段列表 FROM 表B;

-- 嵌套查询
SELECT 字段 FROM 表A WHERE 列= (SELECT 列 FROM 表B);

```


## 事务：
事务是一组操作的集合。他是一个不可分割的工作单位，事务会把所有的操作作为一个整体一起向系统提交或撤销操作。也就是说这些组合在一起的操作要么一起成功，要么一起失败。

1. 事务的四大特性-ACID
- 原子性 Atomicity: 事务是不可分割的最小操作单元
- 一致性 Consistency：事务完成时，必须所有的数据都保持一致状态
- 隔离性 Isolation：数据库系统提供的隔离机制。保证事务在不受外部并发操作影响的独立环境下运行
- 持久性 Durability： 事务一旦提交或回滚，它对数据库中的数据的改变是永久的


2. 并发事务问题
- 脏读：一个事务读到另一个事务还没有提交的数据
- 不可重复读：一个事务先后读到同一条记录，但两次读取的数据不同。
- 幻读：一个事务按照条件查询数据时，没有对应的数据行，但是在插入数据时，又发现这行数据已经存在

3. 事务的隔离级别---用来解决并发事务问题
- Read uncommitted ： 三种并发事务问题都有可能出现
- Read committed  (Oracle 默认)： 可能出现 不可重复读 + 幻读
- Repeatable Read (Mysql默认)： 可能出现 幻读
- Serializable: 在这种隔离级别下，没有并发事务问题。但性能也是最差的


```sql
--查看/设置事务提交方式。默认值1表示自动提交事务
SELECT @@autocommit;

-- 设置手动提交事务
SET @@autocommit=0;
 
-- 提交事务
COMMIT

--回滚事务
ROLLBACK;

---------------方式二：提交事务
START TRANSACTION 或者 BEGIN;

-- 提交事务和回滚事务是一样的
COMMIT;
ROLLBACK;


-----------------查看事务隔离级别
SELECT @@TRANSACTION_ISOLATION;
--设置事务隔离级别
SET [SESSION | GLOBAL] TRANSACTION ISOLATION LEVEL [READ UNCOMMITTED | READ COMMITTED | REPEATABLT READ | SERIALIZABLE]

```

