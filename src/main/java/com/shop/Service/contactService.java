package com.shop.Service;

import org.springframework.stereotype.Service;

import com.shop.Controller.baseController;
import com.shop.Entities.contact;
@Service
public class contactService extends BaseService<contact> {

	@Override
	protected Class<contact> clazz() {
		// TODO Auto-generated method stub
		return contact.class;
	}

}
