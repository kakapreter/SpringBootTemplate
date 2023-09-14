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
@TableName("orderitem")
public class Orderitem implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "orderItem_id", type = IdType.AUTO)
    private Integer orderitemId;

    @TableField("order_id")
    private Integer orderId;

    @TableField("product_id")
    private Integer productId;

    @TableField("product_num")
    private Integer productNum;


}
