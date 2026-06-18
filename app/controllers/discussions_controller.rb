class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [ :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]

  # GET /discussions or /discussions.json
  def index
    @discussions = Discussion.limit(10).order("created_at DESC")
  end

  # GET /discussions/1 or /discussions/1.json
  def show
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions or /discussions.json
  def create
    @discussion = current_user.discussions.build(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: "Discussion was successfully created." }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @discussion.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /discussions/1 or /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: "Discussion was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @discussion.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /discussions/1 or /discussions/1.json
  def destroy
    @discussion.destroy!

    respond_to do |format|
      format.html { redirect_to discussions_path, notice: "Discussion was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def discussion_params
      params.expect(discussion: [ :book, :author, :description, :creator_id ])
    end
end
