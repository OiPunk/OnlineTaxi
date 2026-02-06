package com.rydr.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Amap order status
 */
@Getter
@AllArgsConstructor
public enum AmapOrderEnum implements CodeEnum{

	NO_ASSIGN(1,"Not dispatched"),
    /**
     * Dispatched
     */
    ASSIGN(2,"Dispatched"),
    /**
     * Billing started
     */
	CHARGE_START(3,"Billing started"),
    /**
     * Order cancelled
     */
	CANCEL_ORDER(4,"Order cancelled"),
    /**
     * Order pending payment
     */
	TO_PAY(5,"Order pending payment"),
    /**
     * Order reviewed
     */
	EVALUATE_DO(6,"Order reviewed"),
    /**
     * Order pending review
     */
	TO_EVALUATE(7,"Order pending review"),
    /**
     * Trip ended
     */
	END_TRAVEL(8,"Trip ended"),
    /**
     * Service started
     */
	START_SERVICE(9,"Service started"),
    /**
     * Cancellation pending payment
     */
	CANCEL_ORDER_TO_PAY(10,"Cancellation pending payment"),

	EC9999(9999, "Other exception");

	private int code;
    private String value;

}
