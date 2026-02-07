package com.rydr.dao;

import com.rydr.dao.entity.PassengerUserInfo;
import com.rydr.dao.mapper.PassengerUserInfoCustomMapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class PassengerInfoDaoTest {

    @Autowired
    PassengerUserInfoCustomMapper passengerUserInfoCustomMapper ;

//    @Test
//    @Rollback
//    public void selectByPhone(){
//
//        PassengerInfo passengerInfo =  dao.selectByPhoneNumber("1111");
//        System.out.println("Gender: "+passengerInfo.getGender());
//    }


    @Test
    // Do not rollback
//    @Rollback(value = false)
    // Rollback
    @Rollback(value = true)
    public void save(){
        PassengerUserInfo user = new PassengerUserInfo();
        user.setPassengerName("Name");
        user.setCreateTime(new Date());
        user.setPassengerGender((byte)1);
        user.setPassengerPhone("13800000002");
        user.setRegisterDate(new Date());
        user.setUserState((byte)1);
        int i =  passengerUserInfoCustomMapper.insertSelective(user);
        System.out.println("id..."+user.getId());

        PassengerUserInfo passengerUserInfo = passengerUserInfoCustomMapper.selectByPhoneNumber("13800000002");
        System.out.println(passengerUserInfo);
        Assert.assertEquals("Name",passengerUserInfo.getPassengerName());
    }

}
