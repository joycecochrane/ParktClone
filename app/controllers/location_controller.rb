class LocationController < ApplicationController

    def create

        params.permit(:lat, :lon, :uid)
        lat = params[:lat]
        lon = params[:lon]
        uid = current_user.uid # //add the current users uid

        #Limits the number of locations per user to 10
        while Location.where(User_id: uid).find_each.size>4 do
           temp = Location.where(User_id: uid).find_each.next
           temp.destroy
        end

        @location = Location.create(:lat => lat.to_f , :lon => lon.to_f,
                                    :User_id => uid.to_s);

        respond_to do |format|
        format.js { render nothing: true }
        end



    end

    def getHistory

        uid = current_user.uid

        @history = []

        Location.where(User_id: uid).find_each do |location|
            @history.push(location)
        end
        render "history.json", collection: @history
    end




end
