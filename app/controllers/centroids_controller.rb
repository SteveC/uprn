class CentroidsController < ApplicationController
    def show
        @centroid = Centroid.find(params[:id])
    end
end
