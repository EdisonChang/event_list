package com.edison.eventlist.util;

import java.io.Serializable;

public class EventResponse implements Serializable {

  private static final long serialVersionUID = 1L;
  private int code;
  private String message;
  private Object body;

  public EventResponse(RCode rcode) {
    this.code = rcode.getCode();
    this.message = rcode.getDescription();
  }

  public EventResponse(RCode rcode, Object body) {
    this.code = rcode.getCode();
    this.message = rcode.getDescription();
    this.body = body;
  }

  public EventResponse(int code, String message) {
    this.code = code;
    this.message = message;
  }

  public EventResponse(int code, String message, Object body) {
    this.code = code;
    this.message = message;
    this.body = body;
  }

  public int getCode() {
    return code;
  }

  public void setCode(int code) {
    this.code = code;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Object getBody() {
    return body;
  }

  public void setBody(Object body) {
    this.body = body;
  }
}
