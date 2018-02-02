# Protocol Documentation
<a name="top"/>

## Table of Contents

- [common.proto](#common.proto)
    - [Error](#study20180216.Error)
  
  
  
  

- [credentials.proto](#credentials.proto)
    - [AccessToken](#study20180216.AccessToken)
    - [AccessTokenCredentials](#study20180216.AccessTokenCredentials)
    - [Credentials](#study20180216.Credentials)
    - [Password](#study20180216.Password)
    - [PasswordCredentials](#study20180216.PasswordCredentials)
  
  
  
  

- [user.proto](#user.proto)
    - [User](#study20180216.User)
  
    - [User.Role](#study20180216.User.Role)
  
  
  

- [authenticator.proto](#authenticator.proto)
    - [AuthRequest](#study20180216.AuthRequest)
    - [AuthResponse](#study20180216.AuthResponse)
    - [RegisterRequest](#study20180216.RegisterRequest)
    - [RegisterResponse](#study20180216.RegisterResponse)
  
    - [AuthResponse.Status](#study20180216.AuthResponse.Status)
    - [RegisterResponse.Status](#study20180216.RegisterResponse.Status)
  
  
    - [Authenticator](#study20180216.Authenticator)
  

- [notebook.proto](#notebook.proto)
    - [Page](#study20180216.Page)
    - [PageRequest](#study20180216.PageRequest)
    - [PageResponse](#study20180216.PageResponse)
    - [Pages](#study20180216.Pages)
    - [PagesRequest](#study20180216.PagesRequest)
    - [PagesResponse](#study20180216.PagesResponse)
  
    - [PageResponse.Status](#study20180216.PageResponse.Status)
    - [PagesResponse.Status](#study20180216.PagesResponse.Status)
  
  
    - [Notebook](#study20180216.Notebook)
  

- [Scalar Value Types](#scalar-value-types)



<a name="common.proto"/>
<p align="right"><a href="#top">Top</a></p>

## common.proto



<a name="study20180216.Error"/>

### Error
エラーオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| code | [string](#string) |  | エラーコード。 |
| summary | [string](#string) |  | エラー概要。 |
| detail | [string](#string) |  | エラー詳細。 |





 

 

 

 



<a name="credentials.proto"/>
<p align="right"><a href="#top">Top</a></p>

## credentials.proto



<a name="study20180216.AccessToken"/>

### AccessToken
アクセストークンオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [string](#string) |  | トークン。 |






<a name="study20180216.AccessTokenCredentials"/>

### AccessTokenCredentials
アクセストークン方式の認証情報。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| access_token | [AccessToken](#study20180216.AccessToken) |  | アクセストークンオブジェクト。 |






<a name="study20180216.Credentials"/>

### Credentials
認証情報。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| access_token | [AccessTokenCredentials](#study20180216.AccessTokenCredentials) |  | アクセストークン方式の認証情報。 |
| password | [PasswordCredentials](#study20180216.PasswordCredentials) |  | パスワード方式の認証情報。 |






<a name="study20180216.Password"/>

### Password
パスワードオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ユーザーID。 |
| raw_password | [string](#string) |  | 平文パスワード。 |
| hashed_password | [string](#string) |  | ハッシュ化パスワード。 |






<a name="study20180216.PasswordCredentials"/>

### PasswordCredentials
パスワード方式の認証情報。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| password | [Password](#study20180216.Password) |  | パスワードオブジェクト。 |





 

 

 

 



<a name="user.proto"/>
<p align="right"><a href="#top">Top</a></p>

## user.proto



<a name="study20180216.User"/>

### User
ユーザーオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ユーザーID。 |
| name | [string](#string) |  | ユーザー名。 |
| roles | [User.Role](#study20180216.User.Role) | repeated | ロール。 |





 


<a name="study20180216.User.Role"/>

### User.Role


| Name | Number | Description |
| ---- | ------ | ----------- |
| EDITOR | 0 | 編集者ロール。 |


 

 

 



<a name="authenticator.proto"/>
<p align="right"><a href="#top">Top</a></p>

## authenticator.proto
認証。


<a name="study20180216.AuthRequest"/>

### AuthRequest
認証リクエストオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| credentials | [Credentials](#study20180216.Credentials) |  | 認証情報。 |






<a name="study20180216.AuthResponse"/>

### AuthResponse
認証レスポンスオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [AuthResponse.Status](#study20180216.AuthResponse.Status) |  | 応答ステータス。 |
| user | [User](#study20180216.User) |  | ユーザーオブジェクト。 |
| error | [Error](#study20180216.Error) |  | エラーオブジェクト。 |






<a name="study20180216.RegisterRequest"/>

### RegisterRequest
認証リクエストオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| user | [User](#study20180216.User) |  | ユーザーオブジェクト。 |
| password | [Password](#study20180216.Password) |  | パスワード。 |






<a name="study20180216.RegisterResponse"/>

### RegisterResponse
認証レスポンスオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [RegisterResponse.Status](#study20180216.RegisterResponse.Status) |  | 応答ステータス。 |
| user | [User](#study20180216.User) |  | ユーザーオブジェクト。 |
| error | [Error](#study20180216.Error) |  | エラーオブジェクト。 |





 


<a name="study20180216.AuthResponse.Status"/>

### AuthResponse.Status


| Name | Number | Description |
| ---- | ------ | ----------- |
| OK | 0 | 正常応答。 |
| ERROR | 1 | エラー応答。 |



<a name="study20180216.RegisterResponse.Status"/>

### RegisterResponse.Status


| Name | Number | Description |
| ---- | ------ | ----------- |
| OK | 0 | 正常応答。 |
| ERROR | 1 | エラー応答。 |


 

 


<a name="study20180216.Authenticator"/>

### Authenticator
ページの CRUD を行うサービス。

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| Register | [RegisterRequest](#study20180216.RegisterRequest) | [RegisterResponse](#study20180216.RegisterRequest) | 登録する。 |
| Authenticate | [AuthRequest](#study20180216.AuthRequest) | [AuthResponse](#study20180216.AuthRequest) | 認証する。 |

 



<a name="notebook.proto"/>
<p align="right"><a href="#top">Top</a></p>

## notebook.proto
ノート。


<a name="study20180216.Page"/>

### Page
ページオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ページID。 |
| title | [string](#string) |  | ページタイトル。 |
| content | [string](#string) |  | ページないよう。 |
| editor | [User](#study20180216.User) |  | 編集者。 |






<a name="study20180216.PageRequest"/>

### PageRequest
ページ操作用リクエストオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| credentials | [Credentials](#study20180216.Credentials) |  | 認証情報。 |
| page | [Page](#study20180216.Page) |  | ページオブジェクト。 |






<a name="study20180216.PageResponse"/>

### PageResponse
ページ操作結果レスポンスオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [PageResponse.Status](#study20180216.PageResponse.Status) |  | 応答ステータス。 |
| page | [Page](#study20180216.Page) |  | ページオブジェクト。 |
| error | [Error](#study20180216.Error) |  | エラーオブジェクト。 |






<a name="study20180216.Pages"/>

### Pages
ページ集合オブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| members | [Page](#study20180216.Page) | repeated | ページ。 |






<a name="study20180216.PagesRequest"/>

### PagesRequest
ページ集合操作用リクエスオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| credentials | [Credentials](#study20180216.Credentials) |  | 認証情報。 |
| page_number | [uint32](#uint32) |  |  |
| query | [string](#string) |  |  |






<a name="study20180216.PagesResponse"/>

### PagesResponse
ページ集合レスポンスオブジェクト。


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [PagesResponse.Status](#study20180216.PagesResponse.Status) |  | 応答ステータス。 |
| pages | [Pages](#study20180216.Pages) |  | ページ集合オブジェクト。 |
| error | [Error](#study20180216.Error) |  | エラーオブジェクト。 |





 


<a name="study20180216.PageResponse.Status"/>

### PageResponse.Status


| Name | Number | Description |
| ---- | ------ | ----------- |
| OK | 0 | 正常応答。 |
| ERROR | 1 | エラー応答。 |



<a name="study20180216.PagesResponse.Status"/>

### PagesResponse.Status


| Name | Number | Description |
| ---- | ------ | ----------- |
| OK | 0 | 正常応答。 |
| ERROR | 1 | エラー応答。 |


 

 


<a name="study20180216.Notebook"/>

### Notebook
ページの CRUD を行うサービス。

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| CreatePage | [PageRequest](#study20180216.PageRequest) | [PageResponse](#study20180216.PageRequest) | ページを作成する。 |
| GetPage | [PageRequest](#study20180216.PageRequest) | [PageResponse](#study20180216.PageRequest) | ページを取得する。 |
| ListPages | [PagesRequest](#study20180216.PagesRequest) | [PagesResponse](#study20180216.PagesRequest) | ページ一覧を取得する。 |
| UpdatePage | [PageRequest](#study20180216.PageRequest) | [PageResponse](#study20180216.PageRequest) | ページを更新する。 |
| DeletePage | [PageRequest](#study20180216.PageRequest) | [PageResponse](#study20180216.PageRequest) | ページを削除する。 |

 



## Scalar Value Types

| .proto Type | Notes | C++ Type | Java Type | Python Type |
| ----------- | ----- | -------- | --------- | ----------- |
| <a name="double" /> double |  | double | double | float |
| <a name="float" /> float |  | float | float | float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long |
| <a name="bool" /> bool |  | bool | boolean | boolean |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str |

