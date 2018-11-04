# frozen_string_literal: true

# All tasks actions should run by this controller
class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  # GET /tasks.json
  # Only orphan tasks should be shown
  def index
    @tasks = Task.where(project: nil).order(
      priority: :desc
    ).all.partition { |t| t.status.done }.last
  end

  # GET /tasks/1
  # GET /tasks/1.json
  # Showing a task should be ready to create a new comment
  def show
    @comment = Comment.new
  end

  # GET /tasks/new
  # TODO: Should be able to create a comment when a new task is created
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  # TODO: Should be able to create a comment when editing the task
  def edit; end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        respond_accordingly format
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to redirect_to_param, notice: 'Task updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def respond_accordingly(format)
    successful = 'Task was successfully created.'
    if params[:redirect_to].nil?
      format.html { redirect_to @task, notice: successful }
    else
      format.html do
        redirect_to @task.send(redirect_to_param), notice: successful
      end
    end
  end

  def redirect_to_param
    # Only permit redirections to the Models from where you can create a task
    if %w[parent project].include? params[:redirect_to]
      params[:redirect_to]
    else
      @task
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :priority,
      :status_id,
      :effort_id,
      :project_id,
      :parent_id,
      :creator_id
    )
  end
end
