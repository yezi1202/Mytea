package com.shop.Service;

import java.io.File;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.github.slugify.Slugify;
import com.shop.Entities.Product;
import com.shop.conf.webfilelink;
import com.shop.dto.PagerData;
import com.shop.dto.SearchModel;
import com.shop.dto.sanPhamDb;

@Service
public class ProductService extends BaseService<Product> {
	private webfilelink link = new webfilelink();
	public String UPLOAD_FOLDER_ROOT = link.pathproject() + "/dulieu/";


	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	public List<Product> findAllHot() {
		sanPhamDb spdb = new sanPhamDb();
		// khởi tạo câu lệnh
		String sqlh = "SELECT * FROM tbl_products p WHERE is_hot = 1 ORDER BY RAND()";

		

		return listSql(sqlh);
	}


	public PagerData<Product> search(SearchModel searchModel,boolean eye) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			if (searchModel.categoryId != null && searchModel.categoryId > 0) {
				sql += " and category_id = " + searchModel.categoryId;
			}

			// tìm theo seo
			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo = '" + searchModel.seo + "'";
			}

			// tìm kiếm sản phẩm hot
			if (searchModel.isHot != null) {
				int m = searchModel.isHot ? 1 : 0;
				sql += " and p.is_hot = '" + m + "'";
			}
			if (searchModel.minpri != null) {
				sql += " and p.price > '" + searchModel.minpri + "'";
			}
			if (searchModel.maxpri != null) {
				sql += " and p.price < '" + searchModel.maxpri + "'";
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.title like '%" + searchModel.keyword + "%'" + " or p.detail_description like '%"
						+ searchModel.keyword + "%'" + " or p.short_description like '%" + searchModel.keyword + "%')";
			}
			// chi lay san pham chua xoa
			if(!eye) {
				sql += " and p.status=1";
			}
			//săp xếp sản phẩm
			if (searchModel.sapxep != null) {
				if (searchModel.sapxep == 1) {
					sql += " ORDER BY price ASC";
				} else if (searchModel.sapxep == 0) {
					sql += " ORDER BY price DESC";
				}
			}
		}
		
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());

	}

	@Transactional
	public Product add(Product p, MultipartFile productAvatar)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = "product/avatar/" + new Slugify().slugify(p.getTitle())
					+ System.currentTimeMillis() + subEImg(productAvatar.getOriginalFilename());

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(UPLOAD_FOLDER_ROOT + pathToFile));

			p.setAvatar(pathToFile);
		}
		
		// tạo seo
		p.setSeo(new Slugify().slugify(p.getTitle())+System.currentTimeMillis());

		// lưu vào database
		return super.saveOrUpdate(p);
	}

	@Transactional
	public Product update(Product p, MultipartFile productAvatar)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Product productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + productInDb.getAvatar()).delete();
			String pathToFile = "product/avatar/" + new Slugify().slugify(p.getTitle())
					+ System.currentTimeMillis() + subEImg(productAvatar.getOriginalFilename());

			// add avartar moi
			productAvatar.transferTo(new File(UPLOAD_FOLDER_ROOT + pathToFile));
			 p.setAvatar(pathToFile);
		} else {
			// su dung lai avatar cu
			 p.setAvatar(productInDb.getAvatar());
		}
		p.setSeo(productInDb.getSeo());
		// lưu vào database
		return super.saveOrUpdate( p);
	}

	@Override
	@Transactional
	public void delete(Product entity) {
		// TODO Auto-generated method stub
		try {
			if (entity.getAvatar() != null) {
				new File(UPLOAD_FOLDER_ROOT + entity.getAvatar()).delete();
			}
		} catch (Exception e) {

		} finally {
			super.delete(entity);
		}
		
		// xóa ảnh
		
	}
	public String subEImg(String path) {
		return path.substring(path.lastIndexOf("."),path.length());
	}
}
