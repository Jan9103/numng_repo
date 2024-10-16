# This script is here to catch some common errors.

use std assert

def main [] {
  ^fd -e json | lines | each {|file|
    print $"checking ($file)"
    let entry = (open --raw $file | from json --strict)
    let fallback = ($entry | get -i "_" | default {})
    #print $"FALLBACK: ($fallback | to json --raw)"
    $entry
    | reject -i "_"
    | transpose k v
    | each {|v|
      let definition = ($fallback | merge $v.v)
      #print $"DEF ($definition | to json --raw)"
      check_definition $definition
    }
  }
  null
}

def check_definition [a: any]: nothing -> nothing {
  assert ("name" in $a)
  assert ("source_uri" in $a)
  assert ("package_format" in $a)  # in case something gets nupm packaging (-> prevent issues)
  assert ($a.package_format in ["numng", "packer.nu", "nupm"])
  assert (not ($a.name | str ends-with ".json"))  # common issue with my workflow
  if "build_command" in $a {assert ($a.build_command == "cargo build --release")}  # for now good for typo-checking
  $a.nu_plugins? | default [] | each {|plugin| assert ($plugin | str starts-with "target/release/nu_plugin_")}
  null
}
