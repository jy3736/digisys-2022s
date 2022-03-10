#! /usr/bin/python

import sys, os


def main(name):
    ofn = name.replace(".html","-dark.html")
    fh = open(name,encoding="utf-8") 
    text = ""
    for l in fh:
        text+=l
    text = text.replace("</head",' <link rel="stylesheet" href="dark-theme.css">  </head')
    text = text.replace('href="https:',' target="_blank" href="https:')    
    dark = open(ofn, 'w', encoding='UTF-8')
    dark.write(text)
    dark.close()
    fh.close()
    
if __name__=="__main__":
    if len(sys.argv)==2:
        main(sys.argv[1])
    else:
        print("\nUsage : dark-mode.py <html-file-name>\n")
    