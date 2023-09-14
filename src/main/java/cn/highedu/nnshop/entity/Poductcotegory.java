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
@TableName("poductcotegory")
public class Poductcotegory implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "cotegory_id", type = IdType.ASSIGN_ID)
    private Integer cotegoryId;

    @TableField("cotegory_name")
    private String cotegoryName;


}
