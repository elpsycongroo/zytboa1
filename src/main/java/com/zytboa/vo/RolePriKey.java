package com.zytboa.vo;

public class RolePriKey {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role_pri.role_id
     *
     * @mbggenerated
     */
    private String roleId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role_pri.pri_id
     *
     * @mbggenerated
     */
    private String priId;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_pri
     *
     * @mbggenerated
     */
    public RolePriKey(String roleId, String priId) {
        this.roleId = roleId;
        this.priId = priId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_pri
     *
     * @mbggenerated
     */
    public RolePriKey() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role_pri.role_id
     *
     * @return the value of role_pri.role_id
     *
     * @mbggenerated
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role_pri.role_id
     *
     * @param roleId the value for role_pri.role_id
     *
     * @mbggenerated
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role_pri.pri_id
     *
     * @return the value of role_pri.pri_id
     *
     * @mbggenerated
     */
    public String getPriId() {
        return priId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role_pri.pri_id
     *
     * @param priId the value for role_pri.pri_id
     *
     * @mbggenerated
     */
    public void setPriId(String priId) {
        this.priId = priId == null ? null : priId.trim();
    }
}