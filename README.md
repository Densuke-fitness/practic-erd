# practic-erd
楽々ERDレッスンのER図作成の練習用レポジトリです

# How to Use

### Launch

sqldesignerのディレクトリにて
`docker-comopse up -d`
を実行する。

その後localhost:3000にてsqldiginerが立ち上がっていることがわかる。

### Save

メニュータブを開いた後 "SAVE XML" を押し、xmlの文字列を出力。

- [![Image from Gyazo](https://i.gyazo.com/52905b7c60db3c567c28fe2829b0aef6.png)](https://gyazo.com/52905b7c60db3c567c28fe2829b0aef6)

出力した文字列をコピーして、指定のディレクトリにてxml形式のファイルを作成しペーストする。

### Load xml 
指定のディレクトリにあるペーストしたxml形式のファイルに書かれた文字列をコピーした後、

text areaに文字列をペーストし、"LOAD XML" を押して実行する。

[![Image from Gyazo](https://i.gyazo.com/87ba736102022cd48043cbcdc6648b07.png)](https://gyazo.com/87ba736102022cd48043cbcdc6648b07)



### Reference
- https://github.com/denlabo/dockerfile-sqldesigner
