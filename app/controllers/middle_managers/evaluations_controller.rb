class MiddleManagers::EvaluationsController < ApplicationController
  include ActionView::Layouts
  include ActionController::MimeResponds

  acts_as_token_authentication_handler_for MiddleManager
  before_action :set_evaluation, only: [:show, :update ]
  
  respond_to :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @evaluations = current_middle_manager.evaluations.paginate(page: page, per_page: per_page)
    #@evaluations = Evaluation.where(:evaluationable_type => )
    respond_with(@evaluations)
  end

  def show
    respond_with(@evaluation)
  end

  # def create
  #   @evaluation = Leader::Evaluation.new(evaluation_params)
  #   @evaluation.save
  #   respond_with(@evaluation)
  # end

  def update
    @evaluation.update(evaluation_params)
    respond_with @evaluation, template: "middle_managers/evaluations/show", status: 201
  end

  # def destroy
  #   @evaluation.destroy
  #   respond_with(@evaluation)
  # end

  private
    def set_evaluation
      @evaluation = current_middle_manager.evaluations.find(params[:id])
    end

    def evaluation_params
      params.require( :evaluation ).permit(
        :duties, :thought_morals, 
        :upright_incorruptiable, :evaluation_totality
        )
    end
end
