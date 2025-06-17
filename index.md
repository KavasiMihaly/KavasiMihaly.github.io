---
layout: default
title: Home
---

<div class="home-intro">
  <p class="site-description">How to make Self-Service BI work – A blog for data analysts and decision makers</p>
  
  <div class="category-links">
    {% assign categories_list = site.categories | sort %}
    {% for category in categories_list %}
      <a href="{{ site.baseurl }}/category/{{ category[0] | slugify }}">{{ category[0] }}</a>{% unless forloop.last %} • {% endunless %}
    {% endfor %}
  </div>
</div>
