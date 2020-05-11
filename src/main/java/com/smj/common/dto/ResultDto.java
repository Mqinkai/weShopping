package com.smj.common.dto;

/**
 * Created  on 2018/3/15.
 */
public class ResultDto {
    private String code; //1:成功
    private String message;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
