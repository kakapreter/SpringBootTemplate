package cn.highedu.nnshop.service.impl;

import cn.highedu.nnshop.entity.Cart;
import cn.highedu.nnshop.mapper.CartMapper;
import cn.highedu.nnshop.service.CartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author kakapreter
 * @since 2023-09-13
 */
@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {

}
