# Ruby_scraping
対象のサイトURLや要素のxpathをtxtやcsvファイルで制御可能なスクレイピングサンプルプログラム

<br><br><br>


## 仕様
* プログラムの変更や実行は「**index.rb**」にて行う ※プログラム実行「ruby index.rb」
* ダウンロード直後でもサンプルサイトの記述がされているので実行後の結果をすぐに確認できる
* サンプル記述にはエラー確認の為の記述が書かれている ※実行は途中で止まらず、ドコでエラーが起きたかの結果を返すようになっている
* 「**_file01_url.txt**」にはスクレイピング対象サイトURLを記述 ※複数URL指定可能
* 「**_file02_node.csv**」にはスクレイピング対象のxpathノードを記述 ※親1・子複数設定可能
* スクレイピングが成功すると「**_file03_result.csv**」に結果が出力される

<br><br><br>


## 実行ファイル/コマンド
* **ruby index.rb**

<br><br><br>






## 使用プラグイン
<table>
	<tr>
		<td><b>Nokogiri</b></td>
		<td>Rubyでスクレイピングするときの定番ライブラリ</td>
	</tr>
</table>

<br><br><br>



## 参考リンク
* [はじめてのRuby！Nokogiriでスクレイピングの基礎を理解しよう！ | 侍エンジニアブログ](https://www.sejuku.net/blog/57458)
* [初心者は覚えておきたいRubygemsのコマンドまとめ - Qiita](https://qiita.com/muran001/items/14f34b735e0a6b4af98c)
<br><br><br>




## 知っておくと便利なgemコマンド一覧
| コマンド                     | 内容                                                                                                 | 
| :--------------------------- | :--------------------------------------------------------------------------------------------------- | 
| gem install <gem名>                  | 最新のものを導入                                                           | 
| gem install <gem名> -v <バージョン>                  | バージョン指定で導入                                                           | 
| gem install <gem名> --no-ri --no-rdoc                  | RI,RDocドキュメントを入れない（インストールが早い）                                                           | 
| gem uninstall <gem名>                  | 不要なgemをアンインストール                                                           | 
| gem list                  | インストール済みのgemを一覧表示                                                           | 
| gem list <キーワード>                  | インストール済みのgemをキーワードで検索して表示                                                           | 
| xxxxx                  | xxxxx                                                           | 






<br><br><br>
