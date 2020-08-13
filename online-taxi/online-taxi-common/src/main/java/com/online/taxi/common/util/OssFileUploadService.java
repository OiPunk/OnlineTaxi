package com.online.taxi.util;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.online.taxi.dto.phone.response.OssBaseResponse;

import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;
import org.springframework.util.DigestUtils;

import java.io.*;

/**
 * OSS文件上传
 * @date 2018/8/20
 */
@Service
public class OssFileUploadService {

    @Autowired
    private OssConfig ossConfig;

    public OssBaseResponse upload(String input, String folder){
        OssBaseResponse response = new OssBaseResponse();
        String fileUrl = "";

        ByteArrayInputStream byteArrayInput = null;
        OSSClient client = null;
        try{
            // 文件为空错误
            if (null == input){
                response.setStatus(1);
                return response;
            }
            byte[] decodeInput = Base64Utils.decodeFromString(input);
            String imgType = "";
            int length = decodeInput.length;
            if (length == 0){
                response.setStatus(1);
                return response;
            }
            try{
                imgType = getImageType(decodeInput);
            }catch (IOException e){
            }

            if (StringUtils.isEmpty(imgType)){
                response.setStatus(2);
                return response;
            }

            client = new OSSClient(ossConfig.getEndpoint(), ossConfig.getAccessid(), ossConfig.getAccesskey());
            String prefix = DigestUtils.md5DigestAsHex(decodeInput);
            String key = (folder == null ? "" : (folder + "/")) + prefix + imgType;
            // 判断文件是否存在，文件存在直接返回文件URL
            if (client.doesObjectExist(ossConfig.getBucket(), key)){
                fileUrl = ossConfig.getEndpointUpload() + "/" + key;
            }else {
                ObjectMetadata metadata = new ObjectMetadata();
                metadata.setContentLength(length);
                metadata.setContentType(StringUtils.replace("image/{imgType}", "{imgType}", imgType.substring(1, imgType.length())));

                byteArrayInput = new ByteArrayInputStream(decodeInput);
                client.putObject(ossConfig.getBucket(), key, byteArrayInput, metadata);

                JSONObject jsonObject = new JSONObject();
                jsonObject.put("result", 0);
                jsonObject.put("key", key);
                jsonObject.put("url", ossConfig.getEndpointUpload() + "/" + key);

                fileUrl = ossConfig.getEndpointUpload() + "/" + key;
            }

            response.setFileUrl(fileUrl);
            return response;
        } finally {
            if (null != byteArrayInput) {
                try{
                    byteArrayInput.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
            if(null!=client) {
                client.shutdown();
            }

        }
    }
    private static String getImageType(byte[] b) throws IOException{
        String type = bytesToHexString(b).toUpperCase();
        if (type.contains(ImageType.jpg.getCode())) {
            return ImageType.jpg.getType();
        }else if (type.contains(ImageType.png.getCode())) {
            return ImageType.png.getType();
        }else if (type.contains(ImageType.bmp.getCode())){
            return ImageType.bmp.getType();
        }
        return null;
    }

    public static String bytesToHexString(byte[] src){
        StringBuilder stringBuilder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++)
        {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2){
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }

    /**
     * @Descriptionmap 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
     * @author temdy
     * @Date 2015-01-26
     * @param path 图片路径
     * @return
     */
    public static String imageToBase64(String path) {
        byte[] data = null;
        // 读取图片字节数组
        try {
            InputStream in = new FileInputStream(path);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return java.util.Base64.getEncoder().encodeToString(data);
    }

    /**
     * @Descriptionmap 对字节数组字符串进行Base64解码并生成图片
     * @author temdy
     * @Date 2015-01-26
     * @param base64 图片Base64数据
     * @param path 图片路径
     * @return
     */
    public static boolean base64ToImage(String base64, String path) {
        if (base64 == null){
            return false;
        }
        try {
            byte[] bytes = java.util.Base64.getDecoder().decode(base64);
            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] < 0) {
                    bytes[i] += 256;
                }
            }
            // 生成jpeg图片
            OutputStream out = new FileOutputStream(path);
            out.write(bytes);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * @param targetFile   需要上传OSS文件服务器上生成的目标文件路径
     * @param fileNamePath 当前生成文件路径
     * @param filename     当前生成文件全名
     */
    public OssBaseResponse uploadFileToOss(String targetFile, File fileNamePath, String filename) {
        OssBaseResponse response = new OssBaseResponse();
        OSSClient ossClient = new OSSClient(ossConfig.getEndpoint(),ossConfig.getAccessid(), ossConfig.getAccesskey());
        boolean exists = ossClient.doesBucketExist(ossConfig.getBucket());
        if (!exists) {
            response.setStatus(1);
        } else {
            response.setStatus(0);
            if (fileNamePath.exists()) {
                boolean found = ossClient.doesObjectExist(ossConfig.getBucket(), targetFile);
                if (found) {
                    ossClient.deleteObject(ossConfig.getBucket(), targetFile);
                }
                ossClient.putObject(ossConfig.getBucket(), targetFile, fileNamePath);
                ossClient.shutdown();
                String fileUrl = ossConfig.getEndpointUpload() + "/" + targetFile;
                response.setFileUrl(fileUrl);
            }
        }
        return response;
    }
}
