f = open('url_handler/raw_texmath_urls.txt',"r")
lines = f.readlines()#读取全部内容
list = []  ## 空列表, 将第i行数据存入list中
for i in range(0,lines.__len__(),1): #(开始/左边界, 结束/右边界, 步长)
    for word in lines[i].split():
         word=word.strip(" ")
         list.append(word)
    # print(list)
foldername = "texmath/"
# sed "s#http:\/\/texmath.koud#啊#g" test.html
# sed "s#http:\/\/texmath.koudaitiku.com\/cgi-bin\/mathtex.cgi?sign=#啊#g" test.html
for url in list:
    texmath_png = url.replace("http://texmath.koudaitiku.com/cgi-bin/mathtex.cgi?sign=","").replace("*","").replace("^","").replace("/","").replace("%","").replace("#","").replace("&","").replace("\\","").replace("{","").replace("}","").replace("=","").replace("_","").replace(".","")    
    print("sed  -i \"s#"+url.replace("\\","\\\\\\").replace("/","\\/") +"#"+foldername+texmath_png+"#"+"g\""+" *.html")
