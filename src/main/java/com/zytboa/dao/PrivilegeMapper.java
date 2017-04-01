package com.zytboa.dao;

import com.zytboa.vo.Privilege;

public interface PrivilegeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table privilege
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String priId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table privilege
     *
     * @mbggenerated
     */
    int insert(Privilege record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table privilege
     *
     * @mbggenerated
     */
    int insertSelective(Privilege record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table privilege
     *
     * @mbggenerated
     */
    Privilege selectByPrimaryKey(String priId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table privilege
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Privilege record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table privilege
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Privilege record);
}