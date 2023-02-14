---
title: Tracking program investments in SQLite
date: 2023-02-13T18:19:47-07:00
tags: [sqlite, cte, hierarchical, data]
toc: true
series:
  - SQLite and Go
summary: 
mermaid: true
mathjax: false
draft: true
---

As part of learning more about [common table expressions (CTEs)][cte] in SQLite I chose to look at some complex queries I needed to make for a hierarchical data set of employees.
See the the first article in this series for the setup.

> NOTE: I recommend checking out my [Today I Learned][til] on SQLite schema work to learn more.

The basic premise in my Investment Tracker is that a Person can invest some percentage of their time, between 0% and 100%, in an Initiative.
An Initiative is a project or a program or any other bundle of work that a number of people, or parts of an organization, are working on ("investment their time in").
The is tracked as a Staff Investment of effort.
And to keep things organized, Investments can have tags like `enterprise` and `keep-the-lights-on`.

{{<mermaid>}}
erDiagram
    Person ||--o{ StaffInvestments : makes
    StaffInvestments ||--|| Initiative : invests-in
    Initiative }|--|{ Tags : has
{{</mermaid>}}

The actual schema in SQLite ended up like this for the raw data, meaning the data that comes from YAML.
```sql
CREATE TABLE people (
  id            TEXT  PRIMARY KEY,
  name          TEXT  NOT NULL,
  email         TEXT  NOT NULL,
  title         TEXT  NOT NULL,
  employee_type TEXT  NOT NULL,
  cost_center   TEXT  NOT NULL,
  manager       TEXT REFERENCES people(id)
);

CREATE UNIQUE INDEX idx_people_id
ON people (id);

CREATE INDEX idx_people_manager
ON people (manager);

CREATE TABLE initiatives (
  id  TEXT  PRIMARY KEY,
  name TEXT NOT NULL,
  url TEXT,
  description TEXT
);

CREATE UNIQUE INDEX idx_initiatives_id
ON initiatives(id);

CREATE TABLE tags (
  id  TEXT  PRIMARY KEY
);

CREATE UNIQUE INDEX idx_tag_id
on tags(id);

CREATE TABLE initiative_tags (
  initiative TEXT NOT NULL,
  tag TEXT NOT NULL,

  PRIMARY KEY(initiative, tag),
  FOREIGN KEY (initiative) REFERENCES initiatives(id),
  FOREIGN KEY (tag) REFERENCES tags(id)
);

CREATE INDEX idx_initiativetags_initiative
ON initiative_tags(initiative);

CREATE INDEX idx_initiativetags_tag
ON initiative_tags(tag);

CREATE TABLE staff_investments (
  initiative TEXT NOT NULL,
  person TEXT NOT NULL,
  investment REAL NOT NULL,

  PRIMARY KEY(initiative, person),
  FOREIGN KEY (initiative) REFERENCES initiatives(id),
  FOREIGN KEY (person) REFERENCES people(id)
);

CREATE INDEX idx_staffinvest_initiative
ON staff_investments(initiative);

CREATE INDEX idx_staffinvest_person
ON staff_investments(person);
```

[til]: {{< ref "til/2022-12-17/index.md" >}}
[cte]: https://www.sqlite.org/lang_with.html
