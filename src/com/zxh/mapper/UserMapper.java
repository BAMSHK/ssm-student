package com.zxh.mapper;
import com.zxh.po.User;
/**
 * @author  ZhaoXiangHeng
 * @2019年6月9日
 * @TODO	通过账户查询用户信息
 */
public interface UserMapper {
	public User findUser(User user);
}
