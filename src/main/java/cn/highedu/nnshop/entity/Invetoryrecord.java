package cn.highedu.nnshop.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author kakapreter
 * @since 2023-09-13
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("invetoryrecord")
public class Invetoryrecord implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "record_id", type = IdType.ASSIGN_ID)
    private Integer recordId;

    @TableField("product_id")
    private Integer productId;

    @TableField("admin_id")
    private Integer adminId;

    @TableField("operate_type")
    private String operateType;

    @TableField("operate_count")
    private Integer operateCount;

    @TableField("operate_time")
    private Date operateTime;


}
