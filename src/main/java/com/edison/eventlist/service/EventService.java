package com.edison.eventlist.service;

import java.util.List;
import com.edison.eventlist.model.Events;
import com.edison.eventlist.vo.EventsVO;

public interface EventService {

  List<Events> getEventSortPagination(int limit, int offset);
  
  void create(EventsVO eventVO);
}
