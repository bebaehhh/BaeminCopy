package com.ktds.baeminboard.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.baeminboard.service.BaeminboardService;
import com.ktds.baeminboard.service.ShopService;
import com.ktds.baeminboard.vo.ReviewVO;
import com.ktds.baeminboard.vo.ShopInfoListVO;
import com.ktds.baeminboard.vo.ShopInfoVO;
import com.ktds.baeminboard.vo.ShopSearchVO;
import com.ktds.oauthmember.vo.BookmarkVO;
import com.ktds.oauthmember.vo.OauthmemberVO;

@Controller
public class ShopController {

	private ShopService shopService;
	
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}
	
	@RequestMapping("/baeminboard/shop/{shop_id}")
	public ModelAndView viewShopPage(@PathVariable int shop_id, HttpSession session){
		
		ModelAndView view = new ModelAndView();
		ShopSearchVO shopSearchVO = new ShopSearchVO();
		shopSearchVO.setShop_id(shop_id);
		
		view.setViewName("baeminboard/shop");
		view.addObject("shopInfoListVO", shopService.readOneShopInfo(shopSearchVO));
		session.setAttribute("_BAEMINBOARD_SEARCH_", shopSearchVO);
		
		return view;
	}
	
	@RequestMapping("/baeminboard/addReview")
	@ResponseBody
	public List<ReviewVO> addReview(HttpSession session) {
		
		ShopSearchVO shopSearchVO = (ShopSearchVO) session.getAttribute("_BAEMINBOARD_SEARCH_");
		if(shopSearchVO.getPageNo() == null) {
		shopSearchVO.setPageNo("1");
		}
		int pageNo = Integer.parseInt(shopSearchVO.getPageNo());
		pageNo += 1;
		
		shopSearchVO.setPageNo(String.valueOf(pageNo));
	
		List<ReviewVO> reviewList = shopService.readAllReview(shopSearchVO);
		session.setAttribute("_BAEMINBOARD_SEARCH_", shopSearchVO);
		
		return reviewList;
	}
	
	
	@RequestMapping("/baeminboard/addBookmark")
	@ResponseBody
	public String addBookmark(HttpSession session) {
		
		ShopSearchVO shopSearchVO = (ShopSearchVO) session.getAttribute("_BAEMINBOARD_SEARCH_");
		OauthmemberVO oauthmemberVO = (OauthmemberVO) session.getAttribute("_USER_");
		BookmarkVO bookmarkVO = new BookmarkVO();
		
		bookmarkVO.setMemberId(oauthmemberVO.getMemberId());
		bookmarkVO.setShop_id(shopSearchVO.getShop_id());
		
		boolean isSuccess = shopService.createBookmark(bookmarkVO); 
		
		if(!isSuccess) {
			return "false";
		}
		
		return "success";
	}
	
}
