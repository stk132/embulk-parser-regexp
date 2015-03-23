# Regexp parser plugin for Embulk

TODO: Write short description here and embulk-parser-regexp.gemspec file.

## Overview

* **Plugin type**: parser
* **Guess supported**: no

## Configuration

- **format**: regular expression (string, required)
- **field_types**: field name and field type array (array, required)

## Example

```yaml
in:
  type: any file input plugin type
  parser:
    type: regexp
    format: '^(?<host>[^ ]*) [^ ]* (?<user>[^ ]*) \[(?<time>[^\]]*)\] "(?<method>\S+)(?: +(?<path>[^\"]*?)(?: +\S*)?)?" (?<code>[^ ]*) (?<size>[^ ]*)(?: "(?<referer>[^\"]*)" "(?<agent>[^\"]*)")?$'
    field_types:
      - {name: host, type: string}
      - {name: user, type: string}
      - {name: time, type: timestamp}
      - {name: method, type: string}
      - {name: path, type: string}
      - {name: code, type: string}
      - {name: size, type: string}
      - {name: referer, type: string}
      - {name: agent, type: string}
```

## Build

```
$ rake
```
