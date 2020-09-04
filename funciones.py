#!/usr/bin/env python
# coding: utf-8

# In[40]:
import pandas as pd

import glob
import re

   
def cleandata(string):
#Función para quitar caracteres especiales
    result=re.sub(r'[0-9]+', '', string)
    result=re.sub('[:;,."”“/!?¿@#$()%¡=&-><]', '', result).replace("  "," ").replace("   "," ").replace("    "," ")
    return result

def pattern_extractor(string):
#Esta función toma como parámetro un string, encuentra el patrón deseado y lo regresa quitando espaciados excesivos y  '/n' y '/t'
    a="Problematización reflexiva"
    b="Información de la secuencia"
    result=string[string.find(a)+26:string.find(b)].replace('\n', ' ').replace('\t', ' ').replace("  "," ").replace("   "," ").replace("    "," ")
    return result   

