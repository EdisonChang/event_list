<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Create Events</title>
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />

    <!-- Bootstrap core CSS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- MomentJs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>

    <!-- FulCalendar -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css"/>

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
    <div id="main_content">
      <div class="row">
        <div class="col-sm-12">
          <form id="commentForm" method="post" action="/create-event" novalidate="novalidate">
            <jsp:include page="form.jsp" />
            <div class="form-group">
              <div class="col-lg-offset-2 col-lg-10">
                <input id="submitBtn" type="button" class="btn-origin" @click="validateBeforeApply('submit')" value="Submit">
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <p v-show="msg != ''" v-html="msg">{{ msg }}</p>
          <div v-show="msg == 'Save Success'">
            <button type="button" onclick="location.href='/list'">Show Event List</button>
          </div>
        </div>
      </div>
    </div>
  </body>
  
  <script>
    Vue.use(VeeValidate);
    const vue = new Vue({
        el: "#main_content",
        data: {
            model: {
            	//id: "",
                title: "",
                description: "",
                startDate: moment().format('YYYY-MM-DD'),
                endDate: moment().format('YYYY-MM-DD'),
                category: ""
            },
            error: "",
            msg: "",
            from: "create"
        },
        mounted: function () {
            this.errors.clear();
        },
        methods: {
            validateBeforeApply: function (status) {
                this.msg = '';
                this.errors.clear();
                var check = true;
  
                this.$validator.validateAll().then((result) => {
                    if (result && check) {
                        this.saveEvent(status);
                    } else if (result == false) {
                        check = false;
                        this.msg += "validate";
                    }
                });
            },
            saveEvent: function (status) {
                this.msg = "";
                //this.model.content = CKEDITOR.instances.content.getData();
                //var formData = new FormData($("#commentForm")[0]);
                //formData.set("id", this.model.id);
                //formData.set("title", this.model.title);
                //formData.set("description", this.model.description);
                //formData.set("startDate", moment(this.model.startDate).format('YYYY/MM/DD'));
                //formData.set("endDate", moment(this.model.endDate).format('YYYY/MM/DD'));
                //formData.set("category", this.model.category);
                //console.log(formData);
                //if (this.model.id == ""){
                //	this.model.id = null;
                //}
                //console.log(this.model);
                //console.log(JSON.stringify(this.model));
                $.ajax({
                    url: _ctx + "/event/api/save",
                    type: 'POST',
                    data: JSON.stringify(this.model),
                    dataType: "json",
                    contentType: "application/json"
                }).done(resp => {
                	console.log(resp);
                	console.log(resp.code);
                    if (resp.code < 0) {
                    	this.msg = "Save fail!";
                    } else {
                        this.msg = "Save Success";
                    }
                }).fail((xhr, status, error) => {
                    this.error = jQuery.parseJSON(xhr.responseText);
                });
            }
        }
      });
    </script>
</html>