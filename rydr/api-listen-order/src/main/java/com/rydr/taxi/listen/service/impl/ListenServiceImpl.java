package com.rydr.taxi.listen.service.impl;

import com.rydr.taxi.common.constant.RedisKeyConstant;
import com.rydr.taxi.listen.response.PreGrabResponse;
import com.rydr.taxi.listen.service.ListenService;


import java.util.Random;

/**
 * @author oi
 */
@Service
public class ListenServiceImpl implements ListenService {

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Override
    public PreGrabResponse listen(int driverId) {
//        String key = RedisKeyConstant.DRIVER_LISTEN_ORDER_PRE + driverId;
//        String orderId = redisTemplate.opsForValue().get(key);
//        redisTemplate.delete(key);
        PreGrabResponse preGrabResponse = new PreGrabResponse();
//        try {
//            if (StringUtils.isNotBlank(orderId)){
                preGrabResponse.setEndAddress("Destination"+new Random().nextInt());
                preGrabResponse.setStartAddress("Origin"+new Random().nextInt());
//                preGrabResponse.setOrderId(Integer.parseInt(orderId));
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }finally {
            return preGrabResponse;
//        }


    }
}
