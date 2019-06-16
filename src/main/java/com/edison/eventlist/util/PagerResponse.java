package com.edison.eventlist.util;

import java.util.List;

public class PagerResponse<T> {

  private RCode rcode;
  private long pageCount;
  private List<T> body;

  public PagerResponse() {}

  public PagerResponse(RCode rcode) {
    this.rcode = rcode;
  }

  public PagerResponse(RCode rcode, long pageCount, List<T> body) {
    this.rcode = rcode;
    this.pageCount = pageCount;
    this.body = body;
  }

  public RCode getRcode() {
    return rcode;
  }

  public void setRcode(RCode rcode) {
    this.rcode = rcode;
  }

  public long getPageCount() {
    return pageCount;
  }

  public void setPageCount(long pageCount) {
    this.pageCount = pageCount;
  }

  public List<T> getBody() {
    return body;
  }

  public void setBody(List<T> body) {
    this.body = body;
  }
}
