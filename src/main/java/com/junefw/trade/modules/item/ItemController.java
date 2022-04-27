
package com.junefw.trade.modules.item;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.junefw.infra.common.base.BaseController;

@Controller
@RequestMapping(value = "/location/")
public class ItemController extends BaseController {

	@RequestMapping(value = "locationForm")
//	public String locationForm(@ModelAttribute("vo") LocationVo vo, Model model) throws Exception {
	public String locationForm() throws Exception {

//		if (vo.getLtltSeq().equals("0") || vo.getLtltSeq().equals("")) {
//			//	insert
//		} else {
//			Location item = service.selectOne(vo);
//			model.addAttribute("item", item);
//		}

		return "xdmin/trade/item/itemForm";
	}



}