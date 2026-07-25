# == Schema Information
#
# Table name: news
#
#  id          :bigint           not null, primary key
#  category    :string(255)      not null
#  description :text(65535)
#  end_time    :datetime
#  image       :string(255)
#  locale      :string(255)      not null
#  sent        :boolean          default(FALSE)
#  start_time  :datetime
#  time        :datetime         not null
#  title       :string(255)      not null
#  uid         :string(255)      not null
#  url         :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class News < ApplicationRecord
  validates_presence_of :uid, :url, :title, :time, :category, :locale

  Lodestone.categories.each do |category|
    scope category, -> { where(category: category) }
  end

  Lodestone.locales.each do |locale|
    scope locale, -> { where(locale: locale) }
  end

  scope :latest,  -> { ordered.limit(20) }
  scope :ordered, -> { order(time: :desc) }
  scope :sent,    -> { where(sent: true) }
  scope :unsent,  -> { where(sent: false) }

  def embed
    link = URI.parse(Lodestone.category(category)['link'])
    link.host = "#{locale}.#{link.host}"

    if locale == 'na' || locale == 'eu'
      language = 'en'
    else
      language = locale
    end

    if start_time.present? || end_time.present?
      text = formatted_duration
    else
      text = description
    end

    {
      author: {
        name: I18n.t("categories.#{category}", locale: language),
        url: link,
        icon_url: Lodestone.category(category)['icon']
      },
      title: title,
      description: text,
      url: url,
      color: Lodestone.category(category)['color'],
      thumbnail: {
        url: Lodestone.category(category)['thumbnail']
      },
      image: {
        url: image
      }
    }
  end

  def formatted_duration
    [start_time, end_time].compact.map { |time| "<t:#{time.to_i}>" }.join(' — ')
  end

  def self.metadata(locale:)
    NewsMeta.find_by(locale: locale)
  end
end
