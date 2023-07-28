class Contact < ApplicationRecord
  belongs_to :kind # , optional: true

  def birthdate_br
    I18n.l(birthdate) unless birthdate.blank?
  end

  def to_br
    { 
      name: name,
      email: email,
      birthdate: (I18n.l(birthdate) unless birthdate.blank?) 
    }
  end

  def author
    'Manu'
  end

  def kind_description
    kind.description
  end

  def hello
    I18n.t('hello')
  end

  def i18n
    I18n.default_locale
  end

  # def as_json(_options = {})
  # super(
  # root: true,
  # methods: %i[kind_description author],
  # include: { kind: { only: :description } }
  # )
  # end
end
