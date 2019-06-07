package com.edison.eventlist.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.edison.eventlist.model.Events;
import com.edison.eventlist.service.EventService;
import com.edison.eventlist.vo.EventsVO;

@Controller
public class EventController {

  @Autowired private EventService eventService;

  private int defaultSize = 10;

  @GetMapping("/")
  public String index(Map<String, Object> model) {
    model.put("ID", 111);
    return "index";
  }

  @GetMapping(value = "/getEvents", headers = "api-version=1")
  public List<Events> getEvents(@RequestParam("page") int page, @RequestParam("size") int size) {
    if (size <= 0) size = defaultSize;
    int offset = (page * size) - size;
    List<Events> eventList = eventService.getEventSortPagination(size, offset);
    return eventList;
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
}
