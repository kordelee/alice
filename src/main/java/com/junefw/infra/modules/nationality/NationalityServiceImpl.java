package com.junefw.infra.modules.nationality;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junefw.infra.common.base.BaseServiceImpl;


@Service
public class NationalityServiceImpl extends BaseServiceImpl implements NationalityService{

	@Autowired
	NationalityDao dao;

	@Override
	public int selectOneCount(NationalityVo vo){
		return dao.selectOneCount(vo);
	}
	
	@Override
	public List<Nationality> selectList(NationalityVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public Nationality selectOne(NationalityVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	@Override
	public int insert(Nationality dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(Nationality dto) throws Exception {
		return dao.update(dto);
	}
	
	@Override
	public int uelete(NationalityVo vo) throws Exception {
		return dao.uelete(vo);
	}
	
	@Override
	public int delete(NationalityVo vo) throws Exception {
		return dao.delete(vo);
	}

}
