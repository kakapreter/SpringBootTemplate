
## 优化自增主键（改成无符号,数值位数更多）
```sql
# 更改主键
ALTER TABLE path_logs MODIFY COLUMN id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT;

# 查看表结构
DESCRIBE path_logs;
```

## 删除某条数据后新增的数据id不连续

```sql
# 设置id为0
set @auto_id = 0;

# UPDATE 表名 set id = (@auto_id := @auto_id +1);
UPDATE nna_admin set id = (@auto_id := @auto_id +1);

# ALTER TABLE 表名 AUTO_INCREMENT = 1;
ALTER TABLE nna_admin AUTO_INCREMENT = 1;

```
