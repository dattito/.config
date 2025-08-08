set CLOUDFLARED_PATH "$HOME/.cloudflared"

function tunnel-create
    set -l NAME $argv[1]
    set -l PORT $argv[2]

    if test -z "$NAME" -o -z "$PORT" # Check if either NAME or PORT is empty
        echo "Usage: tunnel-create <name> <port>"
        return 1
    end

    set -l ID (cloudflared tunnel create "$NAME" | awk -F"id " '{print $2}' | tail -n 1)
    set -l FILE_PATH "$CLOUDFLARED_PATH/$NAME.yml"

    echo "url: http://localhost:$PORT
tunnel: $ID
credentials-file: $CLOUDFLARED_PATH/$ID.json" > "$FILE_PATH"

    cloudflared tunnel route dns "$ID" "$NAME"

    echo "cloudflared tunnel --config $FILE_PATH run $NAME"
end

function tunnel-delete
    set -l NAME $argv[1]

    if test -z "$NAME"
        echo "Usage: tunnel-delete <name>"
        return 1
    end

    set -l FILE_PATH "$CLOUDFLARED_PATH/$NAME.yml"

    cloudflared tunnel delete $NAME

    rm "$CLOUDFLARED_PATH/$NAME.yml"
end

function tunnel-run
    set -l NAME $argv[1]

    if test -z "$NAME"
        echo "Usage: tunnel-run <name>"
        return 1
    end

    cloudflared tunnel --config "$CLOUDFLARED_PATH/$NAME.yml" run $NAME
end
