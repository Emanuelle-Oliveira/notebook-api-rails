module V2
  class ContactsController < ApplicationController
    before_action :set_contact, only: %i[show update destroy]

    # GET /contacts
    def index
      # if params[:version] == '1'
      # @contacts = Contact.all
      # elsif params[:version] == '2'
      # @contacts = Contact.last(5).reverse
      # end

      @contacts = Contact.last(5)

      # @contacts.as_json.to_json
      render json: @contacts
      # , methods: :birthdate_br
      # , methods: %i[hello i18n]
      # , methods: :author
      # .map { |contact| contact.attributes.merge({ author: 'manu' }) }
      # except: [:name, :email] #only: [:name, :email] #root: true #status: :partial_content
    end

    # GET /contacts/1
    def show
      render json: @contact, include: %i[kind address phones]
      # , meta: { author: 'Manu' }
      # meta -> informações extras
      # , include: %i[kind phones address]
      # phones são incluidos pelo ams pq são do tipo has_many e has_one
      # kind é belongs to
      # .to_br
      # @contact # , include: :kind
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: %i[kind phones address], status: :created, location: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: %i[kind phones address]
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      # params.require(:contact).permit(
      #  :name,
      #  :email,
      #  :birthdate,
      #  :kind_id,
      #  phones_attributes: %i[id number _destroy],
      #  address_attributes: %i[id street city]
      # )
      # faz a conversão para que o ruby entenda:
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
  end
end
