# frozen_string_literal: true

# All effort management should be done by an admin
class EffortsController < ApplicationController
  before_action :set_effort, only: %i[show edit update destroy]
  SUCCESS = 'Effort was successfully '
  UE = :unprocessable_entity

  # GET /efforts
  # GET /efforts.json
  def index
    @efforts = Effort.all
  end

  # GET /efforts/1
  # GET /efforts/1.json
  def show; end

  # GET /efforts/new
  def new
    @effort = Effort.new
  end

  # GET /efforts/1/edit
  def edit; end

  # POST /efforts
  # POST /efforts.json
  def create
    @effort = Effort.new(effort_params)

    respond_to do |format|
      if @effort.save
        format.html { redirect_to @effort, notice: SUCCESS + ' created.' }
        format.json { render :show, status: :created, location: @effort }
      else
        format.html { render :new }
        format.json { render json: @effort.errors, status: UE }
      end
    end
  end

  # PATCH/PUT /efforts/1
  # PATCH/PUT /efforts/1.json
  def update
    respond_to do |format|
      if @effort.update(effort_params)
        format.html { redirect_to @effort, notice: SUCCESS + 'updated.' }
        format.json { render :show, status: :ok, location: @effort }
      else
        format.html { render :edit }
        format.json { render json: @effort.errors, status: UE }
      end
    end
  end

  # DELETE /efforts/1
  # DELETE /efforts/1.json
  def destroy
    @effort.destroy
    respond_to do |format|
      format.html { redirect_to efforts_url, notice: SUCCESS + 'destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_effort
    @effort = Effort.find(params[:id])
  end

  def effort_params
    params.require(:effort).permit(:name, :description)
  end
end
