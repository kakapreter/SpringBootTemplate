
## 优化自增主键（改成无符号）

```sql
ALTER TABLE path_logs MODIFY COLUMN id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT;
DESCRIBE path_logs;
```
