package com.junefw.infra;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.junefw.infra.modules.member.Member;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/test/map")
	public String map() {
		
		return "test/map";
	}
	
	@RequestMapping(value = "/test/zoomList")
	public String zoomList() {
		
		return "test/zoomList";
	}
	
	
	@RequestMapping(value = "/test/memberList")
	public String memberList(Model model) throws Exception {
		
		String apiUrl = "http://localhost/rest/member";
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("GET");
		
		BufferedReader bufferedReader;
		if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		} else {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while ((line = bufferedReader.readLine()) != null) {
			stringBuilder.append(line);
		}

		bufferedReader.close();
		httpURLConnection.disconnect();

		// json Array String -> java List
		ObjectMapper objectMapper = new ObjectMapper();
		List<Member> memberList = objectMapper.readValue(stringBuilder.toString(), new TypeReference<List<Member>>() {});

		model.addAttribute("list", memberList);
		
		return "test/memberList";
	}
	
	
	@RequestMapping(value = "/test/memberView")
	public String memberView(Model model) throws Exception {

//		api 호출해서 데이터를 받아온다.
		
		String apiUrl = "http://localhost/rest/member/22";
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("GET");
		
		BufferedReader bufferedReader;
		if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		} else {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while ((line = bufferedReader.readLine()) != null) {
			System.out.println("line: " + line);
			stringBuilder.append(line);
		}
		
		bufferedReader.close();
		httpURLConnection.disconnect();
		
		System.out.println("final line:" + stringBuilder.append(line));
		
		ObjectMapper objectMapper = new ObjectMapper();
		Member member = objectMapper.readValue(stringBuilder.toString(), Member.class);
		
		model.addAttribute("item", member);
		
		return "test/memberView";
	}
	
	
	@RequestMapping(value = "/test/publicCorona1List")
	public String publicCorona1List(Model model) throws Exception {
		
		String apiUrl = "http://apis.data.go.kr/1471000/CovidDagnsRgntProdExprtStusService/getCovidDagnsRgntProdExprtStusInq?serviceKey=dNLcjyriV9IBD5djvIMsq16GYwW%2F8N%2FCtnCNvRj66yaLV9jXKhipDNCJFDcDzorgqnVsJsz5gmYoibNbAG0sdw%3D%3D&numOfRows=3&pageNo=1&type=json";
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("GET");
		
		BufferedReader bufferedReader;
		if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		} else {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while ((line = bufferedReader.readLine()) != null) {
			System.out.println("line: " + line);
			stringBuilder.append(line);
		}

		bufferedReader.close();
		httpURLConnection.disconnect();

//		System.out.println(stringBuilder.toString());

		ObjectMapper objectMapper = new ObjectMapper();
//		JsonNode node = objectMapper.readTree(stringBuilder.toString());
//		
//		String resultMsg = node.get("resultMsg").asText();
//		
//		System.out.println("resultMsg: " + resultMsg);
		
		Map<String, Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
		
//		Map<String, String> map = objectMapper.readValue(stringBuilder.toString(), Map.class);

		for (String key : map.keySet()) {
//			String value = (String) map.get(key);	// error casting
			String value = String.valueOf(map.get(key));	// ok recognize null to string null
//			String value = map.get(key).toString();	// error null
		    System.out.println("[key]:" + key + ", [value]:" + value);
		}   
		
		HashMap header = new HashMap();
		header = (HashMap) map.get("header");
		
		System.out.println("header: " + header.get("resultCode"));
		System.out.println("header: " + header.get("resultMsg"));
		
		HashMap body = new HashMap();
		body = (HashMap) map.get("body");
		
		System.out.println("body.get(\"pageNo\": " + body.get("pageNo"));
		System.out.println("body.get(\"totalCount\": " + body.get("totalCount"));
		System.out.println("body.get(\"numOfRows\": " + body.get("numOfRows"));
		System.out.println("body.get(\"items\": " + body.get("items"));
		
//		HashMap items = new HashMap();
//		items = (HashMap) body.get("items");
		
		ArrayList<Home> items = new ArrayList<Home>();
		items = (ArrayList<Home>) body.get("items");
		
		System.out.println("items: " + items);
		
		
		
		
		
		
//		System.out.println("map.get(\"resultCode\"): " + map.get("resultCode"));
//		System.out.println("map.get(\"header\"): " + map.get("header"));
		
		
////		JSONObject jsonObject = new JSONObject();
//		for( Map.Entry<String, String> entry : map.entrySet()  ){
//		    String key = entry.getKey();
//		    System.out.println(key);
////		    Object value = entry.getValue();
////		    jsonObject.put(key, value);
//		}
//		
//		HashMap header = new HashMap();
//		header = (HashMap) map.get("header");
//		
//		System.out.println("header.get(resultCode): " + header.get("resultCode"));
		
		
		
		
//		Home home = objectMapper.readValue(stringBuilder.toString(), Home.class);
//		System.out.println("home: " + home);
//		
//		System.out.println("home.getResultCode(): " + home.getResultCode());
//		System.out.println("home.getResultMsg(): " + home.getResultMsg());
//		System.out.println("home.getPageNo(): " + home.getPageNo());
//		System.out.println("home.getTotalCount(): " + home.getTotalCount());
		
		
		
//		model.addAttribute("list", home.items);
		
		return "test/publicCorona1List";
	}
	
	

	
}
