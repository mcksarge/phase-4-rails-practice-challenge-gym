class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        memberships = Membership.all
        render json: memberships
    end

    def show
        membership = Membership.find(params[:id])
        render json: membership
    end

    def create
        if Membership.find_by(mem_params)
            render json: { error: "Membership already exists" }
        else
            membership = Membership.create(mem_params)
            render json: membership, status: :created
        end
    end
    

    private

    def render_not_found_response
        render json: { error: "Membership not found" }, status: :not_found
    end

    def mem_params
        params.permit(:gym_id, :client_id, :charge)
    end
end
