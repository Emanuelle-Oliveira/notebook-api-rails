module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate # , :author  atributo virtual

    belongs_to :kind do
      # link(:related) { kind_url(object.kind.id) }
      link(:related) { v1_contact_kind_url(object.kind.id) }
    end

    has_many :phones do
      link(:related) { v1_contact_phones_url(object.kind.id) }
    end

    has_one :address do
      link(:related) { v1_contact_address_url(object.kind.id) }
    end

    # link(:self) { contact_url(object.id) }
    # link(:kind) { kind_url(object.kind.id) }

    # informação extra para toidas as requisições
    meta do
      { author: 'Manu' }
    end

    def author
      'Manu'
    end

    def attributes(*args)
      h = super(*args)
      # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
      h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
      h
    end
  end
end
