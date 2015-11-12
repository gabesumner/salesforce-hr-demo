<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body>

<#include "nav.ftl">

<div class="body-wrapper">
  <div class="container main-container">
    <div><a href="/">&lt; Return to career opportunities</a></div>
    <hr>
    <div class="row">
      <div class="col-md-8">
        <h2>${job.getName()}</h2>
        <h4>${job.getLocation()}</h4>
        <div>${job.getDescription()!}</div>
      </div>
      <div class="col-md-4" style="padding-top: 60px;">
        <a type="button" class="btn btn-lg btn-primary" style="width: 100%" href="/apply?id=${job.getSFid()}">Apply Now</a>
      </div>
    </div>
  </div>
</div>

<#include "footer.ftl">
</body>
</html>
