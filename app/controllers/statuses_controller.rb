class StatusesController < ApplicationController
    def index
        status = Status.all
        render json: status, status: :ok
    end

    def update
      status = Status.find(params[:id])
      if params[:location]
        if status.update(location: params[:location])
          render json: { message: 'Location updated successfully' }, status: :ok
          from = SendGrid::Email.new(name: 'SENDITCouriers', email: 'emmanuel.mutisya@student.moringaschool.com')
          to = SendGrid::Email.new(email: status.parcel.user.email)
          subject = 'Package location update.'
          content = SendGrid::Content.new(type: 'text/plain', value: "Your package #{status.parcel.parcel_name}, has had a location updated to #{status.location}")
          mail = SendGrid::Mail.new(from, subject, to, content)

          sg = SendGrid::API.new(api_key: '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')
          response = sg.client.mail._('send').post(request_body: mail.to_json)
        else
          render json: { error: 'Failed to update location' }, status: :unprocessable_entity
        end
      elsif params[:status]
        if status.update(status: params[:status])
          render json: { message: 'Status updated successfully' }, status: :ok
          from = SendGrid::Email.new(name: 'SENDITCouriers', email: 'emmanuel.mutisya@student.moringaschool.com')
          to = SendGrid::Email.new(email: status.parcel.user.email)
          subject = 'Package status update.'
          content = SendGrid::Content.new(type: 'text/plain', value: "Your package #{status.parcel.parcel_name}, has had a status updated to #{status.status}")
          mail = SendGrid::Mail.new(from, subject, to, content)

          sg = SendGrid::API.new(api_key: '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')
          response = sg.client.mail._('send').post(request_body: mail.to_json)
        else
          render json: { error: 'Failed to update status' }, status: :unprocessable_entity
        end
      end
    end
    
end
