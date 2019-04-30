class Janken

  # じゃんけんの手を入力
  def input_hand
    puts "(グー:1, チョキ:2, パー:3)"
    @me = gets.chomp.to_i
    @opponent_hand = rand(1..3)
  end

  # 1, 2, 3 以外の数字が入力された場合の繰り返し処理
  def input_roop
    until @me == 1 || @me == 2 || @me == 3
      puts "入力値が不正です。もう一度入力してください。"
      puts "-------------------------------------"
      input_hand
    end
  end

  # じゃんけんの手を表示
  def display_hand(num)
    case num
    when 1
      "グー"
    when 2
      "チョキ"
    when 3
      "パー"
    end
  end

  # じゃんけんの勝敗処理
  def winning_or_losing
    puts "あなた：#{display_hand(@me)}"
    puts "あいて：#{display_hand(@opponent_hand)}"
    case @me - @opponent_hand
    when 0
      aiko
    when -1, 2
      puts "あなたの勝ちです"
    when -2, 1 
      puts "あなたの負けです"
    end
  end

  # あいこ処理
  def aiko
    while @me - @opponent_hand == 0
      puts "----------------------------------"
      puts "あいこで..."
      input_hand
      input_roop
      winning_or_losing
    end
  end

end

janken = Janken.new
puts "-------------------------------------"
puts "最初はグー、じゃんけん..."
janken.input_hand
janken.input_roop
janken.winning_or_losing
