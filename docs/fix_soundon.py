import re, sys

re_a = re.compile(r"(\<figure.*?\>\<a.*?href=\"https:\/\/player\.soundon\.fm\/embed\/\?podcast=([0-9a-z\-]*)&amp;episode=([0-9a-z\-]*)\"\>(.*?)(?=\<\/a\>).*?(?=\<\/figure\>))")


soundon = r'<div><iframe src="https://player.soundon.fm/embed/?podcast={0}&episode={1}" id="soundon"></iframe></div>'


def main(name):
    fh = open(name,encoding="utf-8") 
    text = ""
    for line in fh:
        text+=line
    fh.close()
    ofn = name.replace(".html","-soundon.html")
    match = re_a.findall(text)
    targets = []
    for m in match:
        targets.append((m[0],soundon.format(m[1],m[2])))
        #print(soundon.format(m[1],m[2]))

    for t in targets:
        text = text.replace(t[0],t[1])
        #print(t[1])
    fh = open(ofn, 'w', encoding='UTF-8')
    fh.write(text)
    fh.close()

if __name__=="__main__":
    if len(sys.argv)==2:
        main(sys.argv[1])
    else:
        print("\nUsage : fix_soundon.py <html-file-name>\n")
    