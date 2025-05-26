---
layout: page
title: About
permalink: /about/
weight: 3
---

# **About Me**

Hi I am **{{ site.author.name }}**,<br>
Graduated from the University of Illinois with a Bachelor's in Information Sciences and a Minor in Game Studies and Design in Fall 2024. Currently working as an IT Auditor for a consulting firm while also involved in their internal software development team as a backend developer. Feel free to reach out to me with the links below!

<div class="row">
{% include about/skills.html title="Technical Skills" source=site.data.Game_Design-skills %}
{% include about/skills.html title="Other Skills" source=site.data.other-skills %}
{% include about/skills.html title="Data Skills" source=site.data.other-skills %}
</div>

<div class="row">
{% include about/timeline.html %}
</div>
