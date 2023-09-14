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
@TableName("cartitem")
public class Cartitem implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "cartItem_id", type = IdType.AUTO)
    private Integer cartitemId;

    @TableField("cart_id")
    private Integer cartId;

    @TableField("product_id")
    private Integer productId;

    @TableField("product_num")
    private Integer productNum;


}
