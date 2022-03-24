import re, os, sys

radio_play="""

    <script>
        document.addEventListener('play', function(e){  
            var audios = document.getElementsByTagName('audio');  
            for(var i = 0, len = audios.length; i < len;i++){  
                if(audios[i] != e.target){  
                    audios[i].pause();  
                }  
            }  
        }, true);
    </script>

</body>
"""

def main(name):
    fh = open(name,encoding="utf-8") 
    text = ""
    for line in fh:
        text+=line
    fh.close()
    ofn = name.replace(".html","-audio.html")
    re_a = re.compile(r"<div class=\"source\"><a href=\"[^<]*\.m4a\">[^<]*\.m4a<\/a><\/div>")
    re_s = re.compile(r"href=\"(.*)\"")
    match = re_a.findall(text)
    for m in match:
        fn = re_s.search(m).group(1)
        d = os.path.dirname(fn)
        audio = f'<img src="{d}/yang.png" width="80px"><audio src="{fn}" type="audio/x-m4a" controls></audio>'
        text = text.replace(m,audio)

    text = text.replace("</body>",radio_play)
    fh = open(ofn, 'w', encoding='UTF-8')
    fh.write(text)
    fh.close()

if __name__=="__main__":
    if len(sys.argv)==2:
        main(sys.argv[1])
    else:
        print("\nUsage : fix_audio.py <html-file-name>\n")
    