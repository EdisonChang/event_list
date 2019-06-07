package com.edison.eventlist.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.edison.eventlist.model.Events;

public interface EventsRepository extends CrudRepository<Events, String> {
	
	@Query(value = "SELECT * FROM events order by contract_id limit ?2 offset ?3", nativeQuery = true)
	public List<Events> findEventsSortPagination(int limit, int offset);
}
