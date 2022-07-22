package com.shop.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.shop.Entities.Role;

@Service
public class RoleService extends BaseService<Role> {

	@Override
	protected Class<Role> clazz() {
		return Role.class;
	}

	public Role getByName(String name) {
		String sql = "SELETE * FROM tbl_roles r where r.name= '"+name+"'";
		List<Role> roles = super.listSql(sql);
		if(roles != null && roles.size()>0) {
			return roles.get(0);
		}else return null;
		
	}

}
