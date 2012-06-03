class DiffsController < ApplicationController
  # GET /diff obj1=:obj1 obj2=:obj2 type=yaml|json
  def diff
    if params[:type] == "yaml"
      @obj1 = YAML::load params[:obj1] rescue -1
      @obj2 = YAML::load params[:obj2] rescue -1
    elsif params[:type] == "json"
      @obj1 = JSON.parse params[:obj1] rescue -1
      @obj2 = JSON.parse params[:obj2] rescue -1
    else
      return render :text => "error: type must be specified. type can be yaml or json."
    end

    if @obj1 == -1 and @obj2 == -1
      return render :text => "error: parsing the two input value failed. Please check the format."
    elsif @obj1 == -1
      return render :text => "error: parsing the first object failed. Please check the format."
    elsif @obj2 == -1
      return render :text => "error: parsing the second object failed. Please check the format."
    end

    @changes = HashDiff.best_diff(@obj1, @obj2)
    render :partial => "diffs/diff"
  end
end
