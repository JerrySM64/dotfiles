{pkgs}:
pkgs.writeShellScriptBin "screenshotter" ''
    # Old code grim -g "$(slurp)" - | swappy -f -


  #
  # This script captures a screenshot of a user-selected area using grim and slurp.
  # It then passes the image to swappy for annotation and notifies you of success or failure.
  #

  # Define final destination for screenshots
  FINAL_DIR="$HOME/Pictures/Screenshots"
  mkdir -p "$FINAL_DIR"

  # Let the user select an area using slurp
  GEOMETRY=$(slurp)

  # If no geometry is returned, the selection was canceled
  if [ -z "$GEOMETRY" ]; then
      notify-send "No area selected; aborted." -u critical
      exit 1
  fi

  # Create a temporary file for the screenshot
  TMPFILE=$(mktemp --suffix=.png)

  # Capture the selected area using grim
  grim -g "$GEOMETRY" "$TMPFILE"
  if [ $? -ne 0 ]; then
      notify-send "Screenshot" "Failed! " -u critical
      rm -f "$TMPFILE"
      exit 1
  fi

  # Pass the screenshot to swappy or satty for editing/annotation
  #satty -f "$TMPFILE"
  swappy -f "$TMPFILE"
  SWAPPY_EXIT_CODE=$?

  if [ $SWAPPY_EXIT_CODE -eq 0 ]; then
      # If editing was successful, move the file to the final destination
      TIMESTAMP=$(date +'%Y-%m-%d-%H-%M-%S')
      FINAL_FILE="$FINAL_DIR/ScreenShot-$TIMESTAMP.png"
      mv "$TMPFILE" "$FINAL_FILE"
      notify-send "Screenshot" "$FINAL_FILE." -u normal -i "$FINAL_FILE"
  else
      notify-send "Screenshot canceled or failed." -u critical
      rm -f "$TMPFILE"
  fi



''

