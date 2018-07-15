# Nginx Up and Running

このドキュメントは、このリポジトリが扱う対象、内容を説明し、対象者が実際に動かして試すことを手助けするものです。

## 対象読者

- AWS上でNginxをすぐに動かしたいひと

- [ngx_mruby](https://github.com/matsumotory/ngx_mruby)をすぐに動かしたいひと

- [Terraform](https://www.terraform.io/), [Ansible](https://www.ansible.com/), [CircleCI](https://circleci.com/), [Infrataster](https://github.com/ryotarai/infrataster)を使って、インフラ構築・テストの自動化をしたいひと

## QuickStart

1. 必要ソフトウェアのインストール
   1. terraform
   2. ansible
   3. ruby
2. 事前準備
   1. `git clone git@github.com:chaspy/nginx-up-and-running.git`
   2. AWSのcredentialと公開鍵を.secretに入力
   3. `terraform init`
   4. `bundle install`
3. 作成
   1. `sh script/create.sh`

## 利用ソフトウェア・サービス

使っているOSS、サービスについて解説します。

### AWS
Amazon Web Serviceをインフラとして使っています。NginxをinstallするためのEC2インスタンスと、それを実現するためのVPC、Network、SecurityGroupも使っています。

### Nginx
本リポジトリの主役。WebServerです。

### ngx_mruby
Nginxのconfigでは書くのが面倒であってり、かけないような処理をrubyで書くためのNginxモジュール。

### Terraform
様々なクラウドに対して、デプロイが行うことができます。

Terraformはインフラの現在の状況を`tfstate`ファイルにjsonで保存します。gitで管理すべきではないので、AWS S3上に保存しています。


### CircleCI

リモートリポジトリでcommitがpushされるたびに動くCIサービスです。今回、CircleCIではAWSへのDeployは行わず、CIのコンテナ内で動作します。

- Plan ... TerraformのPlanを行います
- Deploy ... コンテナ内で、localhostに対してansibleのテストと、立ち上がったNginxに対してインフラのE2Eテストを行います。

### Infrataster

インフラの外部の振る舞いをテストする、rspecを拡張したツールです。主にNginxのconfigを外部からテストする用途に使っています。

### Docker 

CircleCIでのDeploy Stepで使うためのDockerImageを作成しました。

- [chaspy/nginx-up-and-running](https://hub.docker.com/r/chaspy/nginx-up-and-running/)



