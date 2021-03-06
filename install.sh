#!/bin/bash

# Set source and target directories
powerline_fonts_dir=$( cd "$( dirname "$0" )" && pwd )

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.fonts"
  mkdir -p $font_dir
fi

# Copy all fonts to user fonts directory
find_command="find $powerline_fonts_dir -name '*.[o,t]tf' -o -name '*.pcf.gz' -type f"
eval $find_command | xargs -I % cp '%' $font_dir/

# Reset font cache on Linux
if [[ -n `which fc-cache` ]]; then
  fc-cache -f $font_dir
fi

echo "All Powerline fonts installed to $font_dir"
