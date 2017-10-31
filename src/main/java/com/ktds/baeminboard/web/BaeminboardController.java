package com.ktds.baeminboard.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.baeminboard.service.BaeminboardService;
import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopSearchVO;



@Controller
public class BaeminboardController {
	
	private BaeminboardService baeminboardService;
	
	public void setBaeminboardService(BaeminboardService baeminboardService) {
		this.baeminboardService = baeminboardService;
	}
	
	@RequestMapping("/")
	public String viewMainPage() {
		
		return "baeminboard/main";
	}
	
	@RequestMapping("/baeminboard/search/{keyword}/{address}")
	public ModelAndView searchListPage(ShopSearchVO shopSearchVO, @PathVariable String keyword, @PathVariable String address, HttpSession session){
		
		if ( shopSearchVO.getPageNo() == null || shopSearchVO.getPageNo().length() == 0 ) {
			shopSearchVO = (ShopSearchVO) session.getAttribute("_BAEMINBOARD_SEARCH_");
			if ( shopSearchVO == null  ) {
				shopSearchVO = new ShopSearchVO();
			}
		}
		
		shopSearchVO.setSearchKeyword(keyword);
		shopSearchVO.setLocation(address);
		
		List<ShopInfoVO> shopInfoVO = baeminboardService.searchAllBaeminboard(shopSearchVO);
		
		ModelAndView view = new ModelAndView();
		
		view.setViewName("baeminboard/list");
		view.addObject("shopInfoVO", shopInfoVO);
		view.addObject("shopSearchVO", shopSearchVO);
		
		session.setAttribute("_BAEMINBOARD_SEARCH_", shopSearchVO);
		
		return view;
	}
	
	@RequestMapping("/baeminboard/list/{menu}/{address}")
	public ModelAndView viewListPage(ShopSearchVO shopSearchVO, @PathVariable String menu, @PathVariable String address,  HttpSession session){
		
		if ( shopSearchVO.getPageNo() == null || shopSearchVO.getPageNo().length() == 0 ) {
			shopSearchVO = (ShopSearchVO) session.getAttribute("_BAEMINBOARD_SEARCH_");
			if ( shopSearchVO == null  ) {
				shopSearchVO = new ShopSearchVO();
			}
		}
	
		shopSearchVO.setSearchKeyword(menu);
		shopSearchVO.setLocation(address);
		
		List<ShopInfoVO> shopInfoVO = baeminboardService.readAllBaeminboard(shopSearchVO);
		
		ModelAndView view = new ModelAndView();
		
		view.setViewName("baeminboard/list");
		view.addObject("shopInfoVO", shopInfoVO);
		view.addObject("shopSearchVO", shopSearchVO);
		
		session.setAttribute("_BAEMINBOARD_SEARCH_", shopSearchVO);
		
		return view;
	}
	
	@RequestMapping("/baeminboard/addShopInfo")
	@ResponseBody
	public List<ShopInfoVO> addShopInfo(ShopSearchVO shopSearchVO, HttpSession session) {
		System.out.println("===============================test");
		
		List<ShopInfoVO> shopInfoVO = baeminboardService.readAllBaeminboard(shopSearchVO);
		
		return shopInfoVO;
	}
	

}
