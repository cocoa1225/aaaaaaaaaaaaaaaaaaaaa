::RBNACL_LIBSODIUM_GEM_LIB_PATH = './libsodium.dll'
require 'open-uri'
require 'nokogiri'
require 'discordrb'
require 'open3'
require 'twitter'

bot = Discordrb::Commands::CommandBot.new token: 'Mzc3MzU4Mzk4ODUwNTk2ODY0.DOLyFQ.cHZ-V_If-wP0Vki51z5ZR93ejO4', prefix: '!'
play = 0
@playing = 0
#遊び

bot.command (:test) do |event,*code|
  @name = code[0]

url = "https://dak.gg/profile/#{@name}"

charset = nil
html = open(url).read do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
# htmlをパース(解析)してオブジェクトを生成
page = Nokogiri::HTML.parse(html, nil, charset)
pubgrate = page.search('img.grade-icon')

File.open('file.txt','w') do |f|
  f.puts("#{pubgrate}")
end

File.open('file.txt','r').each do |r|
@bronze = r.include?("BRONZE")
@silver= r.include?("SILVER")
@gold = r.include?("GOLD")
@platinum = r.include?("PLATINUM")
@diamond = r.include?("DIAMOND")
@master = r.include?("MASTER")
@grand = r.include?("GRANDMASTER")
@top500 = r.include?("TOP500")
end

if @bronze
  event.send_message"#{@name}のレートはブロンズ帯です"

elsif @silver
  event.send_message"#{@name}のレートはシルバー帯です"

elsif @gold
  event.send_message"#{@name}のレートはゴールド帯です"

elsif @platinum
  event.send_message"#{@name}のレートはプラチナ帯です"

elsif @diamond
  event.send_message"#{@name}のレートはダイアモンド帯です"

elsif @grand
  event.send_message"#{@name}のレートはグランドマスター帯です"

elsif @top500
  event.send_message"#{@name}のレートはTOP500位です"

elsif @master
  event.send_message"#{@name}のレートはマスター帯です"

else
  event.send_message"ランク帯が取得できなかったか名前が間違っている可能性が高いです"
end
end

    def iken
      File.open("request.txt","a") do |write|
        write.puts("#{@hito}からのリクエスト、内容は「#{@in}」")
      end
    end

    bot.command (:request) do |youbou|

        @hito = youbou.user.name

        youbou.send_message"
        追加してほしい曲、機能、botの意見などを入力してください
        複数ある場合は1度に複数記入してください"

        youbou.user.await(:wait) do |naiyou|

          @in = naiyou.message.content

          iken()
            youbou.send_message"リクエスト完了！"
        end
               ""
      end

#ここから音楽関係



bot.command(:summon) do |event|
    bot.game = ("Discord")
  #!summonと打たれた時に実行する
channel = event.user.voice_channel
  #channelという変数?はevent.user.voice_channel(おそらくユーザーがボイスチャンネルに入っているかどうかを判定するやつ)
  next "ボイスチャンネルに入室してください！" unless channel
  #!summonと打った人がボイスチャンネルに入ってない時に表示する文  nextとかはよくわからない
  bot.voice_connect(channel)
  #botがボイスチャンネルに入った時に実行する
  "#{channel.name}に入室しました
!helpで現在再生可能な曲とコマンドが表示されます。"
end

#再生を止める

bot.command (:stop) do |event|
  play = 1
  bot.game = ("Discord")
  event.voice.stop_playing
end


#退出

bot.command (:exit) do |event|
  bot.game = ("Discord")
  event.voice.destroy
  ""
end


#youtube


bot.command (:play) do |event,*code|
voice_bot = event.voice

if @playing === 1
  event.voice.stop_playing
  Open3.capture3('del /s *mp3')
  play = 1
end

bot.game = ("Youtube奴隷")
Open3.capture3('del /s *mp3')
url = code[0]
  File.open('download_urls.txt',"w") do |f|
    f.puts("#{url}")
end
""

sleep(2)

  Open3.capture3('run.bat')
  play = 0
  event.send_message"ダウンロードが終わりました再生します"

  while play < 1 do
    @playing = 1
 voice_bot.play_file("a.mp3")
end

Open3.capture3('del /s *mp3')
  ""
  end
#ここまでyoutube


#音楽


  bot.command (:pastel)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      play = 1
    end
    play = 0
     bot.game = ("世界は恋に落ちている")
   i = 0
    voice_bot = event.voice
     while play < 1 do
       @playing = 1
       i += 1
       a = i%10
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/otaku.m4a')
     end
  end

  bot.command (:rebirth)  do |event|

    if @playing === 1
      event.voice.stop_playing
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("Re:birth day")
   i = 0
    voice_bot = event.voice
     while play < 1 do
       @playing = 1
       i += 1
       a = i%10
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/Rebirth.m4a')
     end
  end


  bot.command (:risa)  do |event|
    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      play = 1
    end

sleep (2)

    play = 0
     bot.game = ("陽だまりロードナイト")
   i = 0
    voice_bot = event.voice
     while play < 1 do
       @playing = 1
       i += 1
       a = i%10
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/risa.m4a')
     end
  end
  bot.command (:oneness)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("ONENESS")
   i = 0
    voice_bot = event.voice
     while play < 1 do
       @playing = 1
       i += 1
       a = i%10
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/ONENESS.m4a')
     end
  end

  bot.command (:heroic)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("HeroicAdvent")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/Heroic.m4a')
     end
  end

  bot.command (:sekai)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("世界のっびのびトレジャー")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/sekai.m4a')
     end
  end

  bot.command (:symphony)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      Process.waitall
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("Determination Symphony")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/deter.m4a')
     end
  end

  bot.command (:fgo)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      Process.waitall
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("一刀繚乱")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/FGO.m4a')
     end
  end

  bot.command (:loser)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      Process.waitall
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("la L'inno per il IDOLA")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/DF.m4a')
     end
  end

  bot.command (:wataridori)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      Process.waitall
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("ワタリドリ")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/tori.m4a')
     end
  end

  bot.command (:kongyo)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      Process.waitall
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("攻撃戦だ！")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/kongyo.m4a')
     end
  end

  bot.command (:asriel)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      Process.waitall
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("Asriel Dreemurr")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/asriel.m4a')
     end
  end

  bot.command (:relief)  do |event|

    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      Process.waitall
      play = 1
    end
sleep (2)
    play = 0
     bot.game = ("Re-TrymenT")
   i = 0
    voice_bot = event.voice

     while play < 1 do
       @playing = 1
       i += 1
       a = i%20
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/relief.m4a')
     end
  end



   bot.run
