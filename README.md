# Nagano_cake
**ながのCAKE**の商品を通販するためのECサイト。

## 概要
### 顧客側の機能
通販を利用する場合は、お客様にアカウント作成をして頂き、商品をカートに入れ注文が可能。  
商品の配送先は自宅以外にも登録ができ、プレゼントとして配送することも可能。  
注文から届くまでの状況を注文ステータスとして確認が可能。  

### 管理者側の機能
商品、ジャンル、顧客情報の編集が可能。  
お客様からの注文の管理、配送までの管理が可能。  

### 機能
deviceを使用したログイン機能  
Timeouttableを利用したタイムアウト機能(セキュリティ強化)  
kaminariを利用したページネーション  
swiper, スティッキーヘッダー  

### 使い方
管理者、顧客側それぞれログインはメールアドレスを【admin@admin】、パスワードは【testtest】で使用できます。  
顧客側の場合、新規作成で好きなアカウントを作成しても利用が可能です。

### バージョン
Rails 6.1.7.6 　
ruby 2.5.7  
BootStrap 4 
  

## インストール
```terminal
$ git clone git@github.com:webcamp-groupB-cafe/nagano_cake.git
$ cd nagano_cake
$ rails db:migrate
$ rails db:seed
$ bundle install
```
## 作者
川北　浩喜  
島 沙妃  
細川  由花  

