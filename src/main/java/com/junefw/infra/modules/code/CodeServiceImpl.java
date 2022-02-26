package com.junefw.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDao dao;
	
	@Override
	public int selectOneCount(Code code) throws Exception { return dao.selectOneCount(code); }
	
	@Override
	public List<Code> selectList(Code code) throws Exception { return dao.selectList(code); }
	
	@Override
	public Code selectOne(Code code) throws Exception { return dao.selectOne(code); }

	@Override
	public int insert(Code code) throws Exception { return dao.insert(code); }

	@Override
	public int update(Code code) throws Exception { return dao.update(code); }


}
