xdylpg
======

API list
=======

* 请求都是通过json
* 任何返回内容的格式，状态码 + 内容主体
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
            "xxx": {[   array
                {},
                {}
            ]}
        }
    }
```
* /v1/stores/brush [get]: 筛选商铺
```
    请求参数:
        {
            "gps": "40.893813,80.485829" string 用户当前所在位置，用于计算用户与商铺间的距离
            "ordertype": 1(综合)，2（销量），3（点击量） int 商铺的排序，综合排序规则暂定, 销量与点击量是商铺的一个属性
            "orderorder": 1(升序） 2（降序） int
            "productcount": 3 int 商铺列表中显示的商品，顺序由商铺自己定
            "storepage": 1 int 商铺分页
            "storesize": 10 int 商铺列表每页数量
            "industryid": 0 int 行业分类ID，如果为0，则表示不区分行业
            "distance": 1.0 double 返回用户附近n公里以内的商铺
            "keywordsearch": "关键词" string 如果为空，忽略字段。搜索商铺name和商品name
        }
    返回body(通用返回结构中的body):
        "body":{
            "stores":{[
                {
                    "storeid": 1 int
                    "storename": "xxx" string
                    "industryid": 1 int
                    "industryname" "xxx" string
                    "distance": 5.5 double 与用户间的距离，单位公里
                    "avatar": "xxx" string 商铺图片
                    "products": [
                        {
                            "productid": 1 int
                            "productname": "xxx" string
                            "productavatar": "xxx" string //商品图片
                            "productprice": 8.99 double
                            "productcurrency" "￥" string
                            "productunit": "xxx" string
                        },
                        {}
                    ]
                },
                {}
            ]
            }
        }
```
* /v1/stores/industrys [get]: 商铺行业分类
```
    请求参数: 无
    返回body:
        "body":{
            "industry":{
                [
                {
                    "industryid": 1 int
                    "industryname" "xxx" string
                },
                {}
                ]
            }
        }
```
* /v1/stores/id/:id [get]: 商铺详情
```
    请求参数:
        :id: 1 int
    返回body:
        "body":{
            "storeid": 1    int
            "storename": "商铺名称" string
            "storedesc": "商铺描述" string
            "storegps": "75.9398,83.858843" string
            "storeaddress": "中国北京天安门"   string
            "industryid": 1 int
            "industryname": xx, string
            "avatar": "http://pic.baidu.com/jjsd.jpg"   string
            "storephone": "13847584934" string
            "producthotlimit": 20   int (商铺中的某一商品销量超过20就标志为hot，商铺属性)
            "distance": 100 int
            "productstags": [
                {
                    "tagid": 1, int
                    "tagname": "分类", string
                    "productscount": 10, int
                },
                {}
            ]
        }
```