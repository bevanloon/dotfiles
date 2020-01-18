alias mogit="mogrify -path /Users/bevanloon/Downloads/images/ -filter Triangle -define filter:support=2 -thumbnail 700 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip *.jpg"
set -x HOMEBREW_NO_ANALYTICS 1
abbr -a -g be bundle exec

# taken from brew info openssl - helps to eliminate errors when things compile against openssl
set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
