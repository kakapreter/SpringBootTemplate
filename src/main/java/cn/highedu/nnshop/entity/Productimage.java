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
@TableName("productimage")
public class Productimage implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "img_id", type = IdType.ASSIGN_ID)
    private Integer imgId;

    @TableField("product_id")
    private Integer productId;

    @TableField("url")
    private String url;


}
