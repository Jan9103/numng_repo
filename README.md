# Numng Repo

This is a repository for [numng](https://github.com/Jan9103/numng).  
A overview / search can be found [here](https://jan9103.github.io/nushell_packages).

Config snippet for adding the repository:

```json
{
  "registry": [
    {"source_uri": "https://github.com/Jan9103/numng_repo", "package_format": "numng", "path_offset": "repo"}
  ]
}
```

Afterwards packages can be loaded by path in here. Example:

```json
{
  "depends": [
    {"name": "jan9103/nutils"}
  ]
}
```

**Notes:**
* Im not actively monitoring everything included for malware.
* This repo is licensed under the Unlicense (public domain with explicit "no warranty"), however most projects packaged here have a different license.
* The git-HEAD is available via `git`, but other versions might be missing.


## Structure

* the actual repository is within `repo` in order to keep the github view clean(er)
* `[author-name]/[project-name].json` in all lowercase (example: `jan9103/nutils.json`)
  * sometimes i added `/[subproject-name]` (example: `nushell/nu_scripts/math_module.json`)
  * **Note:** The package name is the same, but without the `.json` (example: `jan9103/nutils`)


## Contributing / Contact

If you

* want to have something added
* encountered a issue a package
* want your project to be removed
  * or want to be added to a blocklist

please open a issue or pull-request with all relevant information.

Also: For most of the included packages this is NOT a official distribution method.
Please keep this in mind before creating a issue upstream.

### Repo specific extra tags

* `:description`: A description
* `:tags`: A list of tags (`shell`, `script`, `lib`, `config`, `bin`, `prompt`, `completion`)
* `:status`: The project status (`alpha`, `active`, `archived`)
