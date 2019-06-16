package com.edison.eventlist.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.edison.eventlist.model.Events;
import com.edison.eventlist.repository.EventsRepository;
import com.edison.eventlist.util.RCode;
import com.edison.eventlist.util.TransformerUtil;
import com.edison.eventlist.vo.EventsVO;

@Service
public class EventServiceImpl implements EventService {

  @Autowired EventsRepository eventsRepository;

  @Override
  public List<Events> getEvents() {
    List<Events> eventList = (List<Events>) eventsRepository.findAll();
    return eventList;
  }

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

  @Override
  public RCode saveEvent(EventsVO event, HttpServletRequest request) {
    Events events = new Events();
    events = (Events) TransformerUtil.transformer(events, event);
    eventsRepository.save(events);
    return RCode.OK;
  }

  @Override
  public List<EventsVO> getEventList(HttpServletRequest request, Pageable pageable) {

    List<Events> event = eventsRepository.eventList(pageable);

    List<EventsVO> vo =
        StreamSupport.stream(
                Spliterators.spliteratorUnknownSize(event.iterator(), Spliterator.ORDERED), false)
            .map(this::transToVO)
            .collect(Collectors.toList());

    int to = Math.min(vo.size(), pageable.getPageSize() * (1 + pageable.getPageNumber()));

    return vo.size() == 0 || vo.size() <= pageable.getPageSize()
        ? vo
        : vo.subList((int) pageable.getOffset(), to);
  }

  public EventsVO transToVO(Events entity) {

    EventsVO vo = new EventsVO();
    vo = (EventsVO) TransformerUtil.transformer(vo, entity);

    return vo;
  }
}
