package com.rydr.taxi.dao;

import com.rydr.taxi.dto.valuation.discount.DiscountCondition;
import com.rydr.taxi.dto.valuation.discount.DiscountPrice;
import com.rydr.taxi.mapper.DynamicDiscountRuleMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * Dynamic pricing DAO
 *
 * @date 2018/8/20
 */
@Repository
@RequiredArgsConstructor
public class DynamicDiscountRuleDao {

    @NonNull
    private DynamicDiscountRuleMapper dynamicDiscountRuleMapper;

    /**
     * Query pricing adjustment information by search conditions
     * @param condition search conditions
     * @return pricing adjustment information
     */
    public DiscountPrice findDiscountByCondition(DiscountCondition condition){
        return dynamicDiscountRuleMapper.findDiscountByCondition(condition);
    }
}
