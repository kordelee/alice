package com.junefw.location.modules.location;

import java.util.List;

public interface LocationService {

	int selectOneCount(LocationVo vo) throws Exception;
	List<Location> selectList(LocationVo vo) throws Exception; 
	Location selectOne(LocationVo vo) throws Exception;
	int insert(Location dto) throws Exception;
	int update(Location dto) throws Exception; 
	int uelete(Location dto) throws Exception; 
	int delete(LocationVo vo) throws Exception;
	
}
