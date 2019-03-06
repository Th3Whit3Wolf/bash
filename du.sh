#!/bin/bash
du -m $1 | tail -n1 | awk '{print $1}' | awk '{ len=length($0); res=""; for (i=0;i<=len;i++) { res=substr($0,len-i+1,1) res; if (i > 0 && i < len && i % 3 == 0) { res = "," res } }; print res }' | awk '{print  $1 " MB"}'
