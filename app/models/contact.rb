class Contact < ApplicationRecord

  paginates_per 5

  belongs_to :kind # , optional: true

  # no update: caso queira atualizar phone ou address é necessário passar sei id, senão será feito um create

  # phones não foi criado pelo scaffolds e sim como um model comum
  # seu cadastrado será junto com o create/update de contato
  # permissão para delete para o phone
  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true

  # rails permite que mais de um endereço seja cadastrado no BD para o mesmo contato
  # porém, quando puxa o contato, pega o último endereço
  # update_only -> impede esse comportamento, apenas um registo, one to one, sem ser necessário passar o id
  has_one :address
  accepts_nested_attributes_for :address, update_only: true

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
