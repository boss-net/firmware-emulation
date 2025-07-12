#!/bin/bash

SESSION_NAME="qemu-fw"
FIRMWARE=$1
LOG_DIR="./logs"
SCRIPT="./run.sh"

mkdir -p "$LOG_DIR"

if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "🛑 tmux session $SESSION_NAME already running."
    exit 1
fi

echo "📟 Starting QEMU session for $FIRMWARE..."

tmux new-session -d -s "$SESSION_NAME" "while true; do echo '🔁 Restarting QEMU...'; $SCRIPT $FIRMWARE 2>&1 | tee -a $LOG_DIR/$FIRMWARE.log; sleep 2; done"
tmux pipe-pane -t "$SESSION_NAME" -o "cat >> $LOG_DIR/$FIRMWARE.full.log"

echo "✅ QEMU running in tmux. Attach using:"
echo "   tmux attach -t $SESSION_NAME"
