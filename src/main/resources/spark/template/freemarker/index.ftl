<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body>

<#include "nav.ftl">

<div class="body-wrapper">
    <div class="jumbotron homepage-hero-module">
        <div class="video-container">
            <!--
            <div class="container">
              <div><img src="/files/corphub-logo-only.png" width="190"></div>
              <h1>Work at CorpHub</h1>
              <p>Make an impact, win as a team and celebrate success in our fun, fast-paced environment. We're growing fast, which means unlimited opportunities for you to do your best work.</p>
            </div>
            -->
            <div class="title-container">
              <h1>Work at CorpHub</h1>
              <p>Make an impact, win as a team and celebrate success in our fun, fast-paced environment. We're growing fast, which means unlimited opportunities for you to do your best work.</p>
            </div>
            <div class="filter"></div>
            <video autoplay loop class="fillWidth">
                <source src="/files/Working-Space.mp4" type="video/mp4" />Your browser does not support the video tag. I suggest you upgrade your browser.
                <source src="/files/Working-Space.webmwebm" type="video/webm" />Your browser does not support the video tag. I suggest you upgrade your browser.
            </video>
            <div class="poster hidden">
                <img src="/files/Working-Space.jpg" alt="">
            </div>
        </div>
        <a class="arrow-wrap" href="#content">
          <span class="arrow"></span>
          <!--<span class="hint">scroll</span>-->
        </a>
    </div>

    <div class="container main-body">
      <h2><span class="glyphicon glyphicon-info-sign"></span> Open Positions</h2>
      <ul class="jobsList">
        <#list jobs as job>
          <li class="tile" onClick="location.href='/detail/${job.getSFid()}'; return false;">
            <h4 class="title">${job.getName()}</h4>
            <div class="location">${job.getLocation()}</div>
            <!--<div class="description">${job.getSubDescription()}...</div>-->
            <div><a href="#" class="btn btn-default">View Details</a></div>
          </li>
        </#list>
      </ul>
    </div>
</div>

<script>
//jQuery is required to run this code
$( document ).ready(function() {

    scaleVideoContainer();

    initBannerVideoSize('.video-container .poster img');
    initBannerVideoSize('.video-container .filter');
    initBannerVideoSize('.video-container video');

    $(window).on('resize', function() {
        scaleVideoContainer();
        scaleBannerVideoSize('.video-container .poster img');
        scaleBannerVideoSize('.video-container .filter');
        scaleBannerVideoSize('.video-container video');
    });

});

function scaleVideoContainer() {

    var height = $(window).height() + 5;
    var unitHeight = parseInt(height) + 'px';
    $('.homepage-hero-module').css('height',unitHeight);

}

function initBannerVideoSize(element){

    $(element).each(function(){
        $(this).data('height', $(this).height());
        $(this).data('width', $(this).width());
    });

    scaleBannerVideoSize(element);

}

function scaleBannerVideoSize(element){

    var windowWidth = $(window).width(),
    windowHeight = $(window).height() + 5,
    videoWidth,
    videoHeight;

    console.log(windowHeight);

    $(element).each(function(){
        var videoAspectRatio = $(this).data('height')/$(this).data('width');

        $(this).width(windowWidth);

        if(windowWidth < 1000){
            videoHeight = windowHeight;
            videoWidth = videoHeight / videoAspectRatio;
            $(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'});

            $(this).width(videoWidth).height(videoHeight);
        }

        $('.homepage-hero-module .video-container video').addClass('fadeIn animated');

    });
}
</script>

  <#include "footer.ftl">

</body>
</html>
