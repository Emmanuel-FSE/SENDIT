class ContactController < ApplicationController
    def create
        first_name = params[:first_name]
        last_name = params[:last_name]
        email = params[:email]
        company = params[:company]
        help = params[:help]
        phone = params[:phone]
        about_us = params[:about_us]
        subject = params[:subject]


        data = JSON.parse('{
            "personalizations": [
              {
                "to": [
                  {
                    "email": "emmanuelmutisya254@gmail.com",
                  }
                ],
                "subject": "Sending with Twilio SendGrid is Fun"
              }
            ],
            "from": {
              "email": "emmanuel.mutisya16@gmail.com"
            },
            "content": [
              {
                "type": "text/plain",
                "value": "Name: #{first_name} #{last_name}\nEmail: #{email}\nCompany: #{company}\nHelp: #{help}\nPhone: #{phone}\nAbout Us: #{about_us}"
              }
            ]
          }')
        

        # from = SendGrid::Email.new(email: 'emmanuel.mutisya16@gmail.com')
        # to = SendGrid::Email.new(email: email)
        # subject = subject
        # content = SendGrid::Content.new(type: 'text/plain', value: 'Name: #{first_name} #{last_name}\nEmail: #{email}\nCompany: #{company}\nHelp: #{help}\nPhone: #{phone}\nAbout Us: #{about_us}')
        # mail = SendGrid::Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: data)

        puts response.status_code
        puts response.body
        puts response.parsed_body
        puts response.headers

        # if response.code == 200 || response.code == 202
        #     render json: { message: 'Email sent successfully' }, status: :ok
        # else
        #     render json: { message: 'Email failed to send' }, status: :unprocessable_entity
        # end
    end
end
