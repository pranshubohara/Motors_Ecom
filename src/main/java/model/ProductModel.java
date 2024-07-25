package model;

import java.io.Serializable;

public class ProductModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String PRODUCT_ID;
    private String PRODUCT_NAME;
    private String AVAILABILITY_STATUS;
    private String STOCK_LEVEL;
    private String CATEGORY_ID;
    private String PRICE;
    private String PRODUCT_DESCRIPTION;
    
    public ProductModel() {}
    
    public ProductModel(String product_id, String product_name, String availability_status, String stock_level, String category_id, String price, String product_description) {
        this.PRODUCT_ID = product_id;
        this.PRODUCT_NAME = product_name;
        this.AVAILABILITY_STATUS = availability_status;
        this.STOCK_LEVEL = stock_level;
        this.CATEGORY_ID = category_id;
        this.PRICE = price;
        this.PRODUCT_DESCRIPTION = product_description;
    }


    public String getCATEGORY_ID() {
		return CATEGORY_ID;
	}

	public void setCATEGORY_ID(String CATEGORY_ID) {
		this.CATEGORY_ID = CATEGORY_ID;
	}

	public String getPRODUCT_ID() {
        return PRODUCT_ID;
    }

    public void setPRODUCT_ID(String PRODUCT_ID) {
        this.PRODUCT_ID = PRODUCT_ID;
    }

    public String getPRODUCT_NAME() {
        return PRODUCT_NAME;
    }

    public void setPRODUCT_NAME(String PRODUCT_NAME) {
        this.PRODUCT_NAME = PRODUCT_NAME;
    }

    public String getAVAILABILITY_STATUS() {
        return AVAILABILITY_STATUS;
    }

    public void setAVAILABILITY_STATUS(String AVAILABILITY_STATUS) {
        this.AVAILABILITY_STATUS = AVAILABILITY_STATUS;
    }

    public String getSTOCK_LEVEL() {
        return STOCK_LEVEL;
    }

    public void setSTOCK_LEVEL(String STOCK_LEVEL) {
        this.STOCK_LEVEL = STOCK_LEVEL;
    }

    public String getPRICE() {
        return PRICE;
    }

    public void setPRICE(String PRICE) {
        this.PRICE = PRICE;
    }

    public String getPRODUCT_DESCRIPTION() {
        return PRODUCT_DESCRIPTION;
    }

    public void setPRODUCT_DESCRIPTION(String PRODUCT_DESCRIPTION) {
        this.PRODUCT_DESCRIPTION = PRODUCT_DESCRIPTION;
    }
}
