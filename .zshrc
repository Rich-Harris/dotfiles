release () {
    # there's probably a better way to do this
    VERSIONLINE="$(cat $PWD/package.json | grep version)"
    RIGHT=${VERSIONLINE#'  "version": "'}
    VERSION=${RIGHT%'",'}
    echo "Releasing $VERSION..."

    echo "Press enter to commit changes..."
    read enterKey
    git add -A
    git commit -m "-> v$VERSION"

    echo "Press enter to tag commit..."
    read enterKey
    git tag -a v$VERSION -m "version $VERSION"

    echo "Press enter to push..."
    read enterKey
    git push && git push origin v$VERSION

    echo "Press enter to publish to npm..."
    read enterKey
    npm publish
}

tempdir () {
    pwd=$PWD
    dir=`mktemp -d` && cd $dir
    echo "rm -rf \"$dir\" && echo \"done\"" > cleanup.sh
    chmod a+x cleanup.sh

    echo "run ./cleanup.sh to empty this directory once you're finished"
}

PROMPT="%(?:%{%}➜ :%{%}➜ ) %{$fg[cyan]%}%2d%{$reset_color%} $(git_prompt_info)"
