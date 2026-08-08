
# 覆盖原生 ollama rm，增加确认步骤
ollama() {
  if [[ "$1" == "rm" ]]; then
    shift
    echo -n "⚠️ WARNING: You are going to DELETE model [$*], confirm? [y/N] "
    read ans
    if [[ "$ans" != "y" && "$ans" != "Y" ]]; then
      echo "Canceled."
      return 1
    fi
  fi
  command ollama "$@"
}