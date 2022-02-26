package com.junefw.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junefw.infra.common.base.BaseController;
import com.junefw.infra.common.constants.Constants;

@Controller
@RequestMapping(value="/member/")
public class MemberController extends BaseController{
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

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
		
		if (vo.getIfmmSeq().equals("0")) {
//			insert
		} else {
//			update
			Member rt = service.selectOne(vo);
			model.addAttribute("rt", rt);
		}
	
		return "xdmin/member/memberForm";
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "memberInst")
	public String memberInst(MemberVo vo, Member member, RedirectAttributes redirectAttributes) throws Exception {
	
		service.insert(member);
	
		vo.setIfmmSeq(member.getIfmmSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
	
		if (Constants.INSERT_AFTER_TYPE == 1) {
			return "redirect:/member/memberForm";
		} else {
			return "redirect:/member/memberList";
		}
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "memberUpdt")
	public String memberUpdt(MemberVo vo, Member member, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(member);
		
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
	
//	@RequestMapping(value = "memberForm", method = RequestMethod.POST)
//	public ModelAndView memberForm(@ModelAttribute MemberVo vo) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		
//		System.out.println("vo.getIfmmSeq(): " + vo.getIfmmSeq());
////		System.out.println("member.getIfmmSeq(): " + member.getIfmmSeq());
//		if (vo.getIfmmSeq().equals("0")) {
////			insert
//			System.out.println("insert");
//		} else {
//			System.out.println("update");
////			Member rt = service.selectOne(vo);
////			System.out.println("rt.getIfmmId(): " + rt.getIfmmId());
////			mav.addObject("rt", rt);
//		}
		
////		mav.addObject("vo", vo);
//		mav.setViewName("/xdmin/member/memberForm");
//		return mav;
//	}
	
//	@RequestMapping(value = "memberList")
//	public ModelAndView memberList(MemberVo vo) throws Exception {
//		ModelAndView mav = new ModelAndView();
//	
//		vo.setParamsPaging(service.selectOneCount(vo));
//		
//		if (vo.getTotalRows() > 0) {
//			List<?> list = service.selectList(vo);
//			mav.addObject("list", list);
//		}
//		mav.addObject("vo", vo);
//		mav.setViewName("/xdmin/member/memberList");
//		return mav;
//	} 
	
	
//	@RequestMapping(value = "memberUpdt")
//	public String memberUpdt(MemberVo vo, Member dto, Model model, RedirectAttributes redirectAttributes) throws Exception {
//		
//		service.update(dto);
//
////		model.addAttribute("vo", vo);
////		model.addAttribute("vo", model);
//
//		redirectAttributes.addAttribute("vo", vo);
//		
//		return "redirect:/member/memberForm";
//	}		
	
	
	
//	@RequestMapping(value = "codeGroupForm")
//	public ModelAndView authForm(Code vo) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		if (vo.getCdgrSeq() != null) {
//				vo.setCdgrSeq(base64Decoder(vo.getCdgrSeq()));
//				mav.addObject("rt", service.selectOne(vo));
//		}else {
//
//		}
//		mav.setViewName("/modules/code/codeGroupForm");
//		return mav;
//	}
//	
//	@RequestMapping(value = "codeGroupInst")
//	public String authInst(Code vo) throws Exception {
//		service.insert(vo);
//		vo.setCdgrSeq(base64Encoder(vo.getCdgrSeq()));
//		return "redirect:/code/codeGroupForm" + "?CdgrSeq=" + vo.getCdgrSeq() + makeParams(params);
//	}
	
//	@RequestMapping(value = "authUpdt")
//	public String authUpdt(Code auth, CodeParams params) throws Exception {
//		authService.update(auth);
//		auth.setAUTH_SEQ(base64Encoder(auth.getAUTH_SEQ()));
//		return "redirect:/auth/authForm" + "?AUTH_SEQ=" + auth.getAUTH_SEQ() + makeParams(params);
//	}		
	
//	/*
//	 * public String makeParams (CodeParams params) { String paramString =
//	 * "&thisPage=" + params.getThisPage(); paramString += "&rowNumToShow=" +
//	 * params.getRowNumToShow(); paramString += "&searchValue=" +
//	 * params.getSearchValue(); paramString += "&gubun=" + params.getGubun();
//	 * 
//	 * return paramString; }
//	 */
	

	
//	@RequestMapping(value = "codeGroupView")
//	public ModelAndView authView(Code vo) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("one", service.selectOne(vo));
//		mav.setViewName("/modules/code/codeGroupView");
//		return mav;
//	}
}