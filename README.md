# MoonBit syntax highlight

[![](https://img.shields.io/badge/license-MIT-brightgreen)](./LICENSE.txt)
[![](https://img.shields.io/badge/Sublime%20Text-4-ff9800)](https://www.sublimetext.com/blog/articles/sublime-text-4)

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./images/screenshot-dark.png">
    <source media="(prefers-color-scheme: light)" srcset="./images/screenshot-light.png">
    <img alt="screenshot" src="./images/screenshot-light.png">
  </picture>
</p>

## Install

- Via Package Control: search for `MoonBit`.
- Manual: clone this repo into your Sublime `Packages` folder.

## LSP Configuration

1. Make sure you have installed the sublime [LSP](https://github.com/sublimelsp/LSP) plugin.
2. Open `Preferences: LSP Settings` from the command palette.
3. Add a new LSP server to the `"clients"` field.

```jsonc
// Settings in here override those in "LSP/LSP.sublime-settings"
{
  "clients": {
    "moonbit-lsp": {
      "enabled": true,
      "command": ["/Users/yourname/.moon/bin/lsp-server.js"],
      "selector": "source.moonbit"
    }
  },
}
```

`"/Users/yourname/.moon/bin/lsp-server.js"` is the place where moonbit places its LSP server.
It is an executable on Mac/Linux. But on Windows you may need to change the `"command"` to something like

```jsonc
"command": ["node", "C:\\Users\\yourname\\.moon\\bin\\lsp-server.js"],
```

## License

MIT @ [hyrious](https://github.com/hyrious)
