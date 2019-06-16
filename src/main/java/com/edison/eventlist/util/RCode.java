package com.edison.eventlist.util;

public enum RCode {
  OK(1, "Success"),
  INSERT_OK(2, "Insert Success"),
  UPDATE_OK(3, "Edit Success"),
  DELETE_OK(4, "Delete Success"),
  FAIL(-1, "Fail"),
  INSERT_FAIL(-2, "Insert Fail"),
  UPDATE_FAIL(-3, "Edit Fail"),
  DELETE_FAIL(-4, "Delete Fail");

  private int code;
  private String description;

  RCode(int code, String description) {
    this.code = code;
    this.description = description;
  }
  
  public boolean isOkay() {
    return code >= 0;
  }

  public int getCode() {
    return code;
  }

  public String getDescription() {
    return description;
  }
}
