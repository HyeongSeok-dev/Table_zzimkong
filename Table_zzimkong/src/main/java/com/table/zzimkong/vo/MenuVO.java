package com.table.zzimkong.vo;

public class MenuVO {
	String menu_name;
	String menu_price;
	String menu_describe;
	
	public MenuVO() {}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_describe() {
		return menu_describe;
	}

	public void setMenu_describe(String menu_describe) {
		this.menu_describe = menu_describe;
	}


	@Override
	public String toString() {
		return "MenuVO [menu_name=" + menu_name + ", menu_price=" + menu_price + ", menu_describe=" + menu_describe
				+ ", menu_img=" +  "]";
	}
	

	
}
