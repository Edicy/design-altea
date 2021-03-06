<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{site.name}} &gt; {{page.title}}</title>
</head>

<body>
	<div id="wrap" class="content-hyphenate">
   
   <div id="header" class="clearfix">
     {% editable site.header %}
     <div class="clearer"></div>
   </div> <!-- //header -->
   
   {% include "Langmenu" %}
   
   {% include "Mainmenu" %}
   
   <div id="content">
     {% addbutton class="add-article" %}
     
            {% for article in articles %}
        
              <div class="blog clearfix">
         <h1><span class="gray">{{ article.created_at | format_date:"short" }}</span> <a href="{{ article.url }}">{{ article.title }}</a></h1>
                {{ article.excerpt }} <a href="{{ article.url }}">{{ "read_more" | lc }}</a> <a href="{{ article.url}}#comments">({{"comments_for_count" |lc }}: {{article.comments_count}})</a>
         </div>
            {% endfor %}
     
   </div>
   
   <div id="bottomgif">
   </div> 
   
   
   <div id="footer" class="clearfix">
     {% content name="footer" xpage="true" %}
   </div> <!-- //footer -->
          <div>
   {% if site.search.enabled %}
   <form action="" class="edys-search">
    <div id="search"><input type="text" class="textbox" id="onpage_search" placeholder="{{  "search" | lc }}" /></div>
   </form>
   {% endif %}</div>
    <div class="right" id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
    <div class="clearer"></div>
    
  </div> <!-- //wrap -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
  {% include "JS" %}
</body>
</html>