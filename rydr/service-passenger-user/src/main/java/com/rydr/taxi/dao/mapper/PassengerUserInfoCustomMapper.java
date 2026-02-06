package com.rydr.taxi.dao.mapper;

import com.rydr.taxi.dao.entity.PassengerUserInfo;
import org.apache.ibatis.annotations.Mapper;
/**
 * After adding the @Mapper annotation, this interface will generate the corresponding implementation class at compile time.
 * Note: methods with the same name cannot be defined in this interface, as they would generate the same id.
 * In other words, this interface does not support overloading.
 *
 * @author oi
 */
@Mapper
public interface PassengerUserInfoCustomMapper extends PassengerUserInfoMapper{

    /**
     * Query passenger info by phone number
     * @param passengerPhone
     * @return
     */
    PassengerUserInfo selectByPhoneNumber(String passengerPhone);


}
