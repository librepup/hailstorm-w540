#!/usr/bin/env bash
# g - Git Helper Function

g() {
  local cmd="$1"
  local arg="$2"
  case "$cmd" in
    e|execute)
      if [ -z "$arg" ]; then
        echo "Usage: g execute <recipe>"
        return 1
      fi
      if [[ "$arg" = "--help" || "$arg" = "help" || "$arg" = "h" || "$arg" = "recipes" ]]; then
        echo "Available recipes: init, push"
        return 0
      fi
      if [ "$arg" = "init" ]; then
        echo "[ Initializing Git and Switching to 'main' Branch ]"
        git init
        git branch -M main
        echo " "
        echo "[          Enter Repository URL         ]"
        echo "[ e.g. https://github.com/name/repo.git ]"
        read -p "URL> " repoLink
        if [ -z "$repoLink" ]; then
          return 1
        fi
        echo " "
        git remote add origin $repoLink
        echo "[ Initialized Repo ]"
      fi
      if [ "$arg" = "push" ]; then
        read -p "[ Add all Files in Directory to Repo? ] (y/n): " pushAddAnswer
        if [ "$pushAddAnswer" = "y" ]; then
          git add .
          git add *
          git add ./*
          echo "[ Added all Files in Current Directory ]"
        else
          echo "[ Pushing current State of Repo ]"
        fi
        echo " "
        read -p "[ Specify Branch? ('n' = 'main') ] (y/n) :" specifyBranch
        if [ "$specifyBranch" = "y" ]; then
          read -p "[ Enter Branch Name ]: " branchName
          git branch -M $branchName
        else
          branchName="main"
          git branch -M $branchName
        fi
        read -p "[ Enter Commit Message ]: " commitMessage
        git commit -m "$commitMessage"
        echo " "
        echo "[ Pushing... ]"
        git push -u origin $branchName
      fi
      ;;
    c|clone)
      if [ -z "$arg" ]; then
        echo "Usage: g clone <repo-url>"
        return 1
      fi
      git clone "$arg"
      ;;
    u|update)
      if [ -z "$arg" ]; then
        echo "g update adds a provided file to the git repo,"
        echo "and then tries to commit it."
        echo "Usage: g update <file>"
        return 1
      fi
      git add "$arg"
      printf "Commit Message: "
      read -r commitMessage
      git commit -m "$commitMessage"
      ;;
    p|push)
      git push -u origin main
      ;;
    n|new)
      git init
      ;;
    i|init)
      git init
      ;;
    a|add)
      if [ "$arg" = "all" ]; then
        git add .
      elif [ -z "$arg" ]; then
        echo "Usage: g add <file>|all"
        return 1
      else
        git add "$arg"
      fi
      ;;
    aa|addall)
      git add .
      git add *
      git add ./*
      echo "[ Added all Files ]"
      ;;
    s|status)
      echo "[ Status ]"
      git status
      echo "[ Remote Sources ]"
      git remote -v
      echo "[ Branches ]"
      echo "$(git branch --list)"
      ;;
    co|cm|commit)
      printf "[ Commit Message ]: ~> "
      read -r commitMessage
      if [ -z "$commitMessage" ]; then
        return 1
      fi
      git commit -m "$commitMessage"
      ;;
    h|help|"")
      cat <<EOF
g - git helper function

Usage:
  g c|clone <url>        Clone a repository
  g e|execute <recipe>   Execute pre-made recipes/instructions
  g u|update <file>      Add file and commit with prompt
  g p|push               Push to origin main
  g n|new                Initialize a new repository
  g i|init               Initialize a new repository
  g a|add <file>         Add a file
  g a|add all            Add all files
  g aa                   Add all files
  g co|cm|commit         Commit with specified Message
  g s|status             Show various status reports/infos
  g h|help               Show this help
EOF
      ;;
    *)
      echo "Unknown command: $cmd"
      echo "Run 'g help' for usage."
      return 1
      ;;
  esac
}
