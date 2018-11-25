url_handler="url_handler"
# python koudai_studypoints.py
if [  ! -d "$url_handler"  ];then mkdir "$url_handler";fi
if [  ! -d texmathpics  ];then mkdir texmathpics;fi
if [  ! -d png-jpeg-pics  ];then mkdir png-jpeg-pics;fi
#tex里的不容易匹配（乱了）　html清楚不容易混淆
# grep -o 'http://texmath.koudaitiku.com/[^"]*' 03794-TCP可靠传输.html
# grep -o 'http://texmath.koudaitiku.com/[^\][^"]*}' studypoints_html/*.html > $url_handler"/find_texmath_urls_in_html.txt"
grep -o 'http://texmath.koudaitiku.com/[^"]*' studypoints_html/*.html > $url_handler"/find_texmath_urls_in_html.txt"
# 先把html里面的链接换了再转tex
sed 's/http/\n&/g;s/^[^\n]*//;s/\n//g'  $url_handler"/find_texmath_urls_in_html.txt" > $url_handler"/raw_texmath_urls.txt"
python replace_html_math.py > $url_handler"/replace_texmath_in_html.sh"
python generate_wget.py > texmathpics/get_texmath.sh
# cd texmathpics && bash get_texmath.sh && cd ..

cp $url_handler"/replace_texmath_in_html.sh" "studypoints_html/"
cd "studypoints_html/"
bash replace_texmath_in_html.sh
cd ..

grep -o 'http://[^"]*.peg' studypoints_html/*.html > $url_handler"/tmp_png_peg_url.txt"
grep -o 'http://[^"]*.png' studypoints_html/*.html >>  $url_handler"/tmp_png_peg_url.txt"
grep -o 'http://[^"]*.peg' $url_handler"/tmp_png_peg_url.txt"  >  $url_handler"/png_peg_url.txt"
grep -o 'http://[^"]*.png' $url_handler"/tmp_png_peg_url.txt"  >>  $url_handler"/png_peg_url.txt"
rm $url_handler"/tmp_png_peg_url.txt"
cp $url_handler"/png_peg_url.txt" "png-jpeg-pics/"
# rename 's/\.peg/\.jpeg/' *

