grep -o 'http://texmath.koudaitiku.com/[^\][^"]*}' *.html
python replace_texmath.py > replace_in_tex.sh