package cn.highedu.nnshop.service.impl;

import cn.highedu.nnshop.entity.User;
import cn.highedu.nnshop.mapper.UserMapper;
import cn.highedu.nnshop.service.UserService;
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
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
