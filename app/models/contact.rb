class Contact < ApplicationRecord
  belongs_to :kind # , optional: true
  has_many :phones
  # phones não foi criado pelo scaffolds e sim como um model comum
  # seu cadastrado será junto com o create/update de contato
  # permissão para delete para o phone
  accepts_nested_attributes_for :phones, allow_destroy: true

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

  def as_json(options = {})
    h = super(options)
    h[:birthdate] = (I18n.l(birthdate) unless birthdate.blank?)
    h
  end

  # def as_json(_options = {})
  # super(
  # root: true,
  # methods: %i[kind_description author],
  # include: { kind: { only: :description } }
  # )
  # end
end
