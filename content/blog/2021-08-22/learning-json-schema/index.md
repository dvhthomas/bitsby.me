---
title: Learning JSON Schema
date: 2021-08-22T12:42:07-06:00
tags: [json, schema]
toc: true
series: []
summary: >
    JSON Schema is an old concept wrapped in a relatively new
    format. I learned a few things as I was defining a data model using JSON Schema.
mermaid: false
mathjax: false
draft: false
---

# Why JSON Schema?

TODO

## Learning resources

- [Official JSON Schema getting started guide](https://json-schema.org/learn/getting-started-step-by-step.html) is predictably good.
  The sample schemas and how they relate to each other made the URI reference approach really click.
- [Opis JSON Schema](https://opis.io/json-schema/2.x/). This is a PHP implementation so the language itself wasn't helpful.
  However, the documentation is incredible.
  For example the [`oneOf`](https://opis.io/json-schema/2.x/multiple-subschemas.html#oneof) sub-schema examples were a real 'Aha!' moment for me.
- [Pydantic JSON Schema code generation](https://pydantic-docs.helpmanual.io/usage/schema/). As we'll see in a minute, this turned out to be the golden ticket for me.

## Starting with Python

JSON itself is incredibly easy to understand.
Almost the entire specification is [captured in a few syntax diagrams](https://www.json.org/json-en.html).
But that's a far cry from understanding how to defined entire data models in JSON using a set of schema specification rules.
It's kind of like knowing how to spell words in English, then assuming you should 'just' understand the rules to writing a sonnet using the Shakespearean form.

I read the JSON Schema official guide and that got me oriented.
But I come more from a strongly typed (C#, Java, Go) background, and more recently Python.
So the examples, while helpful, were in the language of JSON Schema.

Because of that learning bias, I needed to start with, say, Python and model the schema using a language that comes naturally to me.
With that done, I could then see what resulting JSON Schema would look like if I code-generated the JSON from the Python.

### Pydantic

### Human readable documentation

{{% code file="schema_docs.py" lang="python" %}}

I just stick this into a `Makefile` so I can run it for multiple schemas if needed:

{{% code file="Makefile" lang="make" %}}
