package com.online.taxi.dao.mapper;

import com.online.taxi.dao.entity.PassengerUserInfo;
import org.apache.ibatis.annotations.Mapper;
/**
 * 添加了@Mapper注解之后这个接口在编译时会生成相应的实现类
 * 需要注意的是：这个接口中不可以定义同名的方法，因为会生成相同的id
 * 也就是说这个接口是不支持重载的
 *
 * @author oi
 */
@Mapper
public interface PassengerUserInfoCustomMapper extends PassengerUserInfoMapper{

    /**
     * 根据手机号查询乘客信息
     * @param passengerPhone
     * @return
     */
    PassengerUserInfo selectByPhoneNumber(String passengerPhone);


}