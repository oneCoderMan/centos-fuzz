#!/usr/bin/python3

import os

def fileInFolder(filepath):
    pathDir =  os.listdir(filepath)  # 获取filepath文件夹下的所有的文件
    files = []
    for allDir in pathDir:
        child = os.path.join('%s%s' % (filepath, allDir))
        files.append(child)  
        if child[-3:]==".bc":
            print (child)
        # if os.path.isdir(child):
        #     print child
        #     simplepath = os.path.split(child)
        #     print simplepath
    return files
 
filepath = "./"
print  (fileInFolder(filepath))