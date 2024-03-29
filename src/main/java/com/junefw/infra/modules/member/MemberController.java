
package com.junefw.infra.modules.member;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junefw.infra.common.base.BaseController;
import com.junefw.infra.common.constants.Constants;
import com.junefw.infra.common.util.UtilCookie;
import com.junefw.infra.common.util.UtilDateTime;

@Controller
@RequestMapping(value = "/member/")
public class MemberController extends BaseController {

	@Autowired
	MemberServiceImpl service;

	public void setSearchAndPaging(MemberVo vo) throws Exception {
		vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
		vo.setShDateStart(vo.getShDateStart() == null
				? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL)
				: UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString()
				: UtilDateTime.add59TimeString(vo.getShDateEnd()));

		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	
	@RequestMapping(value = "memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

		setSearchAndPaging(vo);

		if (vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
//			List<?> list = service.selectList(vo);
			model.addAttribute("list", list);
		}

//		return "xdmin/member/memberList";
		return "infra/modules/member/admin/memberList";
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

		return "infra/modules/member/admin/memberForm";
	}

	@SuppressWarnings(value = { "all" })
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
	
	@SuppressWarnings(value = { "all" })
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

		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setIfmmSeq(checkboxSeq);
			service.uelete(vo);
		}

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/memberList";
	}

	@RequestMapping(value = "memberMultiDele")
	public String memberMultiDele(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setIfmmSeq(checkboxSeq);
//			service.delete(vo);
		}

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/memberList";
	}

	@RequestMapping(value = "loginForm")
	public String loginForm(MemberVo vo, HttpSession httpSession) throws Exception {
		if(UtilCookie.getValue(Constants.COOKIE_NAME_SEQ) != null) {
			//	auto login
			
			System.out.println("UtilCookie.getValue(Constants.COOKIE_NAME_SEQ): " + UtilCookie.getValue(Constants.COOKIE_NAME_SEQ));
			
			if(httpSession.getAttribute("sessSeq") == null) {
				
				vo.setIfmmSeq(UtilCookie.getValue(Constants.COOKIE_NAME_SEQ));
				
				Member rtMember = service.selectOne(vo);
				
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
				httpSession.setAttribute("sessSeq", rtMember.getIfmmSeq());
				httpSession.setAttribute("sessId", rtMember.getIfmmId());
				httpSession.setAttribute("sessName", rtMember.getIfmmName());
			} else {
				//	by pass
			}
			return "redirect:/index/indexView";
		} else {
			//	by pass
			return "xdmin/member/loginForm";
		}
	}

	@ResponseBody
	@RequestMapping(value = "loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		Member rtMember = service.selectOneId(dto);

		if (rtMember != null) {
			Member rtMember2 = service.selectOneLogin(dto);

			if (rtMember2 != null) {
				
				if(dto.getAutoLogin() == true) {
					UtilCookie.createCookie(Constants.COOKIE_NAME_SEQ, rtMember2.getIfmmSeq(), Constants.COOKIE_DOMAIN, Constants.COOKIE_PATH, Constants.COOKIE_MAXAGE);
				} else {
					// by pass
				}
				
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
				httpSession.setAttribute("sessSeq", rtMember2.getIfmmSeq());
				httpSession.setAttribute("sessId", rtMember2.getIfmmId());
				httpSession.setAttribute("sessName", rtMember2.getIfmmName());

				rtMember2.setIflgResultNy(1);
				service.insertLogLogin(rtMember2);

				Date date = rtMember2.getIfmmPwdModDate();
				LocalDateTime ifmmPwdModDateLocalDateTime = LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());

				if (ChronoUnit.DAYS.between(ifmmPwdModDateLocalDateTime, UtilDateTime.nowLocalDateTime()) > Constants.PASSWOPRD_CHANGE_INTERVAL) {
					returnMap.put("changePwd", "true");
				}

				returnMap.put("rt", "success");
			} else {
				dto.setIfmmSeq(rtMember.getIfmmSeq());
				dto.setIflgResultNy(0);
				service.insertLogLogin(dto);

				returnMap.put("rt", "fail");
			}
		} else {
			dto.setIflgResultNy(0);
			service.insertLogLogin(dto);

			returnMap.put("rt", "fail");
		}
		return returnMap;
	}

	@ResponseBody
	@RequestMapping(value = "logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		UtilCookie.deleteCookie();
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}

	@RequestMapping(value = "findIdPwdForm")
	public String findIdPwdForm() throws Exception {

		return "infra/modules/member/admin/findIdPwdForm";
	}

	@RequestMapping(value = "changePwdForm")
	public String changePwdForm() throws Exception {

		return "infra/modules/member/admin/changePwdForm";
	}

	@ResponseBody
	@RequestMapping(value = "extendPwd")
	public Map<String, Object> extendPwd(Member dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		service.updateIfmmPwdModDate(dto);
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	
	@RequestMapping(value = "memberOracleList")
	public String memberOracleList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {


			List<Member> list = service.selectListOracle(vo);
			model.addAttribute("list", list);
			
			
		return "infra/modules/member/admin/memberOracleList";
	}
	
	
	@RequestMapping("excelDownload")
    public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		setSearchAndPaging(vo);

		if (vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
			
//			Workbook workbook = new HSSFWorkbook();	// for xls
	        Workbook workbook = new XSSFWorkbook();
	        Sheet sheet = workbook.createSheet("첫번째 시트");
	        CellStyle cellStyle = workbook.createCellStyle();        
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;
			
	        sheet.setColumnWidth(0, 2100);
	        sheet.setColumnWidth(1, 3100);

//	        Header
	        String[] tableHeader = {"번호","이름","아이디","생년월일","수정일"};

	        row = sheet.createRow(rowNum++);
			for(int i=0; i<tableHeader.length; i++) {
				cell = row.createCell(i);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
				cell.setCellValue(tableHeader[i]);
			}

	        // Body
	        for (int i=0; i<list.size(); i++) {
	            row = sheet.createRow(rowNum++);
	            
	            cell = row.createCell(0);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            cell.setCellValue(Integer.parseInt(list.get(i).getIfmmSeq()));
	            
	            cell = row.createCell(1);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getIfmmName());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getIfmmId());
	        	
	            cell = row.createCell(3);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getIfmmDob());
	            
	            cell = row.createCell(4);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            cell.setCellValue(dateTimeToString(list.get(i).getRegDateTime()));
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
	
	
	@RequestMapping(value = "memberAjaxList")
	public String memberAjaxList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

		setSearchAndPaging(vo);

		return "infra/modules/member/admin/memberAjaxList";
	}
	
	
	@RequestMapping(value = "memberAjaxLita")
	public String memberAjaxLita(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		setSearchAndPaging(vo);

		if (vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
			model.addAttribute("list", list);
		}

		return "infra/modules/member/admin/memberAjaxLita";
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