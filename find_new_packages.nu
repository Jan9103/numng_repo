def main [] {
  print (
    http get -H ["Accept" "application/vnd.github+json" "X-GitHub-Api-Version" "2022-11-28"] 'https://api.github.com/search/repositories?q=language:nushell&sort=updated'
    | get items
    | select full_name description created_at updated_at
    | where full_name !~ 'dot.?files|Jan9103'  # i wont add dotfiles and i know my own repos
    | update created_at {|i| $i.created_at | into datetime }
    | update updated_at {|i| $i.updated_at | into datetime }
    | where ((date now) - $it.created_at) < 60day  # github sorts by updated, not created
    | table  # mini-nu compatability
  )
}