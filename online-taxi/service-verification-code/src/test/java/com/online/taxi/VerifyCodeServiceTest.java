package com.online.taxi;

import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.common.dto.verificationcode.VerifyCodeResponse;
import com.online.taxi.controller.VerifyCodeController;
import com.online.taxi.service.VerifyCodeService;
import junit.framework.TestCase;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest
//@Transactional
@Slf4j
public class VerifyCodeServiceTest {

    @Autowired
    VerifyCodeService verifyCodeService;

    String phoneNumber = "13910733521";


    @Test
    public void generate(){
        String msgCode = "";
        ResponseResult generateResult = verifyCodeService.generate(1,phoneNumber);
        int code = generateResult.getCode();
        Assert.assertEquals(1,code);

        if (code == 1){
            VerifyCodeResponse data = (VerifyCodeResponse)generateResult.getData();
            msgCode = data.getCode();
        }

        TestCase.assertEquals(6,msgCode.length());
    }

    @Test
    public void verify(){
        ResponseResult generateResult = verifyCodeService.generate(1,phoneNumber);
        VerifyCodeResponse data = (VerifyCodeResponse)generateResult.getData();
        String msgCode = data.getCode();
        log.info("msgCode:"+msgCode);
        ResponseResult result = verifyCodeService.verify(1,phoneNumber,msgCode);
        int code = result.getCode();

        Assert.assertEquals(1,code);
    }
}
