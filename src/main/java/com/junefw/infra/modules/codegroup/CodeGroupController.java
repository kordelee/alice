package com.junefw.infra.modules.codegroup;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junefw.infra.common.base.BaseController;
import com.junefw.infra.common.constants.Constants;
import com.junefw.infra.common.util.UtilDateTime;

@Controller
@RequestMapping(value="/codeGroup/")
public class CodeGroupController extends BaseController{
	
	@Autowired
	CodeGroupServiceImpl service;

	
	public void setSearchAndPaging(CodeGroupVo vo) throws Exception {
		
		vo.setShOptionDate(vo.getShOptionDate() == null ? 2 : vo.getShOptionDate());
		vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));

		vo.setParamsPaging(service.selectOneCount(vo));
		
	}
	
	
	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {

		setSearchAndPaging(vo);
		
		if (vo.getTotalRows() > 0) {
			List<CodeGroup> list = service.selectList(vo);
			model.addAttribute("list", list);
		}

		return "infra/modules/codeGroup/dmin/codeGroupList";
	}

	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {

		if (vo.getIfcgSeq().equals("0") || vo.getIfcgSeq().equals("")) {
			//	insert
		} else {
			CodeGroup item = service.selectOne(vo);
			model.addAttribute("item", item);
		}

		return "infra/modules/codeGroup/dmin/codeGroupForm";
	}
	

	@SuppressWarnings(value = { "all" })
	@RequestMapping(value = "codeGroupInst")
	public String codeGroupyInst(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {

		service.insert(dto);
	
		vo.setIfcgSeq(dto.getIfcgSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);

		if (Constants.INSERT_AFTER_TYPE == 1) {
			return "redirect:/codeGroup/codeGroupForm";
		} else {
			return "redirect:/codeGroup/codeGroupList";
		}
	}
	
	
	@SuppressWarnings(value = { "all" })
	@RequestMapping(value = "codeGroupUpdt")
	public String codeGroupUpdt(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {

		service.update(dto);

		redirectAttributes.addFlashAttribute("vo", vo);

		if (Constants.UPDATE_AFTER_TYPE == 1) {
			return "redirect:/codeGroup/codeGroupForm";
		} else {
			return "redirect:/codeGroup/codeGroupList";
		}
	}

	
	@RequestMapping(value = "codeGroupUele")
	public String codeGroupUele(CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.uelete(vo);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/codeGroup/codeGroupList";
	}

	
	@RequestMapping(value = "codeGroupDele")
	public String nationalityDele(CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.delete(vo);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/codeGroup/codeGroupList";
	}

	
//	@RequestMapping(value = "nationalityMultiUele")
//	public String nationalityMultiUele(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
//
//		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
//			dto.setIfnaSeq(checkboxSeq);
//			service.uelete(dto);
//		}
//
//		redirectAttributes.addFlashAttribute("vo", vo);
//
//		return "redirect:/nationality/nationalityList";
//	}
//
//	
//	@RequestMapping(value = "nationalityMultiDele")
//	public String nationalityMultiDele(CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {
//
//		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
//			vo.setIfnaSeq(checkboxSeq);
//		}
//
//		redirectAttributes.addFlashAttribute("vo", vo);
//
//		return "redirect:/nationality/nationalityList";
//	}
	

	@RequestMapping("excelDownload")
    public void excelDownload(CodeGroupVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		setSearchAndPaging(vo);

		if (vo.getTotalRows() > 0) {
			List<CodeGroup> list = service.selectList(vo);
			
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
	            
//	            cell = row.createCell(0);
//	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	        	cell.setCellStyle(cellStyle);
//	            cell.setCellValue(Integer.parseInt(list.get(i).getIfmmSeq()));
//	            
//	            cell = row.createCell(1);
//	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	        	cell.setCellStyle(cellStyle);
//	        	cell.setCellValue(list.get(i).getIfmmName());
//	        	
//	            cell = row.createCell(2);
//	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	        	cell.setCellStyle(cellStyle);
//	        	cell.setCellValue(list.get(i).getIfmmId());
//	        	
//	            cell = row.createCell(3);
//	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	        	cell.setCellStyle(cellStyle);
//	            cell.setCellValue(list.get(i).getIfmmDob());
//	            
//	            cell = row.createCell(4);
//	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	        	cell.setCellStyle(cellStyle);
//	            cell.setCellValue(dateTimeToString(list.get(i).getRegDateTime()));
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
}