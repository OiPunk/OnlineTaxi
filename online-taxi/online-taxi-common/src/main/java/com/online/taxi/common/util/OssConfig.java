package com.online.taxi.util;

import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 功能描述
 *
 * @date 2018/8/20
 */
@Component
@ConfigurationProperties(prefix = "services", ignoreInvalidFields = true)
@Setter
public class OssConfig {
    private List<Map<String, String>> ossconfig = new ArrayList<>();
    private static final String ENDPOINT ="endpoint";
    private static final String ACCESSID ="accessid";
    private static final String ACCESSKEY ="accesskey";
    private static final String BUCKET ="bucketlkmotion";
    private static final String ENDPOINT_UPLOAD ="endpointupload";


    public String get(String key) {
        return ossconfig.stream().filter(m -> m.containsKey(key)).findFirst().orElse(new HashMap<>(0)).get(key);
    }

    public String getEndpoint(){return get(ENDPOINT);}
    public String getAccessid(){return get(ACCESSID);}
    public String getAccesskey(){return get(ACCESSKEY);}
    public String getBucket(){return get(BUCKET);}
    public String getEndpointUpload(){return get(ENDPOINT_UPLOAD);}

}
