# Dictionary CLI
<!-- Description -->

**Table of Contents**
* [About](#about)
* [Development](#development)

<!--
[![Package Version](https://img.shields.io/hexpm/v/dictionary_cli)](https://hex.pm/packages/dictionary_cli)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/dictionary_cli/)

Further documentation can be found at <https://hexdocs.pm/dictionary_cli>.
-->

## About
This CLI uses Merriam-Webster's Collegiate Dictionary and Collegiate Thesaurus API's.

### Dictionary
Collegiate Dictionary Request URL
```
https://www.dictionaryapi.com/api/v3/references/collegiate/json/word?key=your-api-key
```
[Collegiate Dictionary API Documentation](https://dictionaryapi.com/products/api-collegiate-dictionary)

### Thesaurus
Collegiate Thesaurus Request URL
```
https://www.dictionaryapi.com/api/v3/references/thesaurus/json/word?key=your-api-key
```
[Collegiate Thesaurus API Documentation](https://dictionaryapi.com/products/api-collegiate-thesaurus)

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```
