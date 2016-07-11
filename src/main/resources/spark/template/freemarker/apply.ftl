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
    <h2><span onclick="setForm()">Applying for: ${job.getName()}</a></h2>
    <form action="apply" method="post">
      <input type="hidden" name="id" value="${job.getSFid()}">
      <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" name="name" id="name" placeholder="Your name" required>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Email</label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Your email address" required>
      </div>
      <div class="form-group">
        <label for="location">Location</label>
        <input type="text" class="form-control" name="location" id="location" placeholder="Your location (i.e. San Francisco, CA)" required>
      </div>
      <div class="form-group">
        <label for="resume">Resume</label>
        <textarea class="form-control" name="resume" id="resume" placeholder="Paste your resume here" cols="60" rows="10"></textarea>
      </div>
      <button type="submit" class="btn btn-lg btn-primary">Submit Application</button>
    </form>
  </div>
</div>
    <script>

function setForm() {
    $('#name').val(${name});
    $('#email').val(${email});
    $('#location').val(${location});
    $('#resume').val(decodeURIComponent(${resume}));
}

function capitalize(word) {
  str = word.toLowerCase().replace(/\b[a-z]/g, function(letter) {
      return letter.toUpperCase();
  });
  return str;
}
    </script>

    <#include "footer.ftl">
</body>
</html>
