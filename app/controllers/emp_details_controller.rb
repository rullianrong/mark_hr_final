class EmpDetailsController < ApplicationController
  before_action :set_emp_detail, only: %i[ show edit update destroy ]

  # GET /emp_details or /emp_details.json
  def index
    @emp_details = EmpDetail.all
  end

  # GET /emp_details/1 or /emp_details/1.json
  def show
  end

  # GET /emp_details/new
  def new
    @emp_detail = EmpDetail.new
  end

  # GET /emp_details/1/edit
  def edit
  end

  # POST /emp_details or /emp_details.json
  def create
    @emp_detail = EmpDetail.new(emp_detail_params)

    respond_to do |format|
      if @emp_detail.save
        format.html { redirect_to emp_detail_url(@emp_detail), notice: "Emp detail was successfully created." }
        format.json { render :show, status: :created, location: @emp_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emp_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emp_details/1 or /emp_details/1.json
  def update
    respond_to do |format|
      if @emp_detail.update(emp_detail_params)
        format.html { redirect_to emp_detail_url(@emp_detail), notice: "Emp detail was successfully updated." }
        format.json { render :show, status: :ok, location: @emp_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emp_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emp_details/1 or /emp_details/1.json
  def destroy
    @emp_detail.destroy

    respond_to do |format|
      format.html { redirect_to emp_details_url, notice: "Emp detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emp_detail
      @emp_detail = EmpDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emp_detail_params
      params.require(:emp_detail).permit(:fullname, :emp_id, :rank, :division, :sup_name, :pos_title, :ser_year, :ser_month, :educ_course, :educ_grad, :educ_skill, :educ_certificate, :educ_othskill, :contact, :department, :sup_title, :hr_perday, :hr_perweek, :break, :launch, :ot_weekday, :ot_weekend, :workday)
    end
end
