package com.edison.eventlist.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.data.domain.Pageable;
import com.edison.eventlist.model.Events;
import com.edison.eventlist.util.RCode;
import com.edison.eventlist.vo.EventsVO;

public interface EventService {

  List<Events> getEvents();

  List<Events> getEventSortPagination(int limit, int offset);
  
  RCode saveEvent(EventsVO event, HttpServletRequest request);

  void create(EventsVO eventVO);
  
  public List<EventsVO> getEventList(HttpServletRequest request, Pageable pageable);
}
