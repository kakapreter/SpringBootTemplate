package cn.highedu.nnshop.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
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
@TableName("admin")
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "admin_id", type = IdType.ASSIGN_ID)
    private Integer adminId;

    @TableField("name")
    private String name;

    @TableField("pwd")
    private String pwd;

    @TableField("email")
    private String email;

    @TableField("phone")
    private String phone;


}
