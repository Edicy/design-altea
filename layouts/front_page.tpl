<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
{% include "SiteHeader" %}
  <title>{{site.name}} &gt; {{page.title}}</title>
</head>

<body>
	
	<div id="wrap">
   
   <div id="header" class="clearfix">
     {% editable site.header %}
     <div class="clearer"></div>
   </div> <!-- //header -->
   
   {% include "Langmenu" %}
   
   {% include "Mainmenu" %}
   
   <div id="content" class="clearfix">
     {% content %}
            <div class="clearer"></div>
   </div>
   
   
   <div id="footer" class="clearfix">
     {% content name="footer" xpage="true" %}
   </div> <!-- //footer -->
          <div>
   {% if site.search.enabled %}
   <form action="">
    <div id="search"><input type="text" class="textbox" id="onpage_search" /></div>
   </form>
   {% endif %}</div>
    <div class="right" id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
    <div class="clearer"></div>

    
  </div> <!-- //wrap -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
  {% include "JS" %}
</body>
</html>