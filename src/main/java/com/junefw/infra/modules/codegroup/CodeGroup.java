package com.junefw.infra.modules.codegroup;

import java.util.ArrayList;
import java.util.List;

import com.junefw.infra.common.base.Base;

public class CodeGroup extends Base {
	
	private String ifcgSeq;
	private String ifcgSeqAnother;
	private String ifcgName;
	private String ifcgNameEng;
	private Integer ifcgUseNy;
	private Integer ifcgOrder;
	private String ifcgReferenceV1;
	private String ifcgReferenceV2;
	private String ifcgReferenceV3;
	private Integer ifcgReferenceI1;
	private Integer ifcgReferenceI2;
	private Integer ifcgReferenceI3;
	private String ifcgDesc;
	private Integer ifcgDelNy;
//	----------

//	for cache
	public static List<CodeGroup> cachedCodeArrayList = new ArrayList<CodeGroup>();
	
	public String getIfcgSeq() {
		return ifcgSeq;
	}
	public void setIfcgSeq(String ifcgSeq) {
		this.ifcgSeq = ifcgSeq;
	}
	public String getIfcgSeqAnother() {
		return ifcgSeqAnother;
	}
	public void setIfcgSeqAnother(String ifcgSeqAnother) {
		this.ifcgSeqAnother = ifcgSeqAnother;
	}
	public String getIfcgName() {
		return ifcgName;
	}
	public void setIfcgName(String ifcgName) {
		this.ifcgName = ifcgName;
	}
	public String getIfcgNameEng() {
		return ifcgNameEng;
	}
	public void setIfcgNameEng(String ifcgNameEng) {
		this.ifcgNameEng = ifcgNameEng;
	}
	public Integer getIfcgUseNy() {
		return ifcgUseNy;
	}
	public void setIfcgUseNy(Integer ifcgUseNy) {
		this.ifcgUseNy = ifcgUseNy;
	}
	public Integer getIfcgOrder() {
		return ifcgOrder;
	}
	public void setIfcgOrder(Integer ifcgOrder) {
		this.ifcgOrder = ifcgOrder;
	}
	public String getIfcgReferenceV1() {
		return ifcgReferenceV1;
	}
	public void setIfcgReferenceV1(String ifcgReferenceV1) {
		this.ifcgReferenceV1 = ifcgReferenceV1;
	}
	public String getIfcgReferenceV2() {
		return ifcgReferenceV2;
	}
	public void setIfcgReferenceV2(String ifcgReferenceV2) {
		this.ifcgReferenceV2 = ifcgReferenceV2;
	}
	public String getIfcgReferenceV3() {
		return ifcgReferenceV3;
	}
	public void setIfcgReferenceV3(String ifcgReferenceV3) {
		this.ifcgReferenceV3 = ifcgReferenceV3;
	}
	public Integer getIfcgReferenceI1() {
		return ifcgReferenceI1;
	}
	public void setIfcgReferenceI1(Integer ifcgReferenceI1) {
		this.ifcgReferenceI1 = ifcgReferenceI1;
	}
	public Integer getIfcgReferenceI2() {
		return ifcgReferenceI2;
	}
	public void setIfcgReferenceI2(Integer ifcgReferenceI2) {
		this.ifcgReferenceI2 = ifcgReferenceI2;
	}
	public Integer getIfcgReferenceI3() {
		return ifcgReferenceI3;
	}
	public void setIfcgReferenceI3(Integer ifcgReferenceI3) {
		this.ifcgReferenceI3 = ifcgReferenceI3;
	}
	public String getIfcgDesc() {
		return ifcgDesc;
	}
	public void setIfcgDesc(String ifcgDesc) {
		this.ifcgDesc = ifcgDesc;
	}
	public Integer getIfcgDelNy() {
		return ifcgDelNy;
	}
	public void setIfcgDelNy(Integer ifcgDelNy) {
		this.ifcgDelNy = ifcgDelNy;
	}



	

	
	
}