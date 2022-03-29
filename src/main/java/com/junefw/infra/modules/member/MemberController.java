
package com.junefw.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junefw.infra.common.base.BaseController;
import com.junefw.infra.common.constants.Constants;
import com.junefw.infra.common.util.UtilDateTime;
import com.junefw.infra.modules.code.Code;
import com.junefw.infra.modules.code.CodeServiceImpl;

@Controller
@RequestMapping(value="/member/")
public class MemberController extends BaseController{
	
	@Autowired
	MemberServiceImpl service;
	
	
	@RequestMapping(value = "memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
		vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL) : UtilDateTime.addStringTime(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : UtilDateTime.addStringTime(vo.getShDateEnd()));
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		if (vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
//			List<?> list = service.selectList(vo);
			model.addAttribute("list", list);
		}

		return "xdmin/member/memberList";
	}
	
	
	@RequestMapping(value = "memberForm")
	public String memberForm(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		if (vo.getIfmmSeq().equals("0") || vo.getIfmmSeq().equals("")) {
//			insert
		} else {
//			update
			Member item = service.selectOne(vo);
			model.addAttribute("item", item);

			model.addAttribute("listPhone", service.selectListPhone(vo));
		}
		
//		model.addAttribute("codeGender", CodeServiceImpl.selectListCachedCode("3"));
//		model.addAttribute("codeTelecom", CodeServiceImpl.selectListCachedCode("10"));
	
		return "xdmin/member/memberForm";
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "memberInst")
	public String memberInst(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {

		service.insert(dto);
	
		vo.setIfmmSeq(dto.getIfmmSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);

		if (Constants.INSERT_AFTER_TYPE == 1) {
			return "redirect:/member/memberForm";
		} else {
			return "redirect:/member/memberList";
		}
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "memberUpdt")
	public String memberUpdt(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		if (Constants.UPDATE_AFTER_TYPE == 1) {
			return "redirect:/member/memberForm";
		} else {
			return "redirect:/member/memberList";
		}
	}
	
	
	@RequestMapping(value = "memberUele")
	public String memberUele(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.uelete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
	}
	
	
	@RequestMapping(value = "memberDele")
	public String memberDele(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
	}
	
	
	@RequestMapping(value = "memberMultiUele")
	public String memberMultiUele(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		String[] checkboxSeqArray = vo.getCheckboxSeqArray();
		
		for(String checkboxSeq : checkboxSeqArray) {
			vo.setIfmmSeq(checkboxSeq);
			service.uelete(vo);
		}
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
	}
	
	
	@RequestMapping(value = "memberMultiDele")
	public String memberMultiDele(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		String[] checkboxSeqArray = vo.getCheckboxSeqArray();
		
		for(String checkboxSeq : checkboxSeqArray) {
			vo.setIfmmSeq(checkboxSeq);
//			service.delete(vo);
		}
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
	}
	
	
	@RequestMapping(value = "loginForm")
	public String loginForm(HttpServletRequest httpServletRequest) throws Exception {
		
		return "xdmin/member/loginForm";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member rtMember = service.selectOneLogin(dto);

		if(rtMember != null) {
			rtMember = service.selectOneLogin(dto);

			if(rtMember.getIfmmSeq() != null) {
				httpSession.setMaxInactiveInterval( 60 * Constants.SESSION_MINUTE);	//60second * 30 = 30minute  
//ref			session.setMaxInactiveInterval(-1);		// session time unlimited
	
				httpSession.setAttribute("sessSeq", rtMember.getIfmmSeq());
				httpSession.setAttribute("sessId", rtMember.getIfmmId());
				httpSession.setAttribute("sessName", rtMember.getIfmmName());
				
				returnMap.put("rt", "success");
			} else {
				returnMap.put("rt", "fail");
			}
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	
	@RequestMapping(value = "findIdPwdForm")
	public String findIdPwdForm() throws Exception {
		
		return "xdmin/member/findIdPwdForm";
	}
	
//	구글api를 이용하여 주소값을 던지면 위도 경도를 받아오는 정적 함수
//	구글 계정 등록이 필요하여 현재는 주석 처리
//	@ResponseBody
//	@RequestMapping(value = "addressFindGeoProc")
//	public Map<String, Object> addressFindGeoProc(Member dto) throws Exception {
//		Map<String, Object> returnMap = new HashMap<String, Object>();
//		
//		System.out.println("dto.getIfmaAddress1Array()[0]: " + dto.getIfmaAddress1Array()[0]);
//		
//		Float[] rtFloat = UtilMis.getLatLng(dto.getIfmaAddress1Array()[0]);
//		
//		System.out.println("rtFloat[0]: " + rtFloat[0]);
//		System.out.println("rtFloat[1]: " + rtFloat[1]);
//		
//		returnMap.put("rtFloat", rtFloat);
//		returnMap.put("rt", "success");
//		return returnMap;
//	}
}