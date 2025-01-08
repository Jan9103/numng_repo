# Numng Repo - EXTRA

This is a repository for [numng](https://github.com/Jan9103/numng).

This extra branch contains things, which are not really supposed to be managed by numng.  
Mainly programs i use on my pc's and want to have automated updates for.  
Do not expect any support of any kind.

Config snippet for adding the repository:

```json
{
  "registry": [
    {"source_uri": "https://github.com/Jan9103/numng_repo", "package_format": "numng", "path_offset": "repo", "git_ref": "extra"}
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
* This repo is licensed under the Unlicense (public domain with explicit "no warranty"), however included projects might have a different license.
* The git-HEAD is available via `git`, but other versions might be missing.


## Structure

* the actual repository is within `repo` in order to keep the github view clean(er)
* `[author-name]/[project-name].json` in all lowercase (example: `jan9103/nutils.json`)
  * sometimes i added `/[subproject-name]` (example: `nushell/nu_scripts/math_module.json`)
  * **Note:** The package name is the same, but without the `.json` (example: `jan9103/nutils`)


## Contributing / Contact

If you

* want to have something added
* encountered a issue with loading of a package
* want your project to be removed

please open a issue or pull-request with all relevant information.

Also: For most of the included packages this is NOT a official distribution method.
Please keep this in mind before creating a issue upstream.
