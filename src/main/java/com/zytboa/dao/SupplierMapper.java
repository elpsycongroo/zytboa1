package com.zytboa.dao;

import com.zytboa.vo.Supplier;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("supplierMapper")
public interface SupplierMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table supplier
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String supId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table supplier
     *
     * @mbggenerated
     */
    int insert(Supplier record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table supplier
     *
     * @mbggenerated
     */
    int insertSelective(Supplier record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table supplier
     *
     * @mbggenerated
     */
    Supplier selectByPrimaryKey(String supId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table supplier
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Supplier record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table supplier
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Supplier record);

    List<Supplier> selectByPage(@Param("pageMapQuery") Map map);

    int selectCount(@Param("hashMapQuery") Map map);

    int deleteSeleted(String[] supIds);
}