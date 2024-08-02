# Mysql 进阶内容

## 储存引擎
MySQL体系结构： 连接层 + 服务层 + 引擎层 + 存储层。
存储引擎就是存储数据、建立索引、更新/查询数据等技术的实现方式。储存引擎是基与表的，而不是基于库的。所有存储引擎也可以被称为表类型。

## InnoDB
InnoDB是一种兼顾高可靠性和高性能的通用存储存储引擎。在MySQL5.5之后，InnoDB是默认的存储引擎。特点如下：
- DML操作遵循ACID模型，支持事务
- 行级锁，提供并发访问性能;
- 支持外键FORERGIN KEY约束，保证数据的完整性和正确性

InnoDB的底层文件存储是IBD文件.例如 XXX.ibd，XXX代表表名。InnoDB引擎每张表都会对应一个表空间文件，存储该表的表结构(frm,sdi)、数据和索引。
- 参数：innodb_file_per_table. 控制是否每张表对应一个IBD文件

Innodb逻辑存储结构：
- TableSpace: 表空间
- Segment： 段
- Extent：区。区的大小是固定的，为 1 M
- Page： 页。页的大小也是固定，为 16 K
- Row：行。

表存储引擎：
```sql
-- 查看储存引擎
SHOW CREATE TABLE 表名;

--创建时，指定存储引擎
CREATE TABLE 表名(.....) ENGINE=指定引擎;

-- 查看当前数据库支持引擎
SHOW ENGINES;

-- 查看Innodb参数.默认是打开的
SHOW VARIABLES LIKE 'innodb_file_per_table';
```

## MyISAM
MYISAM是Mysql早期的默认存储引擎。特点是
- 不支持事务，不支持外键
- 支持表锁，不支持行锁
- 访问速度快

由如下三个文件组成
- .sdi : 存储表结构信息
- .MYD : 存储数据
- .MYI : 存储索引

## Memory
Memory引擎的表数据是存储在内存中。一旦机器关机或者宕机，数据就会丢失。特点
- 内存存放
- hash索引