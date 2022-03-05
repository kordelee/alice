package com.junefw.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDao dao;
	
//	private static List<Code> codeGroup = new ArrayList<Code>();
	public static List<Code> code = new ArrayList<Code>();

	
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

	@Override
	@PostConstruct
	public void selectListForCache() throws Exception {
		
		System.out.println("loaded !!!");
		
		List<Code> codeListFromDb; // 코드 그룹
		codeListFromDb = (ArrayList<Code>) dao.selectListForCache(); // codeId, codeIdNm
		code.clear(); 
		code.addAll(codeListFromDb);

	}

}
