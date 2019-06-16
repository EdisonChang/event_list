<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Event-List</title>
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />

    <!-- Bootstrap core CSS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- MomentJs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>

    <!-- bootstrap datetimepicker-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-bootstrap-datetimepicker/4.1.2/vue-bootstrap-datetimepicker.min.js"></script>

    <!-- ckeditor -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.8.0/ckeditor.js"></script>

    <!-- jquery-contextmenu -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.6.3/jquery.contextMenu.min.css" rel="stylesheet" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.6.3/jquery.contextMenu.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.6.3/jquery.ui.position.min.js" type="text/javascript"></script>

    <!-- vue related -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.4.2/vue.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-select/2.6.0/vue-select.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vuejs-paginate/1.6.0/index.js"></script>

    <!-- vee-validate -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vee-validate/2.0.3/vee-validate.min.js"></script>
    
    <script>
      const _ctx = '${ctx}';
    </script>
  </head>
  <body>
    <div id="event">
      <div class="row">
        <div class="col-sm-12">
          <table class="table table-bordered table-condensed">
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
              <tr v-for="event in events">
                <td>{{ event.title }}</td>
                <td>{{ event.description }}</td>
                <td>{{ event.startDate }}</td>
                <td>{{ event.endDate }}</td>
                <td>{{ event.category }}</td>
              </tr>
            </tbody>
          </table>
          <div style="text-align: center">
            <nav id="pagination_sty">
              <paginate 
                :page-count="pageCount"
                :container-class="'pagination'"
                :click-handler="paginationCallback"
                :force-page="pageIndex - 1"
                :prev-text="'❮'"
                :next-text="'❯'">
               </paginate>
             </nav>
           </div>
         </div>
       </div>
     </div>
  </body>
  
  <script>
    const vue = new Vue({
        el: "#event",
        data: {
        	events: [],
            pageCount: 0,
            pageSize: 5,
            pageIndex: 1,
            dataCount: "",
            msg: ""
        },
        components: {
            paginate: VuejsPaginate
        },
        mounted: function() {
            this.getEvents();
        },
        methods: {
            paginationCallback: function (pageIndex) {
                this.pageIndex = pageIndex;
                this.getEvents();
            },
            getEvents: function () {
                $.ajax({
                    url: _ctx + "/event/api/getEventList" +
                    "?size=" + this.pageSize + "&page=" + (this.pageIndex - 1),
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json"
                }).done(resp => {
                    this.events = resp.body;
                    this.pageCount = resp.pageCount;
                    this.dataCount = resp.body.length;
                }).fail((xhr, status, error) => {
                    this.error = jQuery.parseJSON(xhr.responseText);
                });
            }
        }
    });
	</script>
</html>