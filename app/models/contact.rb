class Contact < ApplicationRecord
  def author
    'Manu'
  end

  def as_json(_options = {})
    super(methods: :author, root: true)
  end
end
