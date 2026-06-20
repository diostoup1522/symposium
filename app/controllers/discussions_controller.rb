class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]

  # GET /discussions or /discussions.json
  def index
    @discussions = Discussion.order(created_at: :desc).limit(10)
  end

  # GET /discussions/1 or /discussions/1.json
  def show
    @messages = @discussion.messages
    @message = @discussion.messages.build
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
        format.html { redirect_to @discussion }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @discussion.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /discussions/1 or /discussions/1.json
  def update
    if current_user == @discussion.creator
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
  end

  # DELETE /discussions/1 or /discussions/1.json
  def destroy
    if current_user == @discussion.creator
      @discussion.destroy!

      respond_to do |format|
        format.html { redirect_to discussions_path, notice: "Discussion was successfully destroyed.", status: :see_other }
        format.json { head :no_content }
      end
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
