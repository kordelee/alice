package com.junefw.infra.modules.member;

import java.util.Date;

import com.junefw.infra.common.base.Base;

@SuppressWarnings("all")
public class Member extends Base{
	
//	infrMember
	private String ifmmSeq;
	private Integer ifmmAdminNy;
	private Integer ifmmDormancyNy;
	private String ifmmName;
	private String ifmmNameEng;
	private String ifmmLastName;
	private String ifmmFirstName;
	private String ifmmLastNameEng;
	private String ifmmFirstNameEng;
	private String ifmmId;
	private String ifmmPassword;
	private Date ifmmPwdModDate;
	private String ifmmNickname;
	private Integer ifmmGenderCd;
	private String ifmmDob;
	private Integer ifmmSavedCd;
	private Integer ifmmMarriageCd;
	private String ifmmMarriageDate;
	private Integer ifmmChildrenNum;
	private String ifmmFavoriteColor;
	private String ifmmRecommenderSeq;
	private Integer ifmmEmailConsentNy;
	private Integer ifmmSmsConsentNy;
	private Integer ifmmPushConsentNy;
	private String ifmmDesc;
	private Integer ifmmDelNy;

	
//	infrMemberEmail
	private String ifmeSeq;
	private String ifmeDefaultNy;
	private String ifmeTypeCd;
	private String ifmeEmailFull;
	private String ifmeEmailAccount;
	private String ifmeEmailDomain;
	private String ifmeEmailDomainCd;
	private String ifmeDelNy;
//	private String ifmmSeq;
	
	
//	infrMemberPhone
	private String ifmpSeq;
	private String[] ifmpSeqArr;
	private Integer[] ifmpDefaultNy;
	private Integer[] ifmpTypeCd;
	private Integer[] ifmpDeviceCd;
	private Integer[] ifmpTelecomCd;
	private String[] ifmpNumber;
	private Integer[] ifmpDelNy;
//	private String ifmmSeq;
//	----------
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public Integer getIfmmAdminNy() {
		return ifmmAdminNy;
	}
	public void setIfmmAdminNy(Integer ifmmAdminNy) {
		this.ifmmAdminNy = ifmmAdminNy;
	}
	public Integer getIfmmDormancyNy() {
		return ifmmDormancyNy;
	}
	public void setIfmmDormancyNy(Integer ifmmDormancyNy) {
		this.ifmmDormancyNy = ifmmDormancyNy;
	}
	public String getIfmmName() {
		return ifmmName;
	}
	public void setIfmmName(String ifmmName) {
		this.ifmmName = ifmmName;
	}
	public String getIfmmNameEng() {
		return ifmmNameEng;
	}
	public void setIfmmNameEng(String ifmmNameEng) {
		this.ifmmNameEng = ifmmNameEng;
	}
	public String getIfmmLastName() {
		return ifmmLastName;
	}
	public void setIfmmLastName(String ifmmLastName) {
		this.ifmmLastName = ifmmLastName;
	}
	public String getIfmmFirstName() {
		return ifmmFirstName;
	}
	public void setIfmmFirstName(String ifmmFirstName) {
		this.ifmmFirstName = ifmmFirstName;
	}
	public String getIfmmLastNameEng() {
		return ifmmLastNameEng;
	}
	public void setIfmmLastNameEng(String ifmmLastNameEng) {
		this.ifmmLastNameEng = ifmmLastNameEng;
	}
	public String getIfmmFirstNameEng() {
		return ifmmFirstNameEng;
	}
	public void setIfmmFirstNameEng(String ifmmFirstNameEng) {
		this.ifmmFirstNameEng = ifmmFirstNameEng;
	}
	public String getIfmmId() {
		return ifmmId;
	}
	public void setIfmmId(String ifmmId) {
		this.ifmmId = ifmmId;
	}
	public String getIfmmPassword() {
		return ifmmPassword;
	}
	public void setIfmmPassword(String ifmmPassword) {
		this.ifmmPassword = ifmmPassword;
	}
	public Date getIfmmPwdModDate() {
		return ifmmPwdModDate;
	}
	public void setIfmmPwdModDate(Date ifmmPwdModDate) {
		this.ifmmPwdModDate = ifmmPwdModDate;
	}
	public String getIfmmNickname() {
		return ifmmNickname;
	}
	public void setIfmmNickname(String ifmmNickname) {
		this.ifmmNickname = ifmmNickname;
	}
	public Integer getIfmmGenderCd() {
		return ifmmGenderCd;
	}
	public void setIfmmGenderCd(Integer ifmmGenderCd) {
		this.ifmmGenderCd = ifmmGenderCd;
	}
	public String getIfmmDob() {
		return ifmmDob;
	}
	public void setIfmmDob(String ifmmDob) {
		this.ifmmDob = ifmmDob;
	}
	public Integer getIfmmSavedCd() {
		return ifmmSavedCd;
	}
	public void setIfmmSavedCd(Integer ifmmSavedCd) {
		this.ifmmSavedCd = ifmmSavedCd;
	}
	public Integer getIfmmMarriageCd() {
		return ifmmMarriageCd;
	}
	public void setIfmmMarriageCd(Integer ifmmMarriageCd) {
		this.ifmmMarriageCd = ifmmMarriageCd;
	}
	public String getIfmmMarriageDate() {
		return ifmmMarriageDate;
	}
	public void setIfmmMarriageDate(String ifmmMarriageDate) {
		this.ifmmMarriageDate = ifmmMarriageDate;
	}
	public Integer getIfmmChildrenNum() {
		return ifmmChildrenNum;
	}
	public void setIfmmChildrenNum(Integer ifmmChildrenNum) {
		this.ifmmChildrenNum = ifmmChildrenNum;
	}
	public String getIfmmFavoriteColor() {
		return ifmmFavoriteColor;
	}
	public void setIfmmFavoriteColor(String ifmmFavoriteColor) {
		this.ifmmFavoriteColor = ifmmFavoriteColor;
	}
	public String getIfmmRecommenderSeq() {
		return ifmmRecommenderSeq;
	}
	public void setIfmmRecommenderSeq(String ifmmRecommenderSeq) {
		this.ifmmRecommenderSeq = ifmmRecommenderSeq;
	}
	public Integer getIfmmEmailConsentNy() {
		return ifmmEmailConsentNy;
	}
	public void setIfmmEmailConsentNy(Integer ifmmEmailConsentNy) {
		this.ifmmEmailConsentNy = ifmmEmailConsentNy;
	}
	public Integer getIfmmSmsConsentNy() {
		return ifmmSmsConsentNy;
	}
	public void setIfmmSmsConsentNy(Integer ifmmSmsConsentNy) {
		this.ifmmSmsConsentNy = ifmmSmsConsentNy;
	}
	public Integer getIfmmPushConsentNy() {
		return ifmmPushConsentNy;
	}
	public void setIfmmPushConsentNy(Integer ifmmPushConsentNy) {
		this.ifmmPushConsentNy = ifmmPushConsentNy;
	}
	public String getIfmmDesc() {
		return ifmmDesc;
	}
	public void setIfmmDesc(String ifmmDesc) {
		this.ifmmDesc = ifmmDesc;
	}
	public Integer getIfmmDelNy() {
		return ifmmDelNy;
	}
	public void setIfmmDelNy(Integer ifmmDelNy) {
		this.ifmmDelNy = ifmmDelNy;
	}
	public String getIfmeSeq() {
		return ifmeSeq;
	}
	public void setIfmeSeq(String ifmeSeq) {
		this.ifmeSeq = ifmeSeq;
	}
	public String getIfmeDefaultNy() {
		return ifmeDefaultNy;
	}
	public void setIfmeDefaultNy(String ifmeDefaultNy) {
		this.ifmeDefaultNy = ifmeDefaultNy;
	}
	public String getIfmeTypeCd() {
		return ifmeTypeCd;
	}
	public void setIfmeTypeCd(String ifmeTypeCd) {
		this.ifmeTypeCd = ifmeTypeCd;
	}
	public String getIfmeEmailFull() {
		return ifmeEmailFull;
	}
	public void setIfmeEmailFull(String ifmeEmailFull) {
		this.ifmeEmailFull = ifmeEmailFull;
	}
	public String getIfmeEmailAccount() {
		return ifmeEmailAccount;
	}
	public void setIfmeEmailAccount(String ifmeEmailAccount) {
		this.ifmeEmailAccount = ifmeEmailAccount;
	}
	public String getIfmeEmailDomain() {
		return ifmeEmailDomain;
	}
	public void setIfmeEmailDomain(String ifmeEmailDomain) {
		this.ifmeEmailDomain = ifmeEmailDomain;
	}
	public String getIfmeEmailDomainCd() {
		return ifmeEmailDomainCd;
	}
	public void setIfmeEmailDomainCd(String ifmeEmailDomainCd) {
		this.ifmeEmailDomainCd = ifmeEmailDomainCd;
	}
	public String getIfmeDelNy() {
		return ifmeDelNy;
	}
	public void setIfmeDelNy(String ifmeDelNy) {
		this.ifmeDelNy = ifmeDelNy;
	}
	public String getIfmpSeq() {
		return ifmpSeq;
	}
	public void setIfmpSeq(String ifmpSeq) {
		this.ifmpSeq = ifmpSeq;
	}
	public String[] getIfmpSeqArr() {
		return ifmpSeqArr;
	}
	public void setIfmpSeqArr(String[] ifmpSeqArr) {
		this.ifmpSeqArr = ifmpSeqArr;
	}
	public Integer[] getIfmpDefaultNy() {
		return ifmpDefaultNy;
	}
	public void setIfmpDefaultNy(Integer[] ifmpDefaultNy) {
		this.ifmpDefaultNy = ifmpDefaultNy;
	}
	public Integer[] getIfmpTypeCd() {
		return ifmpTypeCd;
	}
	public void setIfmpTypeCd(Integer[] ifmpTypeCd) {
		this.ifmpTypeCd = ifmpTypeCd;
	}
	public Integer[] getIfmpDeviceCd() {
		return ifmpDeviceCd;
	}
	public void setIfmpDeviceCd(Integer[] ifmpDeviceCd) {
		this.ifmpDeviceCd = ifmpDeviceCd;
	}
	public Integer[] getIfmpTelecomCd() {
		return ifmpTelecomCd;
	}
	public void setIfmpTelecomCd(Integer[] ifmpTelecomCd) {
		this.ifmpTelecomCd = ifmpTelecomCd;
	}
	public String[] getIfmpNumber() {
		return ifmpNumber;
	}
	public void setIfmpNumber(String[] ifmpNumber) {
		this.ifmpNumber = ifmpNumber;
	}
	public Integer[] getIfmpDelNy() {
		return ifmpDelNy;
	}
	public void setIfmpDelNy(Integer[] ifmpDelNy) {
		this.ifmpDelNy = ifmpDelNy;
	}
	
}