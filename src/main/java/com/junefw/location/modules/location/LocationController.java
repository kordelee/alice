
package com.junefw.location.modules.location;

import java.util.List;

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
@RequestMapping(value = "/location/")
public class LocationController extends BaseController {

	@Autowired
	LocationServiceImpl service;

	@RequestMapping(value = "locationList")
	public String locationList(@ModelAttribute("vo") LocationVo vo, Model model) throws Exception {

		vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
		vo.setShDateStart(vo.getShDateStart() == null
				? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL)
				: UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString()
				: UtilDateTime.addNowTimeString(vo.getShDateEnd()));

		vo.setParamsPaging(service.selectOneCount(vo));

		if (vo.getTotalRows() > 0) {
			List<Location> list = service.selectList(vo);
			model.addAttribute("list", list);
		}

		return "xdmin/location/location/locationList";
	}

	@RequestMapping(value = "locationForm")
	public String locationForm(@ModelAttribute("vo") LocationVo vo, Model model) throws Exception {

		if (vo.getLtltSeq().equals("0") || vo.getLtltSeq().equals("")) {
			//	insert
		} else {
			Location item = service.selectOne(vo);
			model.addAttribute("item", item);
		}

		return "xdmin/location/location/locationForm";
	}

	@SuppressWarnings(value = { "all" })
	@RequestMapping(value = "locationInst")
	public String locationInst(LocationVo vo, Location dto, RedirectAttributes redirectAttributes) throws Exception {

		service.insert(dto);
	
		vo.setLtltSeq(dto.getLtltSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);

		if (Constants.INSERT_AFTER_TYPE == 1) {
			return "redirect:/location/locationForm";
		} else {
			return "redirect:/location/locationList";
		}
	}
	
	@SuppressWarnings(value = { "all" })
	@RequestMapping(value = "locationUpdt")
	public String locationUpdt(LocationVo vo, Location dto, RedirectAttributes redirectAttributes) throws Exception {

		service.update(dto);

		redirectAttributes.addFlashAttribute("vo", vo);

		if (Constants.UPDATE_AFTER_TYPE == 1) {
			return "redirect:/location/locationForm";
		} else {
			return "redirect:/location/locationList";
		}
	}

	@RequestMapping(value = "locationUele")
	public String locationUele(LocationVo vo, Location dto, RedirectAttributes redirectAttributes) throws Exception {

		service.uelete(dto);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/location/locationList";
	}

	@RequestMapping(value = "locationDele")
	public String locationDele(LocationVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.delete(vo);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/location/locationList";
	}

	@RequestMapping(value = "locationMultiUele")
	public String locationMultiUele(LocationVo vo, Location dto, RedirectAttributes redirectAttributes) throws Exception {

		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			dto.setLtltSeq(checkboxSeq);
			service.uelete(dto);
		}

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/location/locationList";
	}

	@RequestMapping(value = "locationMultiDele")
	public String locationMultiDele(LocationVo vo, RedirectAttributes redirectAttributes) throws Exception {

		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setLtltSeq(checkboxSeq);
		}

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/location/locationList";
	}

}