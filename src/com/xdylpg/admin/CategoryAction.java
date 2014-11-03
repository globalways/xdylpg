package com.xdylpg.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.Category;
import com.xdylpg.service.CategoryService;
import com.xdylpg.service.ShopService;
import com.xdylpg.service.impl.PsuServiceImpl;
import com.xdylpg.util.T;

public class CategoryAction extends ActionSupport implements ModelDriven<Category>{
	
	private static final long serialVersionUID = 2436559624350017669L;
	ShopService shopService;
	PsuServiceImpl psuService;
	ShopService cbInfoService;
	CategoryService categoryService;
	
	
	HttpServletRequest req = ServletActionContext.getRequest();
	private String actionMSG = "";
	
	/** model modelDriven的Category 模型 */
	Category model = new Category();
	
	/** b_t = browsetype标明不同 浏览分类 的需求 */
	private Integer b_t;
	public Category getModel() {
		return model;
	}
	
	/**
	 * 分类管理首页
	 */
	public String index()
	{
		loadAllCategoryAsMap();
		return SUCCESS;
	}
	
	/**
	 * 保存或者更新分类
	 */
	public String save()
	{
		if(model!=null)
		{
			categoryService.saveOrUpdateCategory(model);
			loadAllCategoryAsMap();
			return "index";
		}else{
			setActionMSG("错误参数！");
			return ERROR;
		}
	}
	/**
	 * 删除分类
	 */
	public String del()
	{
		if(model.getBcnum() != null)
		{
				if ( model.getBcpnum().intValue() != 0) {
					categoryService.delCategory(model.getBcnum());
					List<Category> list = categoryService
							.listChildCategory(model);
					for (Category c : list) {
						categoryService.delCategory(c.getBcnum());
					}
				}else{ actionMSG = "不能删除顶级分类@CategoryAction:157";return ERROR;}
		}else{
			actionMSG = "参数错误@CategoryAction:159";
			return ERROR;
		}
		return "index";
	}
	
	/**
	 * 重置分类顺序
	 */
	public String order()
	{
		String orders = req.getParameter("orders");
		try {
			JSONArray ja = JSONArray.fromObject(orders);
			for(int i=0;i<ja.size();i++)
			{
					JSONObject jo = ja.getJSONObject(i);
					Category c = new Category();
					c.setBcnum(jo.getInt("bcnum"));
					c.setBcorder(jo.getInt("bcorder"));
					categoryService.updateOrder(c);
			}
		} catch (Exception e) {
			actionMSG = "order json 格式错误@CategoryAction:175";
			return ERROR;
		}
		return "index";
	}
	
	/**
	 * 添加商户前分类选择
	 */
	public String choose()
	{
		loadAllCategoryAsMap();
		return "choose";
	}
	
	public String editCategory()
	{
		if(model.getBcnum() != null)
		{
			model = categoryService.loadCategory(model.getBcnum());
		}
		return SUCCESS;
		
	}
	public String updateCategory()
	{
		if(model!=null)
		{
			categoryService.saveOrUpdateCategory(model);
			return "toBroseCategory";
		}else{
			return ERROR;
		}

	}
	public String loadCategory()
	{
		Category c = categoryService.loadCategory(model.getBcnum());
		req.setAttribute("category",c);
		return SUCCESS;
		
	}
	
	public void loadAllCategoryAsMap()
	{
			TreeMap<Category, TreeMap<Category, ArrayList<Category>>> map = categoryService.loadAllCategoryAsMap();
			req.getSession().setAttribute("CategorysMap", map);
	}
	public String loadTemplate()
	{
		int categoryID = 1;
		int businessID = 1;
		Category currentCategory = null;
		if(T.isNum(req.getParameter("c")))
		{
			categoryID = Integer.parseInt(req.getParameter("c"));
			currentCategory = categoryService.loadCategory(categoryID);
		}
		if( (T.isNum(req.getParameter("b"))))
		{
			Object o = null; 
			categoryID = categoryService.findSuperCategory(currentCategory);
			businessID = Integer.parseInt(req.getParameter("b"));
			switch (categoryID)
			{
				case 1 : o = cbInfoService.loadById(businessID);break;
				case 2 : o = shopService.loadById(businessID);break;
				case 3 : o = shopService.loadById(businessID);break;
				case 4 : o = psuService.loadById(businessID);break;
				default :break;
			}
			req.setAttribute("busObj",o);
		}
req.setAttribute("url",currentCategory.getBctem());
req.setAttribute("toCategory", currentCategory);
		return SUCCESS;
		
	}
	
	
	
	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setModel(Category model) {
		this.model = model;
	}

	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}

	public void setPsuService(PsuServiceImpl psuService) {
		this.psuService = psuService;
	}

	public void setCbInfoService(ShopService cbInfoService) {
		this.cbInfoService = cbInfoService;
	}

	public ShopService getShopService() {
		return shopService;
	}

	public PsuServiceImpl getPsuService() {
		return psuService;
	}

	public ShopService getCbInfoService() {
		return cbInfoService;
	}

	public String getActionMSG() {
		return actionMSG;
	}

	public void setActionMSG(String actionMSG) {
		this.actionMSG = actionMSG;
	}

}
