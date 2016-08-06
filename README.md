# AttributeString
富文本的常用方法


- 字体
- 字体颜色
- 背景色
- 下划线
- 下划线颜色
- 字距
- 阴影
- 链接
- 行距
- html

<!-- more -->
# swift中的富文本常见用法
- 准备

```
let textView = UITextView(frame: CGRect(x: 20, y: 100, width: 335, height: 300))
        view.addSubview(textView)
        textView.backgroundColor = UIColor.brownColor()
        textView.editable = false

        let  label = UILabel(frame: CGRect(x: 20, y: 410, width: 335, height: 250))
        label.backgroundColor = UIColor.lightGrayColor()
        label.numberOfLines = 0
        view.addSubview(label)

        let str = "我的字体更别的不同哦,我的颜色是红色,我加了背景色,我加了下划线,我的字距变大了,哈哈我有阴影了,点我啊 带你进入苹果官网"
        let attributeString = NSMutableAttributedString(string: str)
```

- 字体

```
attributeString.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(20), range: NSMakeRange(0, 10))
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "Times New Roman", size: 24)!, range: NSMakeRange(0, 10))
```
- 字体颜色  

```
attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(11, 7))
```
- 背景色

```
attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.greenColor(), range: NSMakeRange(19, 6))
```
- 下划线

```
attributeString.addAttribute(NSUnderlineStyleAttributeName, value: 5, range: NSMakeRange(26, 6))
```
- 下划线颜色

```
attributeString.addAttribute(NSUnderlineColorAttributeName, value: UIColor.orangeColor(), range: NSMakeRange(26, 5))
```
- 字距

```
attributeString.addAttribute(NSKernAttributeName, value:10, range: NSMakeRange(33, 7))
```
- 阴影

```
let shadow = NSShadow()
        shadow.shadowColor = UIColor.blackColor() //阴影颜色
        shadow.shadowBlurRadius = 2.0 //模糊度
        shadow.shadowOffset = CGSizeMake(4, 4) //阴影偏移
        attributeString.addAttribute(NSShadowAttributeName, value:shadow, range: NSMakeRange(41, 7))
```
- 链接

```
attributeString.addAttribute(NSLinkAttributeName, value: NSURL(string: "http://www.apple.com")!, range: NSMakeRange(49, 12))
```
- 行距

```
let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        attributeString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, 61))
```
- html

```
let htmlText = "我是<font color=\"blue\">html</font>。<br>An apple is <font color=\"red\">red</font>."
        do{
            let attrStr = try NSAttributedString(data: htmlText.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)

  			label.attributedText = attrStr
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        
```

- 最后别忘了

```
textView.attributedText = attributeString
```
[代码地址](https://github.com/weishine121/AttributeString)


