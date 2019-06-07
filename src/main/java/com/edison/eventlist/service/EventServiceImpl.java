package com.edison.eventlist.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.edison.eventlist.model.Events;
import com.edison.eventlist.repository.EventsRepository;
import com.edison.eventlist.util.TransformerUtil;
import com.edison.eventlist.vo.EventsVO;

public class EventServiceImpl implements EventService {

  @Autowired EventsRepository eventsRepository;

  @Override
  public List<Events> getEventSortPagination(int limit, int offset) {
    List<Events> eventList = eventsRepository.findEventsSortPagination(limit, offset);
    return eventList;
  }

  @Override
  public void create(EventsVO eventVO) {
	Events events = new Events();
	events = (Events) TransformerUtil.transformer(events, eventVO);
    eventsRepository.save(events);
  }
}
