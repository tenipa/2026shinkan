AdminUser.find_or_create_by!(email: "admin@example.com") do |u|
  u.password = "password"
  u.password_confirmation = "password"
end

default_settings = {
  hero_title: "スポーツ愛好会テニスパート",
  hero_subtitle: "2026年度 新歓特設サイト",
  catchphrase: "テニスを楽しもう！初心者から経験者まで大歓迎！",
  instagram_url: "https://www.instagram.com/",
  x_url: "https://x.com/",
  line_url: "https://line.me/",
  recruitment_body: "スポーツ愛好会テニスパートでは、新入生を募集しています！\n\n経験者の男子も、初心者の男子も、女子も、みんな大歓迎！\nテニスを通じて最高の大学生活を送りましょう。",
  schedule_link: "https://example.com/schedule",
  pv_video_url: "https://www.youtube.com/embed/dQw4w9WgXcQ",
  practice_times: "月〜土 朝練 8:30-11:00 / 午後練 17:00-20:30",
  practice_location: "駒場テニスコート",
  member_count: "各学年約100名（男女比 1:1）、東大生限定",
  competitive_info: "対抗戦に出場する「チーム」もあります。競技志向の方も大歓迎！"
}

default_settings.each do |key, value|
  SiteSetting.find_or_create_by!(key: key.to_s) do |s|
    s.value = value
  end
end

events_data = [
  { title: "新歓オリエンテーション", month: 4, description: "新入生向けの説明会・体験練習を行います。", position: 1 },
  { title: "五月祭", month: 5, description: "東大の学園祭！テニスパートも出店します。", position: 2 },
  { title: "新歓キャンプ", month: 6, description: "新入生歓迎の合宿で親睦を深めます。", position: 3 },
  { title: "夏合宿", month: 8, description: "夏の集中練習合宿です。", position: 4 },
  { title: "ハロウィンパーティー", month: 10, description: "仮装して楽しむハロウィンイベント！", position: 5 },
  { title: "駒場祭", month: 11, description: "駒場キャンパスの学園祭に参加します。", position: 6 },
  { title: "クリスマスパーティー", month: 12, description: "年末の楽しいクリスマスイベント！", position: 7 },
  { title: "追いコン", month: 2, description: "卒業生を送り出す追い出しコンパ。", position: 8 },
  { title: "春合宿", month: 3, description: "春休みの合宿で新シーズンに向けて練習！", position: 9 }
]

events_data.each do |attrs|
  Event.find_or_create_by!(title: attrs[:title]) do |e|
    e.assign_attributes(attrs)
  end
end

qa_data = [
  { question: "初心者でも大丈夫ですか？", answer: "もちろん大丈夫です！部員の多くが大学からテニスを始めています。初心者向けの練習メニューもあるので、安心して参加してください。", position: 1 },
  { question: "他のサークルとの兼サーはできますか？", answer: "はい、兼サーしている部員もたくさんいます。練習は自由参加なので、自分のペースで活動できます。", position: 2 },
  { question: "練習はどのくらいの頻度ですか？", answer: "月曜日から土曜日まで朝練と午後練がありますが、参加は自由です。自分の都合に合わせて参加してください。", position: 3 },
  { question: "費用はどのくらいかかりますか？", answer: "部費は年間で数千円程度です。合宿費用は別途かかりますが、リーズナブルな価格設定になっています。", position: 4 }
]

qa_data.each do |attrs|
  QaItem.find_or_create_by!(question: attrs[:question]) do |q|
    q.assign_attributes(attrs)
  end
end

puts "Seed data created successfully!"
