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
draft: true
---

## Why JSON Schema?

The most basic reason for defining a schema is to created a shared understanding of what is considered acceptable between two systems.
If I am calling an API or making a remote procedure call (RPC) then it saves everyone a whole lot of hassle if we agree on what the remote system is equipped to handle.

### An aside on Data vs. API

To be crystal clear I **am not** talking about an API definition here.
In that case I'd probably be writing about [OpenAPI](https://spec.openapis.org/oas/latest.html) which is governed by the [OpenAPI Initiative](https://www.openapis.org/).
_That_ is about building APIs in a schema-first way.

Since I _am_ primarily concerned with a data schema and _am not_ the API used to work with that data schema, then Open API is just not the right tool.

Think about Microsoft Excel files.

I don't need to specify _how_ the application (Open Office or Microsoft Excel or Apple Numbers) will consume via their own internal 'API'.
But I _do_ care deeply that the data structure of the Excel file format is extremely well documented and consistent.

What-not-how is a helpful way---for me at least---to decide when to use OpenAPI (how and what) vs. JSON Schema (just what).

That's what I am working on right now: more of a file format or standard data interchange specification.
So JSON Schema fits and Open API does not.

(Even then, Open API does advertise itself as JSON Schema compatible. That's not strictly true today but there's ongoing work to get there.)

To look at a simple OpenAPI schema, check out [World Time API](http://worldtimeapi.org/pages/schema).

### Back to the 'what' of JSON Schema

So I need to define a data format (or if you prefer, a message or payload format) so that two or more systems can agree that the data is either compatible with said schema, or not compatible.

What are the options? (spoiler: JSON Schema is a pretty good option!)

#### XML a.k.a. 'angle brackets'

Back in the old days ('naught-ies' and twenty-teens) this would have been done using an [XML Schema Definition (XSD)](https://www.w3.org/TR/xmlschema11-1/) document.
But in the 2020s JavaScript rules and JSON is the _lingua franca_ of the computer systems everyone, so JSON it is.

There's nothing inherently wrong with XML, but it is pretty verbose, and given that JSON Schema basically _is_ JSON with some rules, it's generally a lot less effort than 'parsing angle brackets'.

But not so fast.
Even today there are widespread and viable alternatives.

#### Protocol Buffers a.k.a C-if-you-squint-a-bit

Top of mind for me is probably [Protocol Buffers](https://developers.google.com/protocol-buffers).
It's not like I was doing this hands-on when I was at Google, but I certainly came across `*.proto` or `*.pb` files aplenty.

And 'protos' are really prevalent as a way to describe highly efficient binary messages payloads in RPC systems.
They are strongly typed and take versioning seriously, plus there's support for composition once you start needing reuse.

So why not use protobufs?
We've had some recent experience on my team working with protobufs in purely client-side code and it just seemed pretty heavy and 'non-obvious' for the JavaScript or TypeScript environment.

I will say, thought, that the `protoc` ability to [generated JavaScript RPC client libraries from protobuf files](https://developers.google.com/protocol-buffers/docs/reference/javascript-generated) is pretty sweet.

#### ServiceStack for the .NET crowd

Another aside: I wouldn't generally start with a .NET toolkit these days.
Nothing wrong with .NET at all and most of my heavy programming was with C#.
However, most engineers we work with already have a JavaScript compiler on their machine and most do not have .NET.
Simple as that.

But...the strong opinion in the entire ServiceStack framework is that of 'message-first' development.
And if you read even the slightest bit of their [ethos around using data transfer objects (DTOs)](https://docs.servicestack.net/why-remote-services-use-dtos), you quickly see the Martin Fowler influence.
And I personally like that influence for the clarity it brings to system integration.

In addition, they have a similar approach to Protocol Buffers for generating [client libraries](https://docs.servicestack.net/clients-overview) for mutiple languages.
So while this is not a good fit for my current team based on using stuff they already use, Service Stack is one to keep an eye on.

Now where was I...?

Right: JSON Schema as a way to define messages/DTOs/data structures.

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

TODO

### Human readable documentation

{{% code file="schema_docs.py" lang="python" %}}

I just stick this into a `Makefile` so I can run it for multiple schemas if needed:

{{% code file="Makefile" lang="make" %}}

And that gives me a nice way to spit out some HTML to look at:

```sh
❯ make
python3 docs/schema_docs.py --schema data
Created output/data.html...
Created output/data.md...
python3 docs/schema_docs.py --schema config
Created output/config.html...
Created output/config.md...
```
