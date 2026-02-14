require "test_helper"

class PagesTest < ActionDispatch::IntegrationTest
  setup do
    SiteSetting.set("hero_title", "テニスパートテスト")
    SiteSetting.set("hero_subtitle", "サブタイトル")
    SiteSetting.set("catchphrase", "キャッチフレーズ")
    Event.create!(title: "テストイベント", month: 4, position: 1)
    QaItem.create!(question: "テスト質問", answer: "テスト回答", position: 1)
  end

  test "home page renders successfully" do
    get root_path
    assert_response :success
    assert_select "h1", /テニスパートテスト/
  end
end
