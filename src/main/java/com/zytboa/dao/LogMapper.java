package com.zytboa.dao;

import com.zytboa.vo.Log;

public interface LogMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String logId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    int insert(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    int insertSelective(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    Log selectByPrimaryKey(String logId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Log record);
}