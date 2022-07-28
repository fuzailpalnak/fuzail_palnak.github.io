---
permalink: /code/
title: "Code & Data"
author_profile: true
redirect_from: 
  - /data
  - /downloads
  - /tinkering
---

Here you'll find downloads for various [software libraries/utilities](#software-utils)

{% assign dlist = site.downloads | where: "show", "true" %}
{% assign sw_list = dlist | where: "type", "software" %}
{% assign pub_list = dlist | where: "type", "publication-software" %}
{% assign data_list = dlist | where: "type", "dataset" %}

{% if sw_list.size > 0 %}
<h2 id="software-utils" class="dlheader">Software Utilities{% include scroll_top %}</h2>
<table class="dltable">
  <tbody>
    {% for entry in sw_list %}
      {% include downloadentry.html %}
    {% endfor %}
  </tbody>
</table>
{% endif %}

[comment]: <> ({% if pub_list.size > 0 %})

[comment]: <> (<h2 id="software-pubs" class="dlheader">Software from Publications{% include scroll_top %}</h2>)

[comment]: <> (<table class="dltable">)

[comment]: <> (  <tbody>)

[comment]: <> (    {% for entry in pub_list %})

[comment]: <> (      {% include downloadentry.html %})

[comment]: <> (    {% endfor %})

[comment]: <> (  </tbody>)

[comment]: <> (</table>)

[comment]: <> ({% endif %})

[comment]: <> ({% if data_list.size > 0 %})

[comment]: <> (<h2 id="datasets" class="dlheader">Published Datasets{% include scroll_top %}</h2>)

[comment]: <> (<table class="dltable">)

[comment]: <> (  <tbody>)

[comment]: <> (    {% for entry in data_list %})

[comment]: <> (      {% include downloadentry.html %})

[comment]: <> (    {% endfor %})

[comment]: <> (  </tbody>)

[comment]: <> (</table>)

[comment]: <> ({% endif %})
