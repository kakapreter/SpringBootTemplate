package cn.highedu.nnshop.service.impl;

import cn.highedu.nnshop.entity.Product;
import cn.highedu.nnshop.mapper.ProductMapper;
import cn.highedu.nnshop.service.ProductService;
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
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

}
