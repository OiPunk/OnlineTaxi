package com.online.taxi.listen.controller;

import com.online.taxi.listen.response.PreGrabResponse;
import com.online.taxi.listen.service.ListenService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author oi
 */
@RestController
@RequestMapping("/listen")
public class ListenController {

    @Autowired
    private ListenService listenService;

    @RequestMapping(value = "/driver/{driverId}",produces = "text/event-stream;charset=utf-8")
    public String getData(@PathVariable("driverId") int driverId){

        System.out.println("Method entered "+Math.random());
        PreGrabResponse preGrabResponse = listenService.listen(driverId);

        return "data:"+ JSONObject.fromObject(preGrabResponse)+"\n\n";
    }
}
