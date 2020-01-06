package com.ruoyi.project.tool.gen.domain;


public class ImportExcelFile {
    private String orderId;
    private String orderName;
    private String orderType;
    public String getOrderId() {
        return orderId;
    }
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    public String getOrderName() {
        return orderName;
    }
    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }
    public String getOrderType() {
        return orderType;
    }
    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }
    @Override
    public String toString() {
        return "ImportExcelFile [orderId=" + orderId + ", orderName="
                + orderName + ", orderType=" + orderType + "]";
    }

}