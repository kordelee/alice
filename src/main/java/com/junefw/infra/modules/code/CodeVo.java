package com.junefw.infra.modules.code;

import java.io.Serializable;

import com.junefw.infra.common.base.BaseVo;

public class CodeVo extends BaseVo implements Serializable{

	private static final long serialVersionUID = -650521427351122051L;
	
	//	seq (mandotory)
	private String ifcdSeq = "";
	private String ifcgSeq = "";
	
	
	public String getIfcdSeq() {
		return ifcdSeq;
	}
	public void setIfcdSeq(String ifcdSeq) {
		this.ifcdSeq = ifcdSeq;
	}
	public String getIfcgSeq() {
		return ifcgSeq;
	}
	public void setIfcgSeq(String ifcgSeq) {
		this.ifcgSeq = ifcgSeq;
	}
	
	
//	search item extra (optional)
//	----------
	
}
