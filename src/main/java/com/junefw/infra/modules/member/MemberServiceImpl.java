package com.junefw.infra.modules.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junefw.infra.common.base.BaseServiceImpl;
import com.junefw.infra.common.util.SetRegMod;
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
			
			dto.setIfmeDefaultNy("1");
			
			return dao.insertEmail(dto);

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
