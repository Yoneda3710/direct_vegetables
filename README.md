# README

direct-vegetable
====

Overview

"direct-vegetable" は飲食店や一般ユーザーが、小売店を介さずに生産者から直接野菜や商品を購入できるサービスです。

## Description
ユーザー側は珍しい、市場の規格に合わない等の商品を適正な値段で購入することができ、生産者側においては自社製品のアピールや規格外製品のロス削減につなげることができます。
## VS. 
生産者にプロフィール登録を求めることにより、他のサービスよりも製品の安全性や強みをアピールしやすく、同時に継続的購入に繋がりやすい仕様になっております。


## Author
*米田昌貴
*yoneda0518@icloud.com
[https://github.com/Yoneda3710/direct_vegetables](http://54.250.24.19/)

## customers テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| family_name      | string | null: false |
| first_name       | string | null: false |
| kana_family_name | string | null: false |
| kana_first_name  | string | null: false |
| birthday         | date   | null: false |
| email            | string | null: false |
| password         | string | null: false |
### Association
- has_many :items
- has_many :orders
- has_one  :address

## producers テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| family_name      | string | null: false |
| first_name       | string | null: false |
| kana_family_name | string | null: false |
| kana_first_name  | string | null: false |
| birthday         | date   | null: false |
| email            | string | null: false |
| password         | string | null: false |
### Association
- has_many :items
- has_many :orders
- has_one  :producer_address

## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| name          | string        | null: false                    |
| description   | text          | null: false                    |
| price         | integer       | null: false                    |
| producer      | references    | null: false, foreign_key: true |
### Association
- belongs_to :customer
- belongs_to :producer
- has_one :item_order

## address テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| postal_code      | string     | null: false                      |
| prefecture_id    | integer    | null: false                      |
| city             | string     | null: false                      |
| house_number     | string     | null: false                      |
| building_name    | string     |                                  |
| customer         | references | null: false, foreign_key: true   |
### Association
- belongs_to :customer

## producer_address テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| postal_code      | string     | null: false                      |
| prefecture_id    | integer    | null: false                      |
| city             | string     | null: false                      |
| house_number     | string     | null: false                      |
| building_name    | string     |                                  |
| producer         | references | null: false, foreign_key: true   |
### Association
- belongs_to :producer


## item_orders テーブル

| Column        | Type       | Options                          |
| ------------- | ---------- | -------------------------------- |
| customer      | references | null; false, foreign_key: true   |
| item          | references | null: false, foreign_key: true   |
### Association
- belongs_to :customer
- belongs_to :item

## cards テーブル

| Column            | Type       | Options                          |
| ----------------- | ---------- | -------------------------------- |
| card_token        | string     | null: false                      |
| customer_token    | string     | null: false                      |
| customer          | references | foreign_key: true                |
### Association
- belongs_to :customer


## profiles テーブル

| Column                  | Type       | Options                          |
| ----------------------- | ---------- | -------------------------------- |
| producer_comment        | string     | null: false                      |
| producer                | references | foreign_key: true                |
### Association
- belongs_to :producer

