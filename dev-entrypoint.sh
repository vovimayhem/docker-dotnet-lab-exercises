#! /bin/sh

if [ -z "$1" ]; then set -- dotnet watch run "$@"; fi

if [ "$1" = "dotnet" ]
then
  # 2: Ensure we've got all the dependencies
  echo "=== Restoring packages..."
  dotnet restore

  if [ "$2" = "watch" ] && [ "$3" = "run" ]
  then
    # 3: Ensure we've got our database up to date:
    echo "=== Updating the database..."
    dotnet ef database update
  fi
fi

# dotnet watch run
exec "$@"
