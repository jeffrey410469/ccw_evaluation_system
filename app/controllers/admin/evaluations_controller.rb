class Admin::EvaluationsController < Admin::BaseController
  before_action :set_term, except: [:export]
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :export]

  def show
    @question_types = @evaluation.question_types.uniq
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to admin_term_path(@term), notice: "成功新增會期評鑑"
    else
      render :new, alert: "資料錯誤"
    end
  end

  def edit
    @question = @evaluation.questions.build
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to admin_term_evaluation_path(@term, @evaluation)
    else
      render :edit
    end
  end

  def destroy
  end

  def export
    @congressmen = @evaluation.congressmen.includes(surveys: [:answers])
    render xlsx: 'export.xlsx.axlsx', filename: "export.xlsx"
  end

  private
    def set_term
      @term = Term.find(params[:term_id])
    end

    def set_evaluation
      @evaluations = Evaluation.all
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params[:evaluation].permit(:session_number, :term_id, :active,
       questions_attributes: [:id, :name, :question_type_id, :_destroy])
    end
end
