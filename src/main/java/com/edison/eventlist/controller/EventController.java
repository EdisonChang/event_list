package com.edison.eventlist.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.edison.eventlist.model.Events;
import com.edison.eventlist.service.EventService;
import com.edison.eventlist.util.EventResponse;
import com.edison.eventlist.util.PagerResponse;
import com.edison.eventlist.util.RCode;
import com.edison.eventlist.vo.EventsVO;

@Controller
public class EventController {

  @Autowired private EventService eventService;

  private int defaultSize = 10;

  @GetMapping("/")
  public String index() {
    return "event";
  }

  @GetMapping(value = "/getEvents")
  public ModelAndView getEvents() {
    ModelAndView container = new ModelAndView("/views/event");
    List<Events> eventList = eventService.getEvents();
    container.addObject("eventList", eventList);
    return container;
  }

  @GetMapping(value = "/getEvents", headers = "api-version=1")
  public List<Events> getEvents(@RequestParam("page") int page, @RequestParam("size") int size) {
    if (size <= 0) size = defaultSize;
    int offset = (page * size) - size;
    List<Events> eventList = eventService.getEventSortPagination(size, offset);
    return eventList;
  }

  @GetMapping(value = "/create")
  @ResponseBody
  public ModelAndView createEvent() {
    ModelAndView container = new ModelAndView("/create-event");
    return container;
  }

  @GetMapping(value = "/list")
  @ResponseBody
  public ModelAndView listEvent() {
    ModelAndView container = new ModelAndView("/event-list");
    return container;
  }

  @GetMapping(value = "/create", headers = "api-version=1")
  @ResponseBody
  public boolean createEvent(@RequestBody EventsVO eventsVO) {
    eventService.create(eventsVO);
    return false;
  }

  @GetMapping(value = "/edit", headers = "api-version=1")
  @ResponseBody
  public boolean editEvent() {
    return false;
  }

  @GetMapping(value = "/delete", headers = "api-version=1")
  @ResponseBody
  public boolean deleteEvent() {
    return false;
  }

  @PostMapping("/event/api/save")
  @ResponseBody
  public EventResponse saveEvent(HttpServletRequest request, @RequestBody EventsVO vo) {
    RCode rCode = eventService.saveEvent(vo, request);
    return new EventResponse(rCode);
  }

  @GetMapping("/event/api/getEventList")
  @ResponseBody
  public PagerResponse<EventsVO> getEventList(HttpServletRequest request, Pageable pageable) {

    double count = eventService.getEventList(request, PageRequest.of(0, Integer.MAX_VALUE)).size();
    int pageCount = (int) Math.ceil(count / pageable.getPageSize());

    List<EventsVO> list = eventService.getEventList(request, pageable);

    return new PagerResponse<EventsVO>(RCode.OK, pageCount, list);
  }
}
