# ライブラリ読み込み
require 'open-uri'
require 'nokogiri'

# --------------------------------------------------
#  変数
# --------------------------------------------------
# ファイル名定義
file01_url = '_file01_url.txt'
file02_node = '_file02_node.csv'
file03_result = '_file03_result.csv'

# URL情報格納配列
arr_url = []

# node情報格納配列
arr_node = []
arr_node_xpath = []
arr_node_type = []

# --------------------------------------------------
#  [step1] スクレイピング対象サイトのURLを取得（変数へ代入）
# --------------------------------------------------
begin
  File.open(file01_url, mode = "rt") do |f|
    f.each_line do |line|
      # 1文字目が「#」だったらその行をスキップ
      if line[0, 1] == "#" then next end
      # 対象のURLを配列へ代入（末尾の改行を削除）
      arr_url << line.chomp
    end
  end
  rescue => e
    # エラー通知＆処理停止
    puts "#{file01_url}ファイルエラー"
    exit
end

# --------------------------------------------------
#  [step2] サイト内の取得対象の要素情報を取得（変数へ代入）
# --------------------------------------------------
begin
  File.open(file02_node, mode = "rt") do |f|
    f.each_line do |line|
      # 1文字目が「#」だったらその行をスキップ
      if line[0, 1] == "#" then next end
      # 対象のURLを配列へ代入（末尾の改行を削除）
      str = line.chomp
      # カンマ区切りでデータを分割＆変数へ格納
      arr = str.split(",")
      arr_node << arr
      arr_node_type << arr[0]
      arr_node_xpath << arr[1]
    end
  end
  rescue => e
    # エラー通知＆処理停止
    puts "#{file02_node}ファイルエラー"
    exit
end

# --------------------------------------------------
#  [step3] サイトへアクセス・要素取得・ファイルへ出力
# --------------------------------------------------
begin
  # 出力対象のファイルを開く（存在しなければ作成）
  f = File.new(file03_result, "a", perm=0644)

  # file01_url.txtのURL分処理を繰り返す
  arr_url.each_with_index do |url, i|
    # // サイトデータ取得 ////////////////////
    begin
      # サイトのhtmlデータ取得
      doc = Nokogiri::HTML(URI.open(url), nil, "utf-8")
      rescue => e
        # ファイルへ出力（1行毎）
        f.puts "url[#{i}][url_error]"
        # エラー通知
        puts "*ERROR___url[#{i}]url_error"
        next
    end

    # htmlデータ中の検索対象要素（file02_node.csv > [0]）を全て取得
    doc.xpath(arr_node_xpath[0]).each_with_index do |node, j|
      node_result = ""
      # 大本から取得したい要素（file02_node.csv > [1]～）を辿る
      arr_node_xpath[1..-1].each_with_index do |css, k|
        # // 要素の取得 ////////////////////
        begin
          # 要素の取得
          eval("node_result << \",\"+node#{css}")
          rescue => e
            node_result << ",[node[#{j}-#{k+1}]_error]"
            # エラー通知
            puts "*ERROR___url[#{i}]node[#{j}-#{k+1}]_error"
        end
      end
      # ファイルへ出力（1行毎）
      f.puts "url[#{i}],node[#{j}]" + node_result
    end
  end

  f.close
  rescue => e
    # エラー通知＆処理停止
    puts "#{file03_result}ファイルエラー"
    f.close
    exit
end
