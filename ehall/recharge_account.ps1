# ��ʾ
# ���豾���� 9 �£��� 8 ���µ��˻���� < 5 Ԫ��ִ�б��ű�������ǰ�� self.dgut.edu.cn �ٴι���������

# ����
$field2555 = "";     # ����
$field2556 = "";     # ѧ��
$authorization = ""; # SessionID

# ��������
# $pay = "5";        # ���

$OrderResponse = Invoke-RestMethod `
    -Uri "http://ehall.dgut.edu.cn/home/form/submitForm" `
    -Method "POST" `
    -Headers @{"authorization"=$authorization; "Cookie"="PHPSESSID="+$authorization} `
    -ContentType "application/json; charset=utf-8" `
    -Body ([System.Text.Encoding]::UTF8.GetBytes("{`"id`":458,`"field2555`":`""+$field2555+"`",`"field2556`":`""+$field2556+"`",`"field2557`":{`"pay`":`"5`",`"pay_man`":`"zc1`",`"pay_target`":`"3`"},`"field2646`":`"`",`"field2706`":`"`"}"));

$order = $OrderResponse.info.order.toString();

Invoke-WebRequest `
    -Uri "http://ehall.dgut.edu.cn/home/Pay/payDemoFirst" `
    -Method "POST" `
    -Headers @{"authorization"=$authorization; "Cookie"="PHPSESSID="+$authorization} `
    -ContentType "multipart/form-data; boundary=Boundary" `
    -Body ([System.Text.Encoding]::UTF8.GetBytes("--Boundary$([char]13)$([char]10)Content-Disposition: form-data; name=`"order_id`"$([char]13)$([char]10)$([char]13)$([char]10)"+$order+"$([char]13)$([char]10)--Boundary$([char]13)$([char]10)Content-Disposition: form-data; name=`"order_to`"$([char]13)$([char]10)$([char]13)$([char]10)zc1$([char]13)$([char]10)--Boundary$([char]13)$([char]10)Content-Disposition: form-data; name=`"pay_info`"$([char]13)$([char]10)$([char]13)$([char]10)[{`"accTrType`":1,`"number`":1,`"accTrAmt`":500,`"mem`":`"$([char]20805)$([char]20540)$([char]19978)$([char]32593)$([char]36153)$([char]29992)`"}]$([char]13)$([char]10)--Boundary--$([char]13)$([char]10)"))

Invoke-WebRequest `
    -Uri "http://ehall.dgut.edu.cn/home/Pay/payDemoSecond" `
    -Method "POST" `
    -Headers @{"Authorization"=$authorization} `
    -ContentType "multipart/form-data; boundary=Boundary" `
    -Body ([System.Text.Encoding]::UTF8.GetBytes("--Boundary$([char]13)$([char]10)Content-Disposition: form-data; name=`"order_id`"$([char]13)$([char]10)$([char]13)$([char]10)"+$order+"$([char]13)$([char]10)--Boundary$([char]13)$([char]10)Content-Disposition: form-data; name=`"password`"$([char]13)$([char]10)$([char]13)$([char]10)$([char]13)$([char]10)--Boundary$([char]13)$([char]10)Content-Disposition: form-data; name=`"order_to`"$([char]13)$([char]10)$([char]13)$([char]10)zc1$([char]13)$([char]10)--Boundary$([char]13)$([char]10)Content-Disposition: form-data; name=`"pay_info`"$([char]13)$([char]10)$([char]13)$([char]10)[{`"accTrType`":1,`"number`":1,`"accTrAmt`":500,`"mem`":`"$([char]20805)$([char]20540)$([char]19978)$([char]32593)$([char]36153)$([char]29992)`"}]$([char]13)$([char]10)--Boundary--$([char]13)$([char]10)"))
