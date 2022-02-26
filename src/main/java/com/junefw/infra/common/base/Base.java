package com.junefw.infra.common.base;

import java.sql.Date;

public class Base {

	private String regIp = "";
	private String regSeq = "";
	private Integer regDeviceCd  = 0;
	private Date regDateTime;
	private Date regDateTimeSvr;
	private String modIp = "";
	private String modSeq = "";
	private Integer modDeviceCd = 0;
	private Date modDateTime;
	private Date modDateTimeSvr;
	// ----------
	public String getRegIp() {
		return regIp;
	}
	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}
	public String getRegSeq() {
		return regSeq;
	}
	public void setRegSeq(String regSeq) {
		this.regSeq = regSeq;
	}
	public Integer getRegDeviceCd() {
		return regDeviceCd;
	}
	public void setRegDeviceCd(Integer regDeviceCd) {
		this.regDeviceCd = regDeviceCd;
	}
	public Date getRegDateTime() {
		return regDateTime;
	}
	public void setRegDateTime(Date regDateTime) {
		this.regDateTime = regDateTime;
	}
	public Date getRegDateTimeSvr() {
		return regDateTimeSvr;
	}
	public void setRegDateTimeSvr(Date regDateTimeSvr) {
		this.regDateTimeSvr = regDateTimeSvr;
	}
	public String getModIp() {
		return modIp;
	}
	public void setModIp(String modIp) {
		this.modIp = modIp;
	}
	public String getModSeq() {
		return modSeq;
	}
	public void setModSeq(String modSeq) {
		this.modSeq = modSeq;
	}
	public Integer getModDeviceCd() {
		return modDeviceCd;
	}
	public void setModDeviceCd(Integer modDeviceCd) {
		this.modDeviceCd = modDeviceCd;
	}
	public Date getModDateTime() {
		return modDateTime;
	}
	public void setModDateTime(Date modDateTime) {
		this.modDateTime = modDateTime;
	}
	public Date getModDateTimeSvr() {
		return modDateTimeSvr;
	}
	public void setModDateTimeSvr(Date modDateTimeSvr) {
		this.modDateTimeSvr = modDateTimeSvr;
	}

}
