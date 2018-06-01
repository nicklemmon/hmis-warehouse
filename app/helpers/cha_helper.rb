module ChaHelper

  def cha_select f, field
    f.input field,
      label: _("CHA #{field.upcase}"),
      collection: cha_options[field],
      selected: f.object.answer(field),
      include_blank: true
  end

  def cha_radios f, field
    capture do
      concat content_tag(:strong, header_for(field))
      concat content_tag(:p, subheader_for(field), class: 'help-text')
      concat f.input field, 
        label: _("CHA #{field.upcase}"), 
        as: :radio_buttons, 
        collection: cha_options[field], 
        checked: f.object.answer(field)
    end
  end

  def cha_checkboxes f, field
    f.input field, 
      label: _("CHA #{field.upcase}"), 
      as: :check_boxes, 
      collection: cha_options[field], 
      checked: f.object.answer(field)
  end

  def cha_datepicker f, field, input_html_options={}
    f.input field, 
      label: _("CHA #{field.upcase}"), 
      as: :date_picker, 
      input_html: input_html_options[:input_html] || { value: f.object.answer(field) }
  end

  def cha_string f, field, input_html_options={}
    capture do
      if header = header_for(field)
        concat content_tag(:strong, header)
      end
      if subheader = subheader_for(field)
        concat content_tag(:p, raw(subheader), class: 'help-text')
      end
      concat f.input field, 
        label: _("CHA #{field.upcase}"), 
        input_html: input_html_options[:input_html] || { value: f.object.answer(field) }
    end
  end

  def cha_text f, field
    f.input field, 
      label: _("CHA #{field.upcase}"), 
      as: :text,
      input_html: { value: f.object.answer(field) }
  end

  def header_for field
    key = "CHA #{field.upcase}_HEADER"
    header = _( key )
    (header.blank? || header==key) ? nil : header
  end

  def subheader_for field
    key = "CHA #{field.upcase}_SUBHEADER"
    subheader = _( key )
    (subheader.blank? || subheader==key) ? nil : subheader
  end

  def cha_options
    Health::ComprehensiveHealthAssessment::QUESTION_ANSWER_OPTIONS
  end

  # For gettext to find and create translation keys
  #
  _("CHA A_Q1")
  _("CHA A_Q2")
  _("CHA A_Q3")
  _("CHA A_Q4")
  _("CHA A_Q5A")
  _("CHA A_Q5B")
  _("CHA A_Q5C")
  _("CHA A_Q6")
  _("CHA A_Q7")
  _("CHA A_Q8")
  _("CHA A_Q9")
  _("CHA A_Q10")
  _("CHA A_Q11")
  _("CHA A_Q12")
  _("CHA B_Q1")
  _("CHA B_Q2")
  _("CHA B_Q3")
  _("CHA B_Q4")
  _("CHA C_Q1")
  _("CHA C_Q2")
  _("CHA C_Q3")
  _("CHA D_Q1")
  _("CHA D_Q2")
  _("CHA D_Q3")
  _("CHA D_Q4")
  _("CHA E_Q1A_HEADER")
  _("CHA E_Q1A_SUBHEADER")
  _("CHA E_Q1A")
  _("CHA E_Q1B")
  _("CHA E_Q1C")
  _("CHA E_Q1D")
  _("CHA E_Q1E")
  _("CHA E_Q1F")
  _("CHA E_Q1G")
  _("CHA E_Q1H")
  _("CHA E_Q1I")
  _("CHA E_Q2A_HEADER")
  _("CHA E_Q2A")
  _("CHA E_Q2B")
  _("CHA E_Q2C")
  _("CHA F_Q1A")
  _("CHA F_Q1A_HEADER")
  _("CHA F_Q1A_SUBHEADER")
  _("CHA F_Q1B")
  _("CHA F_Q1C")
  _("CHA F_Q1D")
  _("CHA F_Q1E")
  _("CHA F_Q1F")
  _("CHA F_Q2")
  _("CHA F_Q2_HEADER")
  _("CHA F_Q3_HEADER")
  _("CHA F_Q3_SUBHEADER")
  _("CHA F_Q3")
  _("CHA F_Q4")
  _("CHA F_Q5")
  _("CHA G_Q1A_HEADER")
  _("CHA G_Q1B_HEADER")
  _("CHA G_Q1C_HEADER")
  _("CHA G_Q1D_HEADER")
  _("CHA G_Q1E_HEADER")
  _("CHA G_Q1F_HEADER")
  _("CHA G_Q1G_HEADER")
  _("CHA G_Q1H_HEADER")
  _("CHA G_Q1AP")
  _("CHA G_Q1BP")
  _("CHA G_Q1CP")
  _("CHA G_Q1DP")
  _("CHA G_Q1EP")
  _("CHA G_Q1FP")
  _("CHA G_Q1GP")
  _("CHA G_Q1HP")
  _("CHA G_Q1AC")
  _("CHA G_Q1BC")
  _("CHA G_Q1CC")
  _("CHA G_Q1DC")
  _("CHA G_Q1EC")
  _("CHA G_Q1FC")
  _("CHA G_Q1GC")
  _("CHA G_Q1HC")
  _("CHA G_Q2A")
  _("CHA G_Q2B")
  _("CHA G_Q2C")
  _("CHA G_Q2D")
  _("CHA G_Q2E")
  _("CHA G_Q2F")
  _("CHA G_Q3")
  _("CHA G_Q4A_HEADER")
  _("CHA G_Q4A")
  _("CHA G_Q4B")
  _("CHA G_Q5_HEADER")
  _("CHA G_Q5")
  _("CHA G_Q6A")
  _("CHA G_Q6B")
  _("CHA H_Q1")
  _("CHA I_Q1A_SUBHEADER")
  _("CHA I_Q1C_SUBHEADER")
  _("CHA I_Q1F_SUBHEADER")
  _("CHA I_Q1I_SUBHEADER")
  _("CHA I_Q1M_SUBHEADER")
  _("CHA I_Q1A")
  _("CHA I_Q1B")
  _("CHA I_Q1C")
  _("CHA I_Q1D")
  _("CHA I_Q1E")
  _("CHA I_Q1F")
  _("CHA I_Q1G")
  _("CHA I_Q1H")
  _("CHA I_Q1I")
  _("CHA I_Q1J")
  _("CHA I_Q1K")
  _("CHA I_Q1L")
  _("CHA I_Q1M")
  _("CHA I_Q1N")
  _("CHA I_Q2A1")
  _("CHA I_Q2B1")
  _("CHA I_Q2C1")
  _("CHA I_Q2D1")
  _("CHA I_Q2E1")
  _("CHA I_Q2F1")
  _("CHA I_Q2A2")
  _("CHA I_Q2B2")
  _("CHA I_Q2C2")
  _("CHA I_Q2D2")
  _("CHA I_Q2E2")
  _("CHA I_Q2F2")
  _("CHA I_Q2A3")
  _("CHA I_Q2B3")
  _("CHA I_Q2C3")
  _("CHA I_Q2D3")
  _("CHA I_Q2E3")
  _("CHA I_Q2F3")
  _("CHA J_Q1")
  _("CHA J_Q2")
  _("CHA J_Q3A")
  _("CHA J_Q3B")
  _("CHA J_Q3C")
  _("CHA J_Q3D")
  _("CHA J_Q3E")
  _("CHA J_Q3F")
  _("CHA J_Q3G")
  _("CHA J_Q3H")
  _("CHA J_Q3I")
  _("CHA J_Q3J")
  _("CHA J_Q3K")
  _("CHA J_Q3L")
  _("CHA J_Q4")
  _("CHA J_Q5")
  _("CHA J_Q6A_HEADER")
  _("CHA J_Q6A_SUBHEADER")
  _("CHA J_Q6A")
  _("CHA J_Q6B")
  _("CHA J_Q6C")
  _("CHA J_Q6D")
  _("CHA J_Q6E")
  _("CHA J_Q7A_HEADER")
  _("CHA J_Q7A")
  _("CHA J_Q7B")
  _("CHA J_Q8_HEADER")
  _("CHA J_Q8")
  _("CHA J_Q9A_HEADER")
  _("CHA J_Q9A")
  _("CHA J_Q9B")
  _("CHA K_Q1A_HEADER")
  _("CHA K_Q1A")
  _("CHA K_Q1B")
  _("CHA K_Q1C")
  _("CHA K_Q1D")
  _("CHA L_Q1S1A_HEADER")
  _("CHA L_Q1S1A_SUBHEADER")
  _("CHA L_Q1S1A")
  _("CHA L_Q1S1B")
  _("CHA L_Q1S1C")
  _("CHA L_Q1S1D")
  _("CHA L_Q1S1E")
  _("CHA L_Q1S1F")
  _("CHA L_Q1S1G")
  _("CHA L_Q1S2A")
  _("CHA L_Q1S2B")
  _("CHA L_Q1S2C")
  _("CHA L_Q1S2D")
  _("CHA L_Q1S2E")
  _("CHA L_Q1S2F")
  _("CHA L_Q1S2G")
  _("CHA L_Q1S3A")
  _("CHA L_Q1S3B")
  _("CHA L_Q1S3C")
  _("CHA L_Q1S3D")
  _("CHA L_Q1S3E")
  _("CHA L_Q1S3F")
  _("CHA L_Q1S3G")
  _("CHA L_Q1S4A")
  _("CHA L_Q1S4B")
  _("CHA L_Q1S4C")
  _("CHA L_Q1S4D")
  _("CHA L_Q1S4E")
  _("CHA L_Q1S4F")
  _("CHA L_Q1S4G")
  _("CHA L_Q1S5A")
  _("CHA L_Q1S5B")
  _("CHA L_Q1S5C")
  _("CHA L_Q1S5D")
  _("CHA L_Q1S5E")
  _("CHA L_Q1S5F")
  _("CHA L_Q1S5G")
  _("CHA L_Q2")
  _("CHA M_Q1A")
  _("CHA M_Q1B")
  _("CHA M_Q1C")
  _("CHA M_Q1D")
  _("CHA M_Q1E")
  _("CHA M_Q1F")
  _("CHA M_Q1G")
  _("CHA M_Q1H")
  _("CHA M_Q1A_HEADER")
  _("CHA M_Q1A")
  _("CHA M_Q1B")
  _("CHA M_Q1C")
  _("CHA M_Q2A_HEADER")
  _("CHA M_Q2A_SUBHEADER")
  _("CHA M_Q2A")
  _("CHA M_Q2B")
  _("CHA M_Q2C")
  _("CHA N_Q1")
  _("CHA O_Q1_HEADER")
  _("CHA O_Q1")
  _("CHA P_Q1")
  _("CHA P_Q2")
  _("CHA Q_Q1")
  _("CHA Q_Q2")

  _("CHA A_Q2_A1")
  _("CHA A_Q2_A2")
  _("CHA A_Q4_A1")
  _("CHA A_Q4_A2")
  _("CHA A_Q4_A3")
  _("CHA A_Q4_A4")
  _("CHA A_Q4_A5")
  _("CHA A_Q4_A6")
  _("CHA A_Q7_A1")
  _("CHA A_Q7_A2")
  _("CHA A_Q7_A3")
  _("CHA A_Q7_A4")
  _("CHA A_Q7_A5")
  _("CHA A_Q7_A6")
  _("CHA A_Q7_A7")
  _("CHA A_Q11_A1")
  _("CHA A_Q11_A2")
  _("CHA A_Q11_A3")
  _("CHA A_Q11_A4")
  _("CHA A_Q11_A5")
  _("CHA A_Q11_A6")
  _("CHA A_Q11_A7")
  _("CHA A_Q11_A8")
  _("CHA A_Q11_A9")
  _("CHA A_Q11_A10")
  _("CHA A_Q11_A11")
  _("CHA A_Q11_A12")
  _("CHA A_Q11_A13")
  _("CHA A_Q11_A14")
  _("CHA A_Q12_A1")
  _("CHA A_Q12_A2")
  _("CHA A_Q12_A3")
  _("CHA A_Q12_A4")
  _("CHA A_Q12_A5")
  _("CHA A_Q12_A6")
  _("CHA A_Q12_A7")
  _("CHA A_Q12_A8")
  _("CHA B_Q2_A1")
  _("CHA B_Q2_A2")
  _("CHA B_Q2_A3")
  _("CHA B_Q2_A4")
  _("CHA B_Q2_A5")
  _("CHA B_Q2_A6")
  _("CHA B_Q3_A1")
  _("CHA B_Q3_A2")
  _("CHA B_Q3_A3")
  _("CHA B_Q3_A4")
  _("CHA B_Q4_A1")
  _("CHA B_Q4_A2")
  _("CHA B_Q4_A3")
  _("CHA B_Q4_A4")
  _("CHA B_Q4_A5")
  _("CHA C_Q1_A1")
  _("CHA C_Q1_A2")
  _("CHA C_Q1_A3")
  _("CHA C_Q1_A4")
  _("CHA C_Q1_A5")
  _("CHA C_Q1_A6")
  _("CHA C_Q2_A1")
  _("CHA C_Q2_A2")
  _("CHA C_Q3_A1")
  _("CHA C_Q3_A2")
  _("CHA C_Q3_A3")
  _("CHA C_Q3_A4")
  _("CHA C_Q1_A1")
  _("CHA C_Q1_A2")
  _("CHA C_Q1_A3")
  _("CHA C_Q1_A4")
  _("CHA C_Q1_A5")
  _("CHA C_Q2_A1")
  _("CHA C_Q2_A2")
  _("CHA C_Q2_A3")
  _("CHA C_Q2_A4")
  _("CHA C_Q2_A5")
  _("CHA C_Q3_A1")
  _("CHA C_Q3_A2")
  _("CHA C_Q3_A3")
  _("CHA C_Q3_A4")
  _("CHA C_Q3_A5")
  _("CHA C_Q4_A1")
  _("CHA C_Q4_A2")
  _("CHA C_Q4_A3")
  _("CHA C_Q4_A4")
  _("CHA C_Q4_A5")
  _("CHA D_Q1_A1")
  _("CHA D_Q1_A2")
  _("CHA D_Q1_A3")
  _("CHA D_Q1_A4")
  _("CHA D_Q1_A5")
  _("CHA D_Q2_A1")
  _("CHA D_Q2_A2")
  _("CHA D_Q2_A3")
  _("CHA D_Q2_A4")
  _("CHA D_Q2_A5")
  _("CHA D_Q3_A1")
  _("CHA D_Q3_A2")
  _("CHA D_Q3_A3")
  _("CHA D_Q3_A4")
  _("CHA D_Q3_A5")
  _("CHA D_Q4_A1")
  _("CHA D_Q4_A2")
  _("CHA D_Q4_A3")
  _("CHA D_Q4_A4")
  _("CHA D_Q4_A5")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q1A_A1")
  _("CHA E_Q1A_A2")
  _("CHA E_Q1A_A3")
  _("CHA E_Q1A_A4")
  _("CHA E_Q2A_A1")
  _("CHA E_Q2A_A2")
  _("CHA E_Q2A_A3")
  _("CHA E_Q2A_A4")
  _("CHA E_Q2A_A5")
  _("CHA E_Q2A_A1")
  _("CHA E_Q2A_A2")
  _("CHA E_Q2A_A3")
  _("CHA E_Q2A_A4")
  _("CHA E_Q2A_A5")
  _("CHA E_Q2A_A1")
  _("CHA E_Q2A_A2")
  _("CHA E_Q2A_A3")
  _("CHA E_Q2A_A4")
  _("CHA E_Q2A_A5")
  _("CHA F_Q1A_A1")
  _("CHA F_Q1A_A2")
  _("CHA F_Q1A_A3")
  _("CHA F_Q1A_A4")
  _("CHA F_Q1A_A5")
  _("CHA F_Q1A_A6")
  _("CHA F_Q1A_A1")
  _("CHA F_Q1A_A2")
  _("CHA F_Q1A_A3")
  _("CHA F_Q1A_A4")
  _("CHA F_Q1A_A5")
  _("CHA F_Q1A_A6")
  _("CHA F_Q1A_A1")
  _("CHA F_Q1A_A2")
  _("CHA F_Q1A_A3")
  _("CHA F_Q1A_A4")
  _("CHA F_Q1A_A5")
  _("CHA F_Q1A_A6")
  _("CHA F_Q1A_A1")
  _("CHA F_Q1A_A2")
  _("CHA F_Q1A_A3")
  _("CHA F_Q1A_A4")
  _("CHA F_Q1A_A5")
  _("CHA F_Q1A_A6")
  _("CHA F_Q1A_A1")
  _("CHA F_Q1A_A2")
  _("CHA F_Q1A_A3")
  _("CHA F_Q1A_A4")
  _("CHA F_Q1A_A5")
  _("CHA F_Q1A_A6")
  _("CHA F_Q1A_A1")
  _("CHA F_Q1A_A2")
  _("CHA F_Q1A_A3")
  _("CHA F_Q1A_A4")
  _("CHA F_Q1A_A5")
  _("CHA F_Q1A_A6")
  _("CHA F_Q2_A1")
  _("CHA F_Q2_A2")
  _("CHA F_Q3_A1")
  _("CHA F_Q3_A2")
  _("CHA F_Q3_A3")
  _("CHA F_Q4_A1")
  _("CHA F_Q4_A2")
  _("CHA F_Q4_A3")
  _("CHA F_Q4_A4")
  _("CHA F_Q5_A1")
  _("CHA F_Q5_A2")
  _("CHA G_Q1AP_A1")
  _("CHA G_Q1AP_A2")
  _("CHA G_Q1AP_A3")
  _("CHA G_Q1AP_A4")
  _("CHA G_Q1AP_A5")
  _("CHA G_Q1AP_A6")
  _("CHA G_Q1AP_A7")
  _("CHA G_Q1AP_A8")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A8")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A8")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A8")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A8")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A8")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A8")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q1A_A1")
  _("CHA G_Q1A_A2")
  _("CHA G_Q1A_A3")
  _("CHA G_Q1A_A4")
  _("CHA G_Q1A_A5")
  _("CHA G_Q1A_A6")
  _("CHA G_Q1A_A7")
  _("CHA G_Q2A_A1")
  _("CHA G_Q2A_A2")
  _("CHA G_Q2A_A3")
  _("CHA G_Q2A_A4")
  _("CHA G_Q2A_A5")
  _("CHA G_Q2A_A6")
  _("CHA G_Q2A_A7")
  _("CHA G_Q2A_A8")
  _("CHA G_Q2A_A1")
  _("CHA G_Q2A_A2")
  _("CHA G_Q2A_A3")
  _("CHA G_Q2A_A4")
  _("CHA G_Q2A_A5")
  _("CHA G_Q2A_A6")
  _("CHA G_Q2A_A7")
  _("CHA G_Q2A_A8")
  _("CHA G_Q2A_A1")
  _("CHA G_Q2A_A2")
  _("CHA G_Q2A_A3")
  _("CHA G_Q2A_A4")
  _("CHA G_Q2A_A5")
  _("CHA G_Q2A_A6")
  _("CHA G_Q2A_A7")
  _("CHA G_Q2A_A8")
  _("CHA G_Q2A_A1")
  _("CHA G_Q2A_A2")
  _("CHA G_Q2A_A3")
  _("CHA G_Q2A_A4")
  _("CHA G_Q2A_A5")
  _("CHA G_Q2A_A6")
  _("CHA G_Q2A_A7")
  _("CHA G_Q2A_A8")
  _("CHA G_Q2A_A1")
  _("CHA G_Q2A_A2")
  _("CHA G_Q2A_A3")
  _("CHA G_Q2A_A4")
  _("CHA G_Q2A_A5")
  _("CHA G_Q2A_A6")
  _("CHA G_Q2A_A7")
  _("CHA G_Q2A_A8")
  _("CHA G_Q2A_A1")
  _("CHA G_Q2A_A2")
  _("CHA G_Q2A_A3")
  _("CHA G_Q2A_A4")
  _("CHA G_Q2A_A5")
  _("CHA G_Q2A_A6")
  _("CHA G_Q2A_A7")
  _("CHA G_Q2A_A8")
  _("CHA G_Q3_A1")
  _("CHA G_Q3_A2")
  _("CHA G_Q3_A3")
  _("CHA G_Q3_A4")
  _("CHA G_Q4A_A1")
  _("CHA G_Q4A_A2")
  _("CHA G_Q4A_A3")
  _("CHA G_Q4A_A4")
  _("CHA G_Q4A_A5")
  _("CHA G_Q4B_A1")
  _("CHA G_Q4B_A2")
  _("CHA G_Q4B_A3")
  _("CHA G_Q4B_A4")
  _("CHA G_Q5_A1")
  _("CHA G_Q5_A2")
  _("CHA G_Q5_A3")
  _("CHA G_Q5_A4")
  _("CHA G_Q6A_A1")
  _("CHA G_Q6A_A2")
  _("CHA G_Q6B_A1")
  _("CHA G_Q6B_A2")
  _("CHA H_Q1_A1")
  _("CHA H_Q1_A2")
  _("CHA H_Q1_A3")
  _("CHA H_Q1_A4")
  _("CHA H_Q1_A5")
  _("CHA H_Q1_A6")
  _("CHA H_Q1_A7")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA I_Q1A_A1")
  _("CHA I_Q1A_A2")
  _("CHA I_Q1A_A3")
  _("CHA I_Q1A_A4")
  _("CHA J_Q1_A1")
  _("CHA J_Q1_A2")
  _("CHA J_Q1_A3")
  _("CHA J_Q1_A4")
  _("CHA J_Q2_A1")
  _("CHA J_Q2_A2")
  _("CHA J_Q2_A3")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q3A_A1")
  _("CHA J_Q3A_A2")
  _("CHA J_Q3A_A3")
  _("CHA J_Q3A_A4")
  _("CHA J_Q3A_A5")
  _("CHA J_Q4_A1")
  _("CHA J_Q4_A2")
  _("CHA J_Q4_A3")
  _("CHA J_Q4_A4")
  _("CHA J_Q5_A1")
  _("CHA J_Q5_A2")
  _("CHA J_Q5_A3")
  _("CHA J_Q5_A4")
  _("CHA J_Q5_A5")
  _("CHA J_Q6A_A1")
  _("CHA J_Q6A_A2")
  _("CHA J_Q6A_A3")
  _("CHA J_Q6A_A4")
  _("CHA J_Q6B_A1")
  _("CHA J_Q6B_A2")
  _("CHA J_Q6B_A3")
  _("CHA J_Q6B_A4")
  _("CHA J_Q6B_A5")
  _("CHA J_Q6C_A1")
  _("CHA J_Q6C_A2")
  _("CHA J_Q6C_A3")
  _("CHA J_Q6C_A4")
  _("CHA J_Q6D_A1")
  _("CHA J_Q6D_A2")
  _("CHA J_Q6E_A1")
  _("CHA J_Q6E_A2")
  _("CHA J_Q6E_A3")
  _("CHA J_Q6E_A4")
  _("CHA J_Q6E_A5")
  _("CHA J_Q6E_A6")
  _("CHA J_Q7A_A1")
  _("CHA J_Q7A_A2")
  _("CHA J_Q7A_A1")
  _("CHA J_Q7A_A2")
  _("CHA J_Q8_A1")
  _("CHA J_Q8_A2")
  _("CHA J_Q8_A3")
  _("CHA J_Q8_A4")
  _("CHA J_Q8_A5")
  _("CHA J_Q9A_A1")
  _("CHA J_Q9A_A2")
  _("CHA J_Q9A_A3")
  _("CHA J_Q9B_A1")
  _("CHA J_Q9B_A2")
  _("CHA J_Q9B_A3")
  _("CHA J_Q9B_A4")
  _("CHA K_Q1A_A1")
  _("CHA K_Q1A_A2")
  _("CHA J_Q7A_A1")
  _("CHA J_Q7A_A2")
  _("CHA J_Q7A_A1")
  _("CHA J_Q7A_A2")
  _("CHA J_Q7A_A1")
  _("CHA J_Q7A_A2")
  _("CHA L_Q1_1C_A1")
  _("CHA L_Q1_1C_A2")
  _("CHA L_Q1_1C_A3")
  _("CHA L_Q1_1C_A4")
  _("CHA L_Q1_1C_A5")
  _("CHA L_Q1_1C_A6")
  _("CHA L_Q1_1C_A7")
  _("CHA L_Q1_1C_A8")
  _("CHA L_Q1_1C_A9")
  _("CHA L_Q1_1C_A10")
  _("CHA L_Q1_1C_A11")
  _("CHA L_Q1_1C_A12")
  _("CHA L_Q1_1D_A1")
  _("CHA L_Q1_1D_A2")
  _("CHA L_Q1_1D_A3")
  _("CHA L_Q1_1D_A4")
  _("CHA L_Q1_1D_A5")
  _("CHA L_Q1_1D_A6")
  _("CHA L_Q1_1D_A7")
  _("CHA L_Q1_1D_A8")
  _("CHA L_Q1_1D_A9")
  _("CHA L_Q1_1D_A10")
  _("CHA L_Q1_1D_A11")
  _("CHA L_Q1_1D_A12")
  _("CHA L_Q1_1D_A13")
  _("CHA L_Q1_1E_A1")
  _("CHA L_Q1_1E_A2")
  _("CHA L_Q1_1E_A3")
  _("CHA L_Q1_1E_A4")
  _("CHA L_Q1_1E_A5")
  _("CHA L_Q1_1E_A6")
  _("CHA L_Q1_1E_A7")
  _("CHA L_Q1_1E_A8")
  _("CHA L_Q1_1E_A9")
  _("CHA L_Q1_1E_A10")
  _("CHA L_Q1_1E_A11")
  _("CHA L_Q1_1E_A12")
  _("CHA L_Q1_1E_A13")
  _("CHA L_Q1_1E_A14")
  _("CHA L_Q1_1E_A15")
  _("CHA L_Q1_1E_A16")
  _("CHA L_Q1_1E_A17")
  _("CHA L_Q1_1E_A18")
  _("CHA L_Q1_1E_A19")
  _("CHA L_Q1_1E_A20")
  _("CHA L_Q1_1E_A21")
  _("CHA L_Q1_1F_A1")
  _("CHA L_Q1_1F_A2")
  _("CHA L_Q1_1C_A1")
  _("CHA L_Q1_1C_A2")
  _("CHA L_Q1_1C_A3")
  _("CHA L_Q1_1C_A4")
  _("CHA L_Q1_1C_A5")
  _("CHA L_Q1_1C_A6")
  _("CHA L_Q1_1C_A7")
  _("CHA L_Q1_1C_A8")
  _("CHA L_Q1_1C_A9")
  _("CHA L_Q1_1C_A10")
  _("CHA L_Q1_1C_A11")
  _("CHA L_Q1_1C_A12")
  _("CHA L_Q1_1D_A1")
  _("CHA L_Q1_1D_A2")
  _("CHA L_Q1_1D_A3")
  _("CHA L_Q1_1D_A4")
  _("CHA L_Q1_1D_A5")
  _("CHA L_Q1_1D_A6")
  _("CHA L_Q1_1D_A7")
  _("CHA L_Q1_1D_A8")
  _("CHA L_Q1_1D_A9")
  _("CHA L_Q1_1D_A10")
  _("CHA L_Q1_1D_A11")
  _("CHA L_Q1_1D_A12")
  _("CHA L_Q1_1D_A13")
  _("CHA L_Q1_1E_A1")
  _("CHA L_Q1_1E_A2")
  _("CHA L_Q1_1E_A3")
  _("CHA L_Q1_1E_A4")
  _("CHA L_Q1_1E_A5")
  _("CHA L_Q1_1E_A6")
  _("CHA L_Q1_1E_A7")
  _("CHA L_Q1_1E_A8")
  _("CHA L_Q1_1E_A9")
  _("CHA L_Q1_1E_A10")
  _("CHA L_Q1_1E_A11")
  _("CHA L_Q1_1E_A12")
  _("CHA L_Q1_1E_A13")
  _("CHA L_Q1_1E_A14")
  _("CHA L_Q1_1E_A15")
  _("CHA L_Q1_1E_A16")
  _("CHA L_Q1_1E_A17")
  _("CHA L_Q1_1E_A18")
  _("CHA L_Q1_1E_A19")
  _("CHA L_Q1_1E_A20")
  _("CHA L_Q1_1E_A21")
  _("CHA L_Q1_1F_A1")
  _("CHA L_Q1_1F_A2")
  _("CHA L_Q1_1C_A1")
  _("CHA L_Q1_1C_A2")
  _("CHA L_Q1_1C_A3")
  _("CHA L_Q1_1C_A4")
  _("CHA L_Q1_1C_A5")
  _("CHA L_Q1_1C_A6")
  _("CHA L_Q1_1C_A7")
  _("CHA L_Q1_1C_A8")
  _("CHA L_Q1_1C_A9")
  _("CHA L_Q1_1C_A10")
  _("CHA L_Q1_1C_A11")
  _("CHA L_Q1_1C_A12")
  _("CHA L_Q1_1D_A1")
  _("CHA L_Q1_1D_A2")
  _("CHA L_Q1_1D_A3")
  _("CHA L_Q1_1D_A4")
  _("CHA L_Q1_1D_A5")
  _("CHA L_Q1_1D_A6")
  _("CHA L_Q1_1D_A7")
  _("CHA L_Q1_1D_A8")
  _("CHA L_Q1_1D_A9")
  _("CHA L_Q1_1D_A10")
  _("CHA L_Q1_1D_A11")
  _("CHA L_Q1_1D_A12")
  _("CHA L_Q1_1D_A13")
  _("CHA L_Q1_1E_A1")
  _("CHA L_Q1_1E_A2")
  _("CHA L_Q1_1E_A3")
  _("CHA L_Q1_1E_A4")
  _("CHA L_Q1_1E_A5")
  _("CHA L_Q1_1E_A6")
  _("CHA L_Q1_1E_A7")
  _("CHA L_Q1_1E_A8")
  _("CHA L_Q1_1E_A9")
  _("CHA L_Q1_1E_A10")
  _("CHA L_Q1_1E_A11")
  _("CHA L_Q1_1E_A12")
  _("CHA L_Q1_1E_A13")
  _("CHA L_Q1_1E_A14")
  _("CHA L_Q1_1E_A15")
  _("CHA L_Q1_1E_A16")
  _("CHA L_Q1_1E_A17")
  _("CHA L_Q1_1E_A18")
  _("CHA L_Q1_1E_A19")
  _("CHA L_Q1_1E_A20")
  _("CHA L_Q1_1E_A21")
  _("CHA L_Q1_1F_A1")
  _("CHA L_Q1_1F_A2")
  _("CHA L_Q1_1C_A1")
  _("CHA L_Q1_1C_A2")
  _("CHA L_Q1_1C_A3")
  _("CHA L_Q1_1C_A4")
  _("CHA L_Q1_1C_A5")
  _("CHA L_Q1_1C_A6")
  _("CHA L_Q1_1C_A7")
  _("CHA L_Q1_1C_A8")
  _("CHA L_Q1_1C_A9")
  _("CHA L_Q1_1C_A10")
  _("CHA L_Q1_1C_A11")
  _("CHA L_Q1_1C_A12")
  _("CHA L_Q1_1D_A1")
  _("CHA L_Q1_1D_A2")
  _("CHA L_Q1_1D_A3")
  _("CHA L_Q1_1D_A4")
  _("CHA L_Q1_1D_A5")
  _("CHA L_Q1_1D_A6")
  _("CHA L_Q1_1D_A7")
  _("CHA L_Q1_1D_A8")
  _("CHA L_Q1_1D_A9")
  _("CHA L_Q1_1D_A10")
  _("CHA L_Q1_1D_A11")
  _("CHA L_Q1_1D_A12")
  _("CHA L_Q1_1D_A13")
  _("CHA L_Q1_1E_A1")
  _("CHA L_Q1_1E_A2")
  _("CHA L_Q1_1E_A3")
  _("CHA L_Q1_1E_A4")
  _("CHA L_Q1_1E_A5")
  _("CHA L_Q1_1E_A6")
  _("CHA L_Q1_1E_A7")
  _("CHA L_Q1_1E_A8")
  _("CHA L_Q1_1E_A9")
  _("CHA L_Q1_1E_A10")
  _("CHA L_Q1_1E_A11")
  _("CHA L_Q1_1E_A12")
  _("CHA L_Q1_1E_A13")
  _("CHA L_Q1_1E_A14")
  _("CHA L_Q1_1E_A15")
  _("CHA L_Q1_1E_A16")
  _("CHA L_Q1_1E_A17")
  _("CHA L_Q1_1E_A18")
  _("CHA L_Q1_1E_A19")
  _("CHA L_Q1_1E_A20")
  _("CHA L_Q1_1E_A21")
  _("CHA L_Q1_1F_A1")
  _("CHA L_Q1_1F_A2")
  _("CHA L_Q1_1C_A1")
  _("CHA L_Q1_1C_A2")
  _("CHA L_Q1_1C_A3")
  _("CHA L_Q1_1C_A4")
  _("CHA L_Q1_1C_A5")
  _("CHA L_Q1_1C_A6")
  _("CHA L_Q1_1C_A7")
  _("CHA L_Q1_1C_A8")
  _("CHA L_Q1_1C_A9")
  _("CHA L_Q1_1C_A10")
  _("CHA L_Q1_1C_A11")
  _("CHA L_Q1_1C_A12")
  _("CHA L_Q1_1D_A1")
  _("CHA L_Q1_1D_A2")
  _("CHA L_Q1_1D_A3")
  _("CHA L_Q1_1D_A4")
  _("CHA L_Q1_1D_A5")
  _("CHA L_Q1_1D_A6")
  _("CHA L_Q1_1D_A7")
  _("CHA L_Q1_1D_A8")
  _("CHA L_Q1_1D_A9")
  _("CHA L_Q1_1D_A10")
  _("CHA L_Q1_1D_A11")
  _("CHA L_Q1_1D_A12")
  _("CHA L_Q1_1D_A13")
  _("CHA L_Q1_1E_A1")
  _("CHA L_Q1_1E_A2")
  _("CHA L_Q1_1E_A3")
  _("CHA L_Q1_1E_A4")
  _("CHA L_Q1_1E_A5")
  _("CHA L_Q1_1E_A6")
  _("CHA L_Q1_1E_A7")
  _("CHA L_Q1_1E_A8")
  _("CHA L_Q1_1E_A9")
  _("CHA L_Q1_1E_A10")
  _("CHA L_Q1_1E_A11")
  _("CHA L_Q1_1E_A12")
  _("CHA L_Q1_1E_A13")
  _("CHA L_Q1_1E_A14")
  _("CHA L_Q1_1E_A15")
  _("CHA L_Q1_1E_A16")
  _("CHA L_Q1_1E_A17")
  _("CHA L_Q1_1E_A18")
  _("CHA L_Q1_1E_A19")
  _("CHA L_Q1_1E_A20")
  _("CHA L_Q1_1E_A21")
  _("CHA L_Q1_1F_A1")
  _("CHA L_Q1_1F_A2")
  _("CHA L_Q2_A1")
  _("CHA L_Q2_A2")
  _("CHA M_Q1A_A1")
  _("CHA M_Q1A_A2")
  _("CHA M_Q1A_A1")
  _("CHA M_Q1A_A2")
  _("CHA M_Q1A_A1")
  _("CHA M_Q1A_A2")
  _("CHA M_Q1A_A1")
  _("CHA M_Q1A_A2")
  _("CHA M_Q1A_A1")
  _("CHA M_Q1A_A2")
  _("CHA M_Q1A_A1")
  _("CHA M_Q1A_A2")
  _("CHA M_Q1A_A1")
  _("CHA M_Q1A_A2")
  _("CHA M_Q1A_A1")
  _("CHA M_Q1A_A2")
  _("CHA N_Q1_A1")
  _("CHA N_Q1_A2")
  _("CHA O_Q1_A1")
  _("CHA O_Q1_A2")
  _("CHA P_Q2_A1")
  _("CHA P_Q2_A2")
  _("CHA P_Q2_A3")
  _("CHA P_Q2_A4")
  _("CHA P_Q2_A5")
  _("CHA P_Q2_A6")
  _("CHA P_Q2_A7")
  _("CHA P_Q2_A8")
  _("CHA P_Q2_A9")
  _("CHA P_Q2_A10")
  _("CHA P_Q2_A11")
  _("CHA P_Q2_A12")
  _("CHA P_Q2_A13")
  _("CHA P_Q2_A14")
  _("CHA P_Q2_A15")

end