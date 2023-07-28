class Contact < ApplicationRecord
  belongs_to :kind # , optional: true

  def author
    'Manu'
  end

  def kind_description
    kind.description
  end

  # def as_json(_options = {})
  # super(
  # root: true,
  # methods: %i[kind_description author],
  # include: { kind: { only: :description } }
  # )
  # end
end
