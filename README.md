<div align="center">
  <img alt="Logo" src="logo.svg" height="100"/>
  <h1>Cytrus</h1>
  <p>Watch and merge <a href="https://cytrus.cdn.ankama.com/cytrus.json">cytrus.json</a> changes</p>
</div>

> [!TIP]
> Use [jq](https://github.com/jqlang/jq) to process JSON from command-line.
>
> **Example**
>
> ```
> curl -s https://raw.githubusercontent.com/dofera/cytrus/main/cytrus.json | jq .games.retro.platforms.linux.main
> ```

## Contributing

Feel free to populate the [cytrus.json](https://raw.githubusercontent.com/dofera/cytrus/main/cytrus.json) file if you have any missing data.
