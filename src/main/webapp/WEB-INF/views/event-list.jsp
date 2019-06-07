<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Event-List</title>
  </head>
  <body>
    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Description</th>
          <th>Start Date/Time</th>
          <th>End Date/Time</th>
          <th>Category</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="goout in goouts">
          <td>{{ event.title }}</td>
          <td>{{ event.description }}</td>
          <td>{{ moment.unix(event.startTime).format("YYYY-MM-DD HH:mm:ss") }}</td>
          <td>{{ moment.unix(event.endTime).format("YYYY-MM-DD HH:mm:ss") }}</td>
          <td>{{ event.category }}</td>
        </tr>
      </tbody>
    </table>
  </body>
</html>