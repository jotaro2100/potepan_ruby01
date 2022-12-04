require "csv"

puts "1 → 新規でメモを作成 / 2 → 既存のメモを編集"
memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いた新規ファイル名を入力"
  file_name = gets.chomp
  if File.exist?("#{file_name}.csv")
    puts "ファイルが既に存在しています"
    return
  elsif file_name == ""
    puts "ファイル名が空です"
    return
  else
    CSV.open("#{file_name}.csv", "w") do |csv|
      puts "メモしたい内容を入力（Ctrl + D で保存）"
      memo = STDIN.read.chomp
      csv << [memo.to_s]
    end
  end
elsif memo_type == 2
  puts "拡張子を除いた既存のファイル名を入力"
  exist_file_name = gets.chomp
  if File.exist?("#{exist_file_name}.csv") == false
    puts "ファイルが存在しません"
    return
  else  
    CSV.open("#{exist_file_name}.csv", "a") do |csv|
      puts "メモしたい内容を入力（Ctrl + D で保存）"
      memo = STDIN.read.chomp
      csv << [memo.to_s]
    end
  end
else
  puts "1, 2どちらかを選択してください"
end
