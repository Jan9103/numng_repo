def main [] {
  cd repo
  for json_file in (glob '**/*.json') {
    let json = (open $json_file)
    if "latest" in $json {
      continue  # this repo does no manual versioning for this package
    }
    if ($json | get -i _.':status') == "archived" {
      continue
    }
    if $json._.source_uri !~ '^https://github.com/' {
      continue
    }
    let latest = (github_get_latest_tag $json._.source_uri)
    if ($json | transpose k v | where $it.v.git_ref? == $latest) == [] {
      print $'($json_file) has a new release: ($latest)'
    }
  }
}

def github_get_latest_tag [repo_url: string]: nothing -> string {
  let parsed = ($repo_url | parse 'https://github.com/{author}/{repo}' | get 0?)
  if $parsed == null { return null }
  if '/' in $parsed.repo { return null }
  try {
    http get -H [
      "Accept" "application/vnd.github+json"
      "X-GitHub-Api-Version" "2022-11-28"
      "User-Agent" "numng_repo upstream update finder <https://github.com/Jan9103/numng_repo/blob/main/find_upstream_updates.nu>"
    ] $'https://api.github.com/repos/($parsed.author)/($parsed.repo)/git/matching-refs/tags'
    | get ref
    | str replace --all '_' '.'  # nu 0_5_0 is otherwise newer than 0.100.0 (yay mixed semver)
    | where $it !~ 'dev'  # filter out cablehead's CI system
    | sort --natural
    | last
    | parse 'refs/tags/{tag}'
    | get 0.tag
  } catch { return null }
}
