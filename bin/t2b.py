import base64

f = open('c.t', 'r')
d = f.read()
dd = base64.b64decode(d)
w = open('c.png', 'wb')
w.write(dd)
w.close()
