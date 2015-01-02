xdylpg
======

API list
=======

* 请求都是通过json
* 任何返回内容的格式:
```
    json:
    {
        "status":{
            "code": 1,  int
            "msg": "状态信息", string
        },
        "body":{
            "xxx": xxx, int
            "xxx": "xxx", string
            "xxx": [   array
                {},
                {}
            ]
        }
    }
```
