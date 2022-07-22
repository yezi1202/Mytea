package com.shop.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.github.slugify.Slugify;
import com.shop.Entities.Role;
import com.shop.Entities.User;
import com.shop.conf.webfilelink;
import com.shop.dto.PagerData;
import com.shop.dto.SearchModel;

@Service
public class UserService extends BaseService<User> {
	private webfilelink link = new webfilelink();
	public String UPLOAD_FOLDER_ROOT = link.pathproject() + "/dulieu/";

	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<User> users = this.listSql(sql);

		if (users == null || users.size() <= 0) {
			return null;
		}
		return users.get(0);
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	@SuppressWarnings("unused")
	private boolean isRole(String role) {
		boolean a = true;
		if (role.length() > 0) {
			a = true;
		} else {
			a = false;
		}
		return a;
	}

	private boolean ispostpass(String pass) {
		boolean a = true;
		try {
			if (pass != null && pass.length() > 0) {
				a = true;
			} else {
				a = false;
			}
		} catch (Exception e) {
			a = false;
		}
		return a;
	}

	@Transactional
	public User add(User u, MultipartFile avatar, String pass, Set<Role> roles)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(avatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = "avatar/" + System.currentTimeMillis()
					+ new Slugify().slugify(subNameImg(avatar.getOriginalFilename()))
					+ subEImg(avatar.getOriginalFilename());

			// lưu avatar vào đường dẫn trên
			avatar.transferTo(new File(UPLOAD_FOLDER_ROOT + pathToFile));
			u.setAvata(pathToFile);
		} else {
			u.setAvata("img/av.png");
		}
		u.setPassword(new BCryptPasswordEncoder(4).encode(pass));
		if (roles != null) {
			for (Role role : roles) {
				u.addRoles(role);
			}
		}
		// lưu vào database
		return super.saveOrUpdate(u);
	}

	@Transactional
	public User update(User u, MultipartFile avatar, String pass, Set<Role> roles)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		User user = super.getById(u.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(avatar)) {
			// new File(UPLOAD_FOLDER_ROOT + user.getAvata()).delete();
			// xóa avatar trong folder lên
			if (!user.getAvata().equals("img/av.png")) {
				new File(UPLOAD_FOLDER_ROOT + user.getAvata()).delete();
			}
			String pathToFile = "avatar/" + System.currentTimeMillis()
					+ new Slugify().slugify(subNameImg(avatar.getOriginalFilename()))
					+ subEImg(avatar.getOriginalFilename());
			// lưu avatar vào đường dẫn trên
			avatar.transferTo(new File(UPLOAD_FOLDER_ROOT + pathToFile));
			u.setAvata(pathToFile);
		} else {
			// su dung lai avatar cu
			u.setAvata(user.getAvata());
		}

		if (ispostpass(pass)) {
			u.setPassword(new BCryptPasswordEncoder(4).encode(pass));
		} else {
			u.setPassword(user.getPassword());
		}
		if (roles != null && roles.size() > 0) {
			if (user.getRoles() != null && user.getRoles().size() > 0) {
				for (Role role : user.getRoles()) {
					user.deleteRole(role);
				}
			}
			for (Role role : roles) {
				u.addRoles(role);
			}
		} else {
			if (user.getRoles() != null && user.getRoles().size() > 0) {
				for (Role role : user.getRoles()) {
					u.addRoles(role);
					user.deleteRole(role);
				}
			}
		}

		// lưu vào database
		return super.saveOrUpdate(u);
	}

	public boolean isexistEmail(User user) {

		String sql = "select * from tbl_users u where u.email= '" + user.getEmail() + "'";
		List<User> users = this.listSql(sql);
		if (users != null && users.size() > 0) {
			return true;
		} else
			return false;

	}

	public boolean isexistUserName(User user) {
		String sql = "select * from tbl_users u where u.username= '" + user.getUsername() + "'";
		List<User> users = this.listSql(sql);
		if (users != null && users.size() > 0) {
			return true;
		} else
			return false;
	}

	public PagerData<User> search(SearchModel searchModel) {
		String sql = "SELECT * FROM tbl_users u  WHERE 1=1";
		if (searchModel != null) {
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (u.username like '%" + searchModel.keyword + "%'" + " or u.name like '%"
						+ searchModel.keyword + "%')";
			}

		}

		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
	}

	public String subNameImg(String path) {
		return path.substring(0, path.lastIndexOf("."));
	}

	public String subEImg(String path) {
		return path.substring(path.lastIndexOf("."), path.length());
	}
}
