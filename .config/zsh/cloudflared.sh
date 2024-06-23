#!/bin/zsh
CLOUDFLARED_PATH="$HOME/.cloudflared"

tunnel-create() {
    local NAME=$1
    local PORT=$2

    if [ -z "$NAME" ]; then
        echo "Usage: $0 <name> <port>"
        return 1
    fi

    local ID=$(cloudflared tunnel create "$NAME" | awk -F"id " '{print $2}' | tail -n 1)
    local FILE_PATH="$CLOUDFLARED_PATH/$NAME.yml"

    echo "url: http://localhost:$PORT
tunnel: $ID
credentials-file: $CLOUDFLARED_PATH/$ID.json" > "$FILE_PATH"

    cloudflared tunnel route dns "$ID" "$NAME"

    echo "cloudflared tunnel --config $FILE_PATH run $NAME"
}

tunnel-delete() {
    local NAME=$1

    if [ -z "$NAME" ]; then
        echo "Usage: $0 <name>"
        exit 1
    fi

    local FILE_PATH="$CLOUDFLARED_PATH/$NAME.yml"

    cloudflared tunnel delete $NAME

    rm "$CLOUDFLARED_PATH/$NAME.yml"
}

tunnel-run() {
    local NAME=$1

    if [ -z "$NAME" ]; then
        echo "Usage: $0 <name>"
        exit 1
    fi

    cloudflared tunnel --config "$CLOUDFLARED_PATH/$NAME.yml" run $NAME
}
