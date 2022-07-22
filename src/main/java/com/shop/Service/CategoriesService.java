package com.shop.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.Entities.Categories;
@Service
public class CategoriesService extends BaseService<Categories> {

	@Override
	protected Class<Categories> clazz() {
		return Categories.class;
	}
	
	
}