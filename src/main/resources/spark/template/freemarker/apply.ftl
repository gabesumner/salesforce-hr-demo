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
  $.ajax({
    url: 'https://randomuser.me/api/?nat=us',
    dataType: 'json',
    success: function(data){
      if(!data['error']){
        var user = data.results[0].user;
        $('#name').val(capitalize(user.name.first) + ' ' + capitalize(user.name.last));
        $('#email').val(user.email);
        $('#location').val(capitalize(user.location.city) + ", " + capitalize(user.location.state));
        $('#resume').val(decodeURIComponent('IT%20specialist%20whose%20qualifications%20include%20a%20degree%20in%20computer%20science%3B%20CISSP%2C%20MCSE%20and%20Security%2B%20designations%3B%20and%20detailed%20knowledge%20of%20security%20tools%2C%20technologies%20and%20best%20practices.%20Nine%20years%20of%20experience%20in%20the%20creation%20and%20deployment%20of%20solutions%20protecting%20networks%2C%20systems%20and%20information%20assets%20for%20diverse%20companies%20and%20organizations.%20%0D%0A%0D%0ATECHNOLOGY%20SUMMARY%0D%0A%0D%0A-%20Security%20Technologies%3A%20Retina%20Network%20Security%20Scanner%3B%20SSH%3B%20SSL%3B%20Digital%20Certificates%3B%20%0D%0A-%20Systems%3A%20Unix-Based%20Systems%20%28Solaris%2C%20Linux%2C%20BSD%29%3B%20Windows%20%28all%29%0D%0A-%20Networking%3A%20LANs%2C%20WANs%2C%20VPNs%2C%20Routers%2C%20Firewalls%2C%20TCP%2FIP%0D%0A-%20Software%3A%20MS%20Office%20%28Word%2C%20Excel%2C%20Outlook%2C%20Access%2C%20PowerPoint%29%0D%0A%0D%0AKEY%20SKILLS%0D%0A%0D%0A-%20Network%20%26%20System%20Security%0D%0A-%20Risk%20Management%0D%0A-%20Vulnerability%20Assessments%20%0D%0A-%20Authentication%20%26%20Access%20Control%0D%0A-%20System%20Monitoring%0D%0A-%20Regulatory%20Compliance%0D%0A-%20System%20Integration%20Planning%0D%0A-%20Multitier%20Network%20Architectures%0D%0A%0D%0AIT%20EXPERIENCE%0D%0A%0D%0A-%20XYZ%20Co.%2C%20Sometown%2C%20FL%2C%20Information%20Security%20Consultant%2C%202009-Present%0D%0A-%20ABC%20Co.%2C%20Sometown%2C%20TN%2C%20Senior%20Information%20Security%20Specialist%2C%202004-2008%0D%0A-%20123%20Co.%2C%20Sometown%2C%20FL%2C%20Information%20Security%20Specialist%2C%202002-2004%0D%0A-%20R%26R%20Ltd.%2C%20Sometown%2C%20FL%2C%20Network%20Administrator%2C%202000-2002%0D%0A-%20Became%20an%20expert%20in%20information%20systems%20security%20for%20multiple%20clients%20and%20employers.%20%0D%0A%0D%0AEDUCATION%0D%0A%0D%0AUniversity%20of%20Florida%2C%20Sometown%2C%20FL%0D%0ABS%20in%20Computer%20Science%2C%202000%0D%0A%0D%0ACREDENTIALS%0D%0A%0D%0A-%20CISSP%2C%202008%0D%0A-%20MCSE%2C%202008%0D%0A-%20Security%2B%2C%202007'));
      } else {
        // Error
      }
    }
  });
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
