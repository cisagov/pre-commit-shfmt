# pre-commit-shfmt #

[![GitHub Build Status](https://github.com/cisagov/pre-commit-shfmt/workflows/build/badge.svg)](https://github.com/cisagov/pre-commit-shfmt/actions)

This is a [pre-commit](https://pre-commit.com) hook to format shell scripts
using the [`shfmt`](https://github.com/mvdan/sh#shfmt) tool.

## Available Hooks ##

| Hook name | Description                                      |
| --------- | ------------------------------------------------ |
| `shfmt`   | Format shell script files with the `shfmt` tool. |

## Usage ##

```yaml
repos:
  - repo: https://github.com/cisagov/pre-commit-shfmt
    rev: v0.0.1
    hooks:
      - id: shfmt
        args:
          - -i
          - '2'
```

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
