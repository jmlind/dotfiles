function git_tag_log
  set last_tag (git describe --tags (git rev-list --tags --max-count=1))
  git log --pretty=format:"%h %s" "$last_tag"...master
  echo ''
  echo "latest tag: $last_tag"
end
