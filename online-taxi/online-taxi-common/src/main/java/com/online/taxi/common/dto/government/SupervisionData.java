package com.online.taxi.dto.government;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.experimental.Accessors;

import java.io.Serializable;

import com.online.taxi.constatnt.CodeEnum;

/**
 * 上报对象DTO
 *
 * @date 2018/8/23
 */
@Data
@Accessors(chain = true)
public class SupervisionData<T> implements Serializable {

    @Getter
    @AllArgsConstructor
    public enum OperationType implements CodeEnum {
        /**
         * 插入操作
         */
        INSERT(0, "insert"),
        /**
         * 更新操作
         */
        UPDATE(1, "update"),
        /**
         * 删除操作
         */
        DELETE(2, "delete");

        private int code;
        private String name;
    }

    private OperationType operationType;
    private String className;
    private Integer id;
}
