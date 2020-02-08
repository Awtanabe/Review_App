class Review
  attr_reader :ganre, :title, :impression
  @@titles = []
  @@works = []

  def initialize(ganre, title, impression)
    @ganre = ganre
    @title = title
    @impression = impression
    @@titles << @title
    @work = {ganre: @ganre, title: @title, impression: @impression }
    @@works << @work
  end

  def self.disp_titles
    @@titles.each_with_index do |title, n|
      puts "[#{n}]#{title}"
    end
  end
  #レビュー詳細
  def self.show_detail(n)
    puts "ジャンル: #{@@works[n][:ganre]}"
    puts "タイトル: #{@@works[n][:title]}"
    puts "感想: #{@@works[n][:impression]}"
  end
end

#レビュー入力画面
def review_input
  puts 'ジャンルは？'
  ganre = gets.chomp
  # blank_checker(ganre)
  puts 'タイトルは？'
  title = gets.chomp
  puts '感想は？'
  impression = gets.chomp

  review = Review.new(ganre, title, impression)
  start_review
end

def select_action_before_detail
  puts '[0]最初の選択画面に戻る [1]アプリ終了'
  input = gets.to_i
  case input
  when 0
    start_review
  when 1
    exit
  else
    puts '[0]~[1]のいずれかのメニューを選択してください'
    select_action_before_detail
  end
end

#レビュー選択画面
def review_select
  Review.disp_titles
  input = gets.to_i
  Review.show_detail(input)
  select_action_before_detail
end

#動作選択入力画面
def start_review
  $action_text = '[0]レビュー入力 [1]レビュー選択 [2]アプリ終了'

  puts $action_text
  input = gets.to_i

  def select_action(n)
    case n
    when 0
      review_input
    when 1
      review_select
    when 2
      exit
    else
      puts '[0]~[2]のいずれかのメニューを選択してください'
      puts $action_text
      input = gets.to_i
      select_action(input)
    end
  end

  select_action(input)
end

start_review
