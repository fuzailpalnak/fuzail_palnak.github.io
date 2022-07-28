---
title: "Publications"
permalink: /publications/
redirect_from: 
  - /papers
author_profile: true
---
{% include base_path %}
{% assign author = site.author %}

Here you'll find a list of my publications, including [conference & journal papers](#cjproc)

<table class="iconsummary" align="center">
  <tr>
    <td class="isicon"><i class="fa fa-file-pdf withpuburl"></i></td><td class="istxt">Author's preprint</td>
    <td class="isicon"><i class="fa fa-book-open withpuburl"></i></td><td class="istxt">Publisher's version</td>
    <td class="isicon"><i class="fa fa-file-alt withpuburl"></i></td><td class="istxt">Supplemental material</td>
  </tr>
  <tr>
    <td class="isicon"><i class="fa fa-desktop withpuburl"></i></td><td class="istxt">Presentation</td>
    <td class="isicon"><i class="fa fa-video withpuburl"></i></td><td class="istxt">Video</td>
    <td class="isicon"><i class="fa fa-link withpuburl"></i></td><td class="istxt">BibTeX</td>
  </tr>
  <tr>
    <td class="isicon"><i class="fa fa-database withpuburl"></i></td><td class="istxt">Data</td>
    <td class="isicon"><i class="fa fa-code withpuburl"></i></td><td class="istxt">Software</td>
    <td class="isicon"><i class="fa fa-globe-americas withpuburl"></i></td><td class="istxt">External URL</td>
  </tr>
</table>

{% comment %}
Find min/max publication year
{% endcomment %}
{% assign pub_max_year = 0 %}
{% assign pub_min_year = 9999 %}
{% for pub in site.pubs %}
  {% if pub.year > pub_max_year %}
    {% assign pub_max_year = pub.year %}
  {% endif %}
  {% if pub.year < pub_min_year %}
    {% assign pub_min_year = pub.year %}
  {% endif %}
{% endfor %}

<h2 id="cjproc" class="pubheader">Conferences &amp; Journals{% include scroll_top %}</h2>
{% for pub_year in (pub_min_year..pub_max_year) reversed %}
  {% assign pubs_per_year = site.pubs | where: "year", pub_year %}
  {% if pubs_per_year.size > 0 %}
<h3>{{ pub_year }}{% include scroll_top %}</h3>
<table class="pubtable">
  <tbody>
    {% for pub in pubs_per_year reversed %}
      {% include pubentry.html %}
    {% endfor %}
  </tbody>
</table>
  {% endif %}
{% endfor %}

{% comment %}
<h2 id="cjproc" class="pubheader">Conferences &amp; Journals{% include scroll_top %}</h2>
<table class="pubtable">
  <tbody>
    {% for pub in site.pubs reversed %}
      {% include pubentry.html %}
    {% endfor %}
  </tbody>
</table>
{% endcomment %}

[comment]: <> (<h2 id="chg" class="pubheader">Visual Object Tracking Challenges{% include scroll_top %}</h2>)

[comment]: <> (<table class="pubtable">)

[comment]: <> (  <tbody>)

[comment]: <> (    {% for pub in site.pubs_workshops reversed %})

[comment]: <> (      {% include pubentry.html %})

[comment]: <> (    {% endfor %})

[comment]: <> (  </tbody>)

[comment]: <> (</table>)


<h2 id="theses" class="pubheader">Theses{% include scroll_top %}</h2>

<table class="pubtable" id="thesistable">

  <tbody>

    {% for pub in site.theses reversed %}

      {% include pubentry.html %}

    {% endfor %}

  </tbody>

</table>


<script>
  function toggle_bib(id) {
    var bib_span = document.getElementById(id);
    var tcell = document.getElementById(id + '-pubinfo')

    if (bib_span.style.display == 'block') {
      bib_span.style.display = 'none';
      tcell.onclick = function() { toggle_bib(id); };
    } else {
      bib_span.style.display = 'block';
      tcell.onclick = null; // Disable toggle via cell-click (so you can copy the bibentry)
    }
  }
</script>
