class MessagesController < ApplicationController
    def index
        messages = Message.where(status: "Pending")
        render json: messages, status: :ok
    end

    def create
        message = Message.create!(message_params)
        render json: message, status: :created
    end

    def reply
        message = Message.find(params[:id])
        message.update(status: 'Replied')
        render json: { message: 'Replied successfully' }, status: :ok
          from = SendGrid::Email.new(name: 'SENDITCouriers', email: 'emmanuel.mutisya16@gmail.com')
          to = SendGrid::Email.new(email: params[:email])
          subject = 'Reply for reaching out!'
          content = SendGrid::Content.new(type: 'text/plain', value: params[:message])
          mail = SendGrid::Mail.new(from, subject, to, content)

          sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
          response = sg.client.mail._('send').post(request_body: mail.to_json)
    end

    private

    def message_params
        params.require(:formData).permit(:name, :email, :company, :phone, :help, :about, :status)
    end
end