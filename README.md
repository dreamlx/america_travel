## menu
```
{
  "button":
  [
    {  
      "type":"view",
      "name":"抽奖",
      "url":"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxcf75c7303d7e2820&redirect_uri=http%3A%2F%2Fml.easybird.cn%2Fusers%2Fweixin&response_type=code&scope=snsapi_userinfo#wechat_redirect"
    },
    {
      "type":"view",
      "name":"关于百度",
      "url":"http://www.baidu.com"
    }
  ]
}
```
## redirection
```
http://ml.easybird.cn/activity.html?openid=xxxxxxxxxx&state=1
```
state=1 exist
state=0 new user
## 抽奖
```
curl -X POST -d "record[openid]=xxxxx&record[cell]=xxxx&record[city]=上海" http://ml.easybird.cn/records/weixin
```
```
url:    http://ml.easybird.cn/records/weixin
params: {
          record: {
            openid: "xxxx",
            cell: "xxxx",
            city: "上海"
          }
        }
response:
        { 
          message: "谢谢参与", #奖项或者谢谢参与
          code: "111111"      #中奖代码 如果是【谢谢参与】，该code为空
        }
```