class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :post_user_likes
  has_many :likes, through: :post_user_likes
  validates :news_url, presence: true
  has_many :trusts, dependent: :destroy

  def trust_user(user)
    trusts.find_by(user_id: user.id)
  end

  def self.search(search)
    return Post.all unless search
    Post.where("title LIKE(?)", "%#{search}%")
  end

  def self.url_content(post)
    link = post["news_url"]
    agent = Mechanize.new
    current_page = agent.get(link)
    if current_page.title
      title = current_page.title 
    else
      title = "タイトルは自動取得不可"
    end
    if current_page.at('meta[property="og:image"]')
      ogp_url = current_page.at('meta[property="og:image"]')[:content]
    else
      ogp_url = "/assets/sample.png"
    end
    post["title"] = title
    post["ogp_url"] = ogp_url
    return post
  end

end
