---
title: Overview
layout: page
title: About
permalink: /overview/
weight: 3
---

# **Overview of Experience**

Hi I am **{{ site.author.name }}**,<br>
Graduated from the University of Illinois with a Bachelor's in Information Sciences and a Minor in Game Studies and Design in Spring 2024. Currently working as an IT Auditor for a consulting firm while also involved in their internal software development team as a python backend developer. Feel free to reach out to me with the links below!

<div class="row">
{% include about/skills.html title="Design // Development" source=site.data.Game_Design-skills %}
</div>

<div class="row">
{% include about/skills.html title="Python/Data Skills" source=site.data.data-skills %}
</div>

<div class="row">
{% include about/skills.html title="Programming Languages" source=site.data.other-skills %}
</div>

<div class="row">
{% include about/timeline.html %}
</div>

<embed src="{{ site.baseurl }}/assets/html/Resume_Updated.pdf" alt = "Resume" type="application/pdf" width="100%" height="600px" />
