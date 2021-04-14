class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビー・グッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: '家電・スマホ・カメラ' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :items
end

# 選択肢一覧 #
# レディース
# メンズ
# ベビー・グッズ
# インテリア・住まい・小物
# 本・音楽・ゲーム
# おもちゃ・ホビー・グッズ
# 家電・スマホ・カメラ
# スポーツ・レジャー
# その他
