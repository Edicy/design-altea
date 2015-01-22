<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{article.title}} &laquo; {{page.title}} | {{site.name}}</title>
</head>

<body>
	
	<div id="wrap">
   
   <div id="header" class="clearfix">
     {% editable site.header %}
     <div class="clearer"></div>
   </div> <!-- //header -->
   
   {% include "Langmenu" %}
   
   {% include "Mainmenu" %}
   
   <div id="content">
           
        
            <div class="blog clearfix" data-search-indexing-allowed="true">
       <h1 data-search-indexing-allowed="false"><span class="gray">{{ article.created_at | format_date:"short" }}</span> {% editable article.title plain="true" %}</h1>
              {% editable article.excerpt %}<br /><br />
              {% editable article.body %}
              <div class="clearer"></div>
              <a name="comments"></a>
       </div>
            {% unless article.new_record? %}<h1>{{ "comments_for_count"|lc}}: <span class="gray edy-site-blog-comments-count">{{article.comments_count}}</span> </h1>{% endunless %}
            {% for comment in article.comments %}
              
              <div class="comment edy-site-blog-comment">
                 {{ comment.body }}  <b><span class="gray">{{ comment.created_at | format_date:"short" }}</span> <span class="blue">{{ comment.author }}</span></b>{% removebutton %} 
              </div>       
            {% endfor %}
     
   </div>
   
          <div class="comment-form">
     {% commentform %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
       <div>
           <h1>{{"add_a_comment"|lc}}</h1>
           
           <table>
             <tr>
               <td class="comment_label">{{ "name"|lc }}</td>
               <td><input type="text" class="textbox" name="comment[author]" value="{{ comment.author }}" /></td>
             </tr>
             <tr>
               <td class="comment_label">{{"email"|lc}}</td>
               <td><input type="text" class="textbox" name="comment[author_email]" value="{{comment.author_email}}" /></td>
             </tr>
             <tr>
               <td class="comment_label">{{ "comment"|lc}}</td>
               <td><textarea cols="7" rows="4" class="textarea" name="comment[body]">{{ comment.body }}</textarea></td>
             </tr>
             <tr>
               <td></td>
               <td><input type="submit" value="{{ "submit"|lc}}" class="submit" /></td>
             </tr>
           </table>
               
       </div>
      {% endcommentform %}
   </div>
   
   <div id="footer">
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