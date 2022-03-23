package com.junefw.infra.modules.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junefw.infra.common.base.BaseServiceImpl;
import com.junefw.infra.common.util.UtilMis;


@Service
public class MemberServiceImpl extends BaseServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;

//	@Autowired
//	SetRegMod setRegMod;
	
	
	@Override
	public int selectOneCount(MemberVo vo){
		return dao.selectOneCount(vo);
	}
	
	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	@Override
	public int insert(Member dto, HttpServletRequest httpServletRequest) throws Exception {
	    try {
	    	
	    	setReg(dto);
//	    	setRegMod.setReg(dto);
	    	
	    	dao.insert(dto);
			
	    	// infrMemberEmail
			for(int i = 0 ; i < dto.getIfmeEmailFullArray().length ; i++) {
				dto.setIfmeDefaultNy(dto.getIfmeDefaultNyArray()[i]);
				dto.setIfmeTypeCd(dto.getIfmeTypeCdArray()[i]);
				dto.setIfmeEmailFull(dto.getIfmeEmailFullArray()[i]);
				dao.insertEmail(dto);
			}
	    	
			// infrMemberPhone
			for(int i = 0 ; i < dto.getIfmpNumberArray().length ; i++) {
				dto.setIfmpDefaultNy(dto.getIfmpDefaultNyArray()[i]);
				dto.setIfmpTypeCd(dto.getIfmpTypeCdArray()[i]);
				dto.setIfmpDeviceCd(dto.getIfmpDeviceCdArray()[i]);
				dto.setIfmpTelecomCd(dto.getIfmpTelecomCdArray()[i]);
				dto.setIfmpNumber(dto.getIfmpNumberArray()[i]);
				dao.insertPhone(dto);
			}
			
//			infrMemberAddress
			for(int i = 0 ; i < dto.getIfmaZipcodeArray().length ; i++) {
				dto.setIfmaDefaultNy(dto.getIfmaDefaultNyArray()[i]);
				dto.setIfmaTypeCd(dto.getIfmaTypeCdArray()[i]);
				dto.setIfmaTitle(dto.getIfmaTitleArray()[i]);
				dto.setIfmaAddress1(dto.getIfmaAddress1Array()[i]);
				dto.setIfmaAddress2(dto.getIfmaAddress2Array()[i]);
				dto.setIfmaZipcode(dto.getIfmaZipcodeArray()[i]);
				dao.insertAddress(dto);
			}
			
			return 1;

	    } catch (Exception e) {
	        throw new Exception();
	    }
	}

	@Override
	public int update(Member dto) throws Exception {
		return dao.update(dto);
	}
	
	@Override
	public int uelete(MemberVo vo) throws Exception {
		return dao.uelete(vo);
	}
	
	@Override
	public int delete(MemberVo vo) throws Exception {
		return dao.delete(vo);
	}

//	login
	
	@Override
	public Member selectOneId(Member dto) throws Exception {
		return dao.selectOneId(dto);
	}

	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}
	
	public void setReg(Member dto) throws Exception {
		dto.setRegIp(UtilMis.getClientIP());
		dto.setRegSeq(UtilMis.getSessionSeq());
		dto.setRegDateTime(UtilMis.nowDate());
		UtilMis.getBroswer();
		System.out.println("asdfasdf");
	}
	
	public void setRegMod(Member dto) throws Exception {
		dto.setModDateTime(UtilMis.nowDate());
	}
	

	
	
}
