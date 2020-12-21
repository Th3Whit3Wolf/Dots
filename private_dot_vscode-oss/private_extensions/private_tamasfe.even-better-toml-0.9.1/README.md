

A TOML language support extension backed by [Taplo](https://taplo.tamasfe.dev).

It is currently a **preview extension**, it might contain bugs, or might even crash. If you encounter any issues, please report them [on github](https://github.com/tamasfe/taplo/issues).

- [Features](#features)
  - [TOML version 1.0.0-rc.3 support](#toml-version-100-rc3-support)
  - [Syntax highlighting](#syntax-highlighting)
    - [Extended Colors](#extended-colors)
  - [Semantic highlighting](#semantic-highlighting)
  - [Validation](#validation)
  - [Folding](#folding)
  - [Symbol tree and navigation](#symbol-tree-and-navigation)
  - [Formatting](#formatting)
  - [Completion and Validation with JSON Schema](#completion-and-validation-with-json-schema)
    - [Built-in schemas](#built-in-schemas)
  - [Commands](#commands)
    - [Copy Selection as JSON](#copy-selection-as-json)
    - [Paste as JSON](#paste-as-json)
- [Configuration File](#configuration-file)
- [Special Thanks](#special-thanks)

# Features

## TOML version [1.0.0-rc.3](https://toml.io/en/v1.0.0-rc.3) support

This extension will try to support all the TOML versions in the future.

## Syntax highlighting

Syntax highlighting for TOML documents with TextMate grammar.

![Syntax Highlighting](https://github.com/tamasfe/taplo/raw/master/highlight.png)

### Extended Colors

The extension defines custom scopes for array headers and arrays of tables.

In order to differentiate them from regular keys, you can set your own colors for them. Unfortunately this [has to be done manually](https://github.com/Microsoft/vscode/issues/32813).

You might also want to set a color for dates and times, as they don't have have one in most themes.

<details>
<summary>Custom color settings for the Dark+ theme</summary>

```json
{
  "editor.tokenColorCustomizations": {
      "textMateRules": [
          {
              "scope": "variable.key.table",
              "settings": {
                  "foreground": "#4EC9B0",
              },
          },
          {
              "scope": "variable.key.array",
              "settings": {
                  "foreground": "#569CD6",
              }
          },
          {
              "scope": "constant.other.time",
              "settings": {
                  "foreground": "#DCDCAA",
              }
          }
      ]
  },
}
```
</details>

![Extended Color Highlighting](https://github.com/tamasfe/taplo/raw/master/extended_colors.png)

## Semantic highlighting

Semantic key highlighting for inline tables and arrays can be enabled in the settings.

**You need to set extended colors in order for this to have any practical effect.**

![Semantic Highlighting](https://github.com/tamasfe/taplo/raw/master/semantic_colors.png)

## Validation

![Validation](https://github.com/tamasfe/taplo/raw/master/validation.gif)

## Folding

Arrays, multi-line strings and top level tables and comments can be folded.

![Folding](https://github.com/tamasfe/taplo/raw/master/folding.gif)

## Symbol tree and navigation

Works even for tables not in order.

![Symbols](https://github.com/tamasfe/taplo/raw/master/symbols.gif)

## Formatting

The formatter is rather conservative by default, additional features can be enabled in the settings. If you're missing a configuration option, feel free to open an issue about it!

![Formatting](https://github.com/tamasfe/taplo/raw/master/formatting.gif)

## Completion and Validation with [JSON Schema](https://json-schema.org/)

There is support for completion, hover text, links and validation.

Schemas can be associated with document URIs with the `evenBetterToml.schema.associations` configuration.

You can provide your own schemas or use the ones provided with the extension. More details [here](https://taplo.tamasfe.dev/configuration/#schemas). Schema submissions and fixes are welcome!

![Schema](https://github.com/tamasfe/taplo/raw/master/schema.gif)

### Built-in schemas

Several schemas are bundled with the extension, these can be turned off individually by removing their associations.

More information on the [website](https://taplo.tamasfe.dev/configuration/#built-in-schemas).

## Commands

Some commands are always in the palette, these can be hidden in the settings.

### Copy Selection as JSON

Copies the selected TOML text converted to JSON to the system clipboard.

### Paste as JSON

Parses the TOML text from the system clipboard and pastes it converted into JSON in the active selection.

# Configuration File

Taplo CLI's [configuration file](https://taplo.tamasfe.dev/configuration/#configuration-file) is supported and automatically found in workspace roots, or can be manually set in the VS Code configuration.

# Special Thanks

- To [@GalAster](https://github.com/GalAster) and [@be5invis](https://github.com/be5invis) for letting me use their TextMate grammar.
- To every contributor.
- And to everyone else using this extension.
