package com.rydr.taxi.controller;

import com.rydr.taxi.common.dto.ResponseResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author oi
 */
@RestController
@RequestMapping("/address")
public class AddressController {

    /**
     * Get address information by passenger ID and address type
     * @param passengerId
     * @param type
     * @return
     */
    @GetMapping("/get-address/{passengerId}/{type}")
    public ResponseResult getAddress(@PathVariable("passengerId") int passengerId,@PathVariable("type") int type){
        // Get passenger address information
        return null;
    }
}
