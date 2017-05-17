package com.bishe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.bishe.model.basemodel.BaseProduct;
import com.bishe.util.PageObject;

@Repository
public interface ProductDao {

	@Select("select * from product order by credit desc limit #{rownum} offset #{skip}")
	List<BaseProduct> getProductList(PageObject pageObject);
	
	@Update("update product set productid=#{productid},productname=#{productname},description=#{description},price=#{price},repertory=#{repertory},producttype=#{producttype},credit=#{credit} where productid=#{productid}")
	int updateProduct(BaseProduct product);
	
	@Delete("delete from product where productid=#{id}")
	int delectProduct(String id);
	
	@Insert("insert into product set productid=#{productid},productname=#{productname},description=#{description},price=#{price},repertory=#{repertory},producttype=#{producttype},credit=#{credit} ")
	int insertProduct(BaseProduct product);
}
