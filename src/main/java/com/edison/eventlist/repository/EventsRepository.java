package com.edison.eventlist.repository;

import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.edison.eventlist.model.Events;

public interface EventsRepository extends CrudRepository<Events, String> {

  @Query(value = "SELECT * FROM events order by id limit ?2 offset ?3", nativeQuery = true)
  public List<Events> findEventsSortPagination(int limit, int offset);

  @Query(value = "SELECT e FROM Events e order by e.id desc")
  List<Events> eventList(Pageable pageable);
}
