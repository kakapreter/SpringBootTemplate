package cn.highedu.nnshop.service.impl;

import cn.highedu.nnshop.entity.Order;
import cn.highedu.nnshop.mapper.OrderMapper;
import cn.highedu.nnshop.service.OrderService;
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
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

}
