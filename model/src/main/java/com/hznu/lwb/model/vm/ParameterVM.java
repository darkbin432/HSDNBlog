package com.hznu.lwb.model.vm;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 键值对
 * 
 * @author qianxuefeng
 * @date 2016年3月6日
 * @copyright: copyright @ hznuTech 2016
 */
public class ParameterVM implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Object name;
	private Object value;

	public ParameterVM() {
	}

	public ParameterVM(Object value, Object name) {
		this.value = value;
		this.name = name;
	}

	public Object getName() {
		return name;
	}

	public void setName(Object name) {
		if(name != null && name instanceof BigDecimal){
			this.name = ((BigDecimal)name).intValue();
			return;
		}
		this.name = name;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

}
