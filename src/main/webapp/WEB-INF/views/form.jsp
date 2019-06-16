<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" name="id" v-model="model.id">
<input type="hidden" name="title" v-model="model.title">
<input type="hidden" name="description" v-model="model.description">
<input type="hidden" name="startTime" v-model="model.startTime">
<input type="hidden" name="endTime" v-model="model.endTime">
<input type="hidden" name="category" v-model="model.category">
<hr v-show="from == 'create'" class="small">
<div class="row">
    <div class="col-sm-12">
        <label class="col-sm-2">
            Title
        </label>
        <div class="col-sm-10">
            <input type="text" name="title" v-model="model.title" v-validate="'required'"
                  data-vv-as="Title"
                  data-vv-validate-on="none">
        </div>
    </div>
</div>
<hr class="small">
<div class="row">
    <div class="col-sm-12">
        <label class="col-sm-2">
            Description
        </label>
        <div class="col-sm-10">
            <input type="text" name="description" v-model="model.description" v-validate="'required'"
                  data-vv-as="Description"
                  data-vv-validate-on="none">
        </div>
    </div>
</div>
<hr class="small">
<div class="row">
    <div class="col-sm-12">
        <label class="col-sm-2">
            Start Time
        </label>
        <div class="col-sm-4">
          <div class="form-group">
            <div class='input-group date' id='datetimepicker1'>
              <input type='text' class="form-control" v-model="model.startDate" />
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
              </span>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          $(function () {
            $('#datetimepicker1').datetimepicker();
          });
        </script>
        <label class="col-sm-2">
            End Time
        </label>
        <div class="col-sm-4">
          <div class="form-group">
            <div class='input-group date' id='datetimepicker2'>
              <input type='text' class="form-control" v-model="model.endDate" />
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
              </span>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          $(function () {
            $('#datetimepicker2').datetimepicker();
          });
        </script>
    </div>
</div>
<hr class="small">
<div class="row">
    <div class="col-sm-12">
        <label class="col-sm-2">
            Category
        </label>
        <div class="col-sm-10">
            <input type="text" name="category" v-model="model.category" v-validate="'required'"
                  data-vv-as="Category"
                  data-vv-validate-on="none">
        </div>
    </div>
</div>
<hr class="small">
