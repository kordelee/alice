
package com.junefw.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.junefw.infra.common.base.BaseController;

@RestController
//@RequestMapping("/member")
public class MemberRestController extends BaseController {

	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public Map<String, Object> member(MemberVo vo) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		List<Member> list = service.selectList(vo);
		
		returnMap.put("list", list);
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	
	@RequestMapping(value = "/member2", method = RequestMethod.GET)
	public List<Member> member2(MemberVo vo) throws Exception {
		List<Member> list = service.selectList(vo);
		return list;
	}
	
	
	@RequestMapping(value = "/member3", method = RequestMethod.GET)
	public Object member3(MemberVo vo) throws Exception {
		List<Member> list = service.selectList(vo);
		return list;
	}
	
	
	
	
//	@RequestMapping(value = "/{seq}", method = RequestMethod.GET)
//	public Map<String, Object> member(@PathVariable String seq) throws Exception {
//		Map<String, Object> returnMap = new HashMap<String, Object>();
//		
//		Member item = service.selectOne(vo);
//		
//		returnMap.put("item", list);
//		returnMap.put("rt", "success");
//		return returnMap;
//	}
	
	
}