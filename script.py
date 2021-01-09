# -*- coding: utf-8 -*-
#
# version 1.0
# date: 2020/12/09
#
# author: symeon
# email: symeonchen@gmail.com


import sys
import os
import urllib,urllib2
import json


webhook_url = os.environ['webhook_url']

msg = sys.argv[1]

# sys.stderr.write("msg: "+msg)

data = json.dumps({'content' : msg})

req = urllib2.Request(webhook_url, data)

req.add_header('Content-Type', 'application/json')

try:
	response = urllib2.urlopen(req)
	resultMsg = json.dumps(json.loads(response.read()),ensure_ascii=False)
	print "内容记录成功"
except:
	print "内容记录失败"