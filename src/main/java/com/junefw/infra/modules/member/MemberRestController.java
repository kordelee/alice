
package com.junefw.infra.modules.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.junefw.infra.common.base.BaseController;

@RestController
@RequestMapping(value = "/member/")
public class MemberRestController extends BaseController {

	@Autowired
	MemberServiceImpl service;

	
}