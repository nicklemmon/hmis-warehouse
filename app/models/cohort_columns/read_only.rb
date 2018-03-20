module CohortColumns
  class ReadOnly < Base


    def column_editable?
      false
    end

    def default_input_type
      :read_only
    end
    
    def display_for user
      display_read_only(user)
    end

    def display_read_only(user)
      value(cohort_client)
    end
  end
end
