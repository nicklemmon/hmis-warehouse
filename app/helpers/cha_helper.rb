###
# Copyright 2016 - 2019 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module ChaHelper
  def cha_section_is_blank?(answers)
    answers.values.map do |question_answer|
      answer = question_answer['answer']
      answer.is_a?(Array) ? answer.reject(&:blank?) : answer
    end.select do |answer|
      if answer.is_a?(Array)
        !answer.compact.all?(&:blank?)
      else
        !answer.blank?
      end
    end.blank?
  end

  def cha_select(form_field, field)
    form_field.input(
      field,
      label: _("CHA #{field.upcase}"),
      collection: cha_options[field],
      selected: form_field.object.answer(field),
      include_blank: true,
    )
  end

  def cha_radios(form_field, field)
    capture do
      concat content_tag(:h4, header_for(field))
      concat content_tag(:p, subheader_for(field), class: 'cha__help-text')
      concat form_field.input(
        field,
        label: _("CHA #{field.upcase}"),
        as: :radio_buttons,
        collection: cha_options[field],
        checked: form_field.object.answer(field),
        hint: hint_for(field),
      )
    end
  end

  def cha_checkboxes(form_field, field)
    capture do
      concat content_tag(:strong, header_for(field))
      concat content_tag(:p, subheader_for(field), class: 'cha__help-text')
      concat form_field.input(
        field,
        label: _("CHA #{field.upcase}"),
        as: :check_boxes,
        collection: cha_options[field],
        checked: form_field.object.answer(field),
      )
    end
  end

  def cha_datepicker(form_field, field, input_html_options = {})
    form_field.input(
      field,
      label: _("CHA #{field.upcase}"),
      as: :date_picker,
      input_html: input_html_options[:input_html] || { value: form_field.object.answer(field) },
    )
  end

  def cha_string(form_field, field, input_html_options = {})
    capture do
      if (header = header_for(field))
        concat content_tag(:strong, header)
      end
      if (subheader = subheader_for(field))
        concat content_tag(:p, raw(subheader), class: 'cha__help-text')
      end
      concat form_field.input(
        field,
        label: _("CHA #{field.upcase}"),
        input_html: input_html_options[:input_html] || { value: form_field.object.answer(field) },
      )
    end
  end

  def cha_text(form_field, field)
    form_field.input(
      field,
      label: _("CHA #{field.upcase}"),
      as: :text,
      input_html: { value: form_field.object.answer(field) },
    )
  end

  def header_for(field)
    key = "CHA #{field.upcase}_HEADER"
    header = _(key)
    header.blank? || header == key ? nil : header
  end

  def subheader_for(field)
    key = "CHA #{field.upcase}_SUBHEADER"
    subheader = _(key)
    subheader.blank? || subheader == key ? nil : subheader
  end

  def hint_for(field)
    key = "CHA #{field.upcase}_HINT"
    footer = _(key)
    footer.blank? || footer == key ? nil : footer
  end

  def cha_options
    Health::ComprehensiveHealthAssessment::QUESTION_ANSWER_OPTIONS
  end

  # For gettext to find and create translation keys
  #
  _('CHA A_Q1')
  _('CHA A_Q2')
  _('CHA A_Q3')
  _('CHA A_Q4')
  _('CHA A_Q5A')
  _('CHA A_Q5B')
  _('CHA A_Q5C')
  _('CHA A_Q6')
  _('CHA A_Q7')
  _('CHA A_Q8')
  _('CHA A_Q9')
  _('CHA A_Q10')
  _('CHA A_Q11')
  _('CHA A_Q12')
  _('CHA B_Q1')
  _('CHA B_Q2')
  _('CHA B_Q3')
  _('CHA B_Q4')
  _('CHA C_Q1_SUBHEADER')
  _('CHA C_Q1')
  _('CHA C_Q2')
  _('CHA C_Q3')
  _('CHA D_Q1_HEADER')
  _('CHA D_Q1')
  _('CHA D_Q2_HEADER')
  _('CHA D_Q2')
  _('CHA D_Q3_HEADER')
  _('CHA D_Q3')
  _('CHA D_Q4_HEADER')
  _('CHA D_Q4')
  _('CHA E_Q1A_HEADER')
  _('CHA E_Q1A_SUBHEADER')
  _('CHA E_Q1A')
  _('CHA E_Q1B')
  _('CHA E_Q1C')
  _('CHA E_Q1D')
  _('CHA E_Q1E')
  _('CHA E_Q1F')
  _('CHA E_Q1G')
  _('CHA E_Q1H')
  _('CHA E_Q1I')
  _('CHA E_Q2A_HEADER')
  _('CHA E_Q2A')
  _('CHA E_Q2B')
  _('CHA E_Q2C')
  _('CHA F_Q1A')
  _('CHA F_Q1A_HEADER')
  _('CHA F_Q1A_SUBHEADER')
  _('CHA F_Q1B')
  _('CHA F_Q1C')
  _('CHA F_Q1D')
  _('CHA F_Q1E')
  _('CHA F_Q1F')
  _('CHA F_Q2')
  _('CHA F_Q2_HEADER')
  _('CHA F_Q3_HEADER')
  _('CHA F_Q3_SUBHEADER')
  _('CHA F_Q3')
  _('CHA F_Q4')
  _('CHA F_Q5')
  _('CHA G_Q1A_HEADER')
  _('CHA G_Q1B_HEADER')
  _('CHA G_Q1C_HEADER')
  _('CHA G_Q1D_HEADER')
  _('CHA G_Q1E_HEADER')
  _('CHA G_Q1F_HEADER')
  _('CHA G_Q1G_HEADER')
  _('CHA G_Q1H_HEADER')
  _('CHA G_Q1AP')
  _('CHA G_Q1BP')
  _('CHA G_Q1CP')
  _('CHA G_Q1DP')
  _('CHA G_Q1EP')
  _('CHA G_Q1FP')
  _('CHA G_Q1GP')
  _('CHA G_Q1HP')
  _('CHA G_Q1AC')
  _('CHA G_Q1BC')
  _('CHA G_Q1CC')
  _('CHA G_Q1DC')
  _('CHA G_Q1EC')
  _('CHA G_Q1FC')
  _('CHA G_Q1GC')
  _('CHA G_Q1HC')
  _('CHA G_Q2A')
  _('CHA G_Q2B')
  _('CHA G_Q2C')
  _('CHA G_Q2D')
  _('CHA G_Q2E')
  _('CHA G_Q2F')
  _('CHA G_Q3')
  _('CHA G_Q4A_HEADER')
  _('CHA G_Q4A')
  _('CHA G_Q4B')
  _('CHA G_Q5_HEADER')
  _('CHA G_Q5')
  _('CHA G_Q6A_HEADER')
  _('CHA G_Q6A')
  _('CHA G_Q6B')
  _('CHA H_Q1')
  _('CHA I_Q1A_SUBHEADER')
  _('CHA I_Q1C_SUBHEADER')
  _('CHA I_Q1F_SUBHEADER')
  _('CHA I_Q1I_SUBHEADER')
  _('CHA I_Q1M_SUBHEADER')
  _('CHA I_Q1A_HEADER')
  _('CHA I_Q1A_SUBHEADER')
  _('CHA I_Q1A')
  _('CHA I_Q1B')
  _('CHA I_Q1C')
  _('CHA I_Q1D')
  _('CHA I_Q1E')
  _('CHA I_Q1F')
  _('CHA I_Q1G')
  _('CHA I_Q1H')
  _('CHA I_Q1I')
  _('CHA I_Q1J')
  _('CHA I_Q1K')
  _('CHA I_Q1L')
  _('CHA I_Q1M')
  _('CHA I_Q1N')

  _('CHA I_Q2A1')
  _('CHA I_Q2B1')
  _('CHA I_Q2C1')
  _('CHA I_Q2D1')
  _('CHA I_Q2E1')
  _('CHA I_Q2F1')
  _('CHA I_Q2G1')
  _('CHA I_Q2H1')
  _('CHA I_Q2I1')
  _('CHA I_Q2J1')
  _('CHA I_Q2K1')
  _('CHA I_Q2L1')
  _('CHA I_Q2M1')
  _('CHA I_Q2N1')
  _('CHA I_Q2O1')
  _('CHA I_Q2P1')
  _('CHA I_Q2Q1')
  _('CHA I_Q2R1')
  _('CHA I_Q2S1')
  _('CHA I_Q2T1')
  _('CHA I_Q2U1')
  _('CHA I_Q2V1')
  _('CHA I_Q2W1')
  _('CHA I_Q2X1')
  _('CHA I_Q2Y1')
  _('CHA I_Q2Z1')

  _('CHA I_Q2A2')
  _('CHA I_Q2B2')
  _('CHA I_Q2C2')
  _('CHA I_Q2D2')
  _('CHA I_Q2E2')
  _('CHA I_Q2F2')
  _('CHA I_Q2G2')
  _('CHA I_Q2H2')
  _('CHA I_Q2I2')
  _('CHA I_Q2J2')
  _('CHA I_Q2K2')
  _('CHA I_Q2L2')
  _('CHA I_Q2M2')
  _('CHA I_Q2N2')
  _('CHA I_Q2O2')
  _('CHA I_Q2P2')
  _('CHA I_Q2Q2')
  _('CHA I_Q2R2')
  _('CHA I_Q2S2')
  _('CHA I_Q2T2')
  _('CHA I_Q2U2')
  _('CHA I_Q2V2')
  _('CHA I_Q2W2')
  _('CHA I_Q2X2')
  _('CHA I_Q2Y2')
  _('CHA I_Q2Z2')

  _('CHA I_Q2A3')
  _('CHA I_Q2B3')
  _('CHA I_Q2C3')
  _('CHA I_Q2D3')
  _('CHA I_Q2E3')
  _('CHA I_Q2F3')
  _('CHA I_Q2G3')
  _('CHA I_Q2H3')
  _('CHA I_Q2I3')
  _('CHA I_Q2J3')
  _('CHA I_Q2K3')
  _('CHA I_Q2L3')
  _('CHA I_Q2M3')
  _('CHA I_Q2N3')
  _('CHA I_Q2O3')
  _('CHA I_Q2P3')
  _('CHA I_Q2Q3')
  _('CHA I_Q2R3')
  _('CHA I_Q2S3')
  _('CHA I_Q2T3')
  _('CHA I_Q2U3')
  _('CHA I_Q2V3')
  _('CHA I_Q2W3')
  _('CHA I_Q2X3')
  _('CHA I_Q2Y3')
  _('CHA I_Q2Z3')

  _('CHA J_Q1')
  _('CHA J_Q2')
  _('CHA J_Q3A')
  _('CHA J_Q3B')
  _('CHA J_Q3C')
  _('CHA J_Q3D')
  _('CHA J_Q3E')
  _('CHA J_Q3F')
  _('CHA J_Q3G')
  _('CHA J_Q3H')
  _('CHA J_Q3I')
  _('CHA J_Q3J')
  _('CHA J_Q3K')
  _('CHA J_Q3L')
  _('CHA J_Q4')
  _('CHA J_Q5')
  _('CHA J_Q6A_HEADER')
  _('CHA J_Q6A_SUBHEADER')
  _('CHA J_Q6A')
  _('CHA J_Q6B')
  _('CHA J_Q6C')
  _('CHA J_Q6D')
  _('CHA J_Q6E')
  _('CHA J_Q7A_HEADER')
  _('CHA J_Q7A')
  _('CHA J_Q7B')
  _('CHA J_Q8_HEADER')
  _('CHA J_Q8')
  _('CHA J_Q9A_HEADER')
  _('CHA J_Q9A')
  _('CHA J_Q9B')
  _('CHA K_Q1A_HEADER')
  _('CHA K_Q1A')
  _('CHA K_Q1B')
  _('CHA K_Q1C')
  _('CHA K_Q1D')
  _('CHA L_Q1S1A_HEADER')
  _('CHA L_Q1S1A_SUBHEADER')

  _('CHA L_Q1S1A')
  _('CHA L_Q1S1B')
  _('CHA L_Q1S1C')
  _('CHA L_Q1S1D')
  _('CHA L_Q1S1E')
  _('CHA L_Q1S1F')
  _('CHA L_Q1S1G')
  _('CHA L_Q1S2A')
  _('CHA L_Q1S2B')
  _('CHA L_Q1S2C')
  _('CHA L_Q1S2D')
  _('CHA L_Q1S2E')
  _('CHA L_Q1S2F')
  _('CHA L_Q1S2G')
  _('CHA L_Q1S3A')
  _('CHA L_Q1S3B')
  _('CHA L_Q1S3C')
  _('CHA L_Q1S3D')
  _('CHA L_Q1S3E')
  _('CHA L_Q1S3F')
  _('CHA L_Q1S3G')
  _('CHA L_Q1S4A')
  _('CHA L_Q1S4B')
  _('CHA L_Q1S4C')
  _('CHA L_Q1S4D')
  _('CHA L_Q1S4E')
  _('CHA L_Q1S4F')
  _('CHA L_Q1S4G')
  _('CHA L_Q1S5A')
  _('CHA L_Q1S5B')
  _('CHA L_Q1S5C')
  _('CHA L_Q1S5D')
  _('CHA L_Q1S5E')
  _('CHA L_Q1S5F')
  _('CHA L_Q1S5G')
  _('CHA L_Q1S6A')
  _('CHA L_Q1S6B')
  _('CHA L_Q1S6C')
  _('CHA L_Q1S6D')
  _('CHA L_Q1S6E')
  _('CHA L_Q1S6F')
  _('CHA L_Q1S6G')
  _('CHA L_Q1S7A')
  _('CHA L_Q1S7B')
  _('CHA L_Q1S7C')
  _('CHA L_Q1S7D')
  _('CHA L_Q1S7E')
  _('CHA L_Q1S7F')
  _('CHA L_Q1S7G')
  _('CHA L_Q1S8A')
  _('CHA L_Q1S8B')
  _('CHA L_Q1S8C')
  _('CHA L_Q1S8D')
  _('CHA L_Q1S8E')
  _('CHA L_Q1S8F')
  _('CHA L_Q1S8G')
  _('CHA L_Q1S9A')
  _('CHA L_Q1S9B')
  _('CHA L_Q1S9C')
  _('CHA L_Q1S9D')
  _('CHA L_Q1S9E')
  _('CHA L_Q1S9F')
  _('CHA L_Q1S9G')
  _('CHA L_Q1S10A')
  _('CHA L_Q1S10B')
  _('CHA L_Q1S10C')
  _('CHA L_Q1S10D')
  _('CHA L_Q1S10E')
  _('CHA L_Q1S10F')
  _('CHA L_Q1S10G')
  _('CHA L_Q1S11A')
  _('CHA L_Q1S11B')
  _('CHA L_Q1S11C')
  _('CHA L_Q1S11D')
  _('CHA L_Q1S11E')
  _('CHA L_Q1S11F')
  _('CHA L_Q1S11G')
  _('CHA L_Q1S12A')
  _('CHA L_Q1S12B')
  _('CHA L_Q1S12C')
  _('CHA L_Q1S12D')
  _('CHA L_Q1S12E')
  _('CHA L_Q1S12F')
  _('CHA L_Q1S12G')
  _('CHA L_Q1S13A')
  _('CHA L_Q1S13B')
  _('CHA L_Q1S13C')
  _('CHA L_Q1S13D')
  _('CHA L_Q1S13E')
  _('CHA L_Q1S13F')
  _('CHA L_Q1S13G')
  _('CHA L_Q1S14A')
  _('CHA L_Q1S14B')
  _('CHA L_Q1S14C')
  _('CHA L_Q1S14D')
  _('CHA L_Q1S14E')
  _('CHA L_Q1S14F')
  _('CHA L_Q1S14G')
  _('CHA L_Q1S15A')
  _('CHA L_Q1S15B')
  _('CHA L_Q1S15C')
  _('CHA L_Q1S15D')
  _('CHA L_Q1S15E')
  _('CHA L_Q1S15F')
  _('CHA L_Q1S15G')
  _('CHA L_Q1S16A')
  _('CHA L_Q1S16B')
  _('CHA L_Q1S16C')
  _('CHA L_Q1S16D')
  _('CHA L_Q1S16E')
  _('CHA L_Q1S16F')
  _('CHA L_Q1S16G')
  _('CHA L_Q1S17A')
  _('CHA L_Q1S17B')
  _('CHA L_Q1S17C')
  _('CHA L_Q1S17D')
  _('CHA L_Q1S17E')
  _('CHA L_Q1S17F')
  _('CHA L_Q1S17G')
  _('CHA L_Q1S18A')
  _('CHA L_Q1S18B')
  _('CHA L_Q1S18C')
  _('CHA L_Q1S18D')
  _('CHA L_Q1S18E')
  _('CHA L_Q1S18F')
  _('CHA L_Q1S18G')
  _('CHA L_Q1S19A')
  _('CHA L_Q1S19B')
  _('CHA L_Q1S19C')
  _('CHA L_Q1S19D')
  _('CHA L_Q1S19E')
  _('CHA L_Q1S19F')
  _('CHA L_Q1S19G')
  _('CHA L_Q1S20A')
  _('CHA L_Q1S20B')
  _('CHA L_Q1S20C')
  _('CHA L_Q1S20D')
  _('CHA L_Q1S20E')
  _('CHA L_Q1S20F')
  _('CHA L_Q1S20G')
  _('CHA L_Q1S21A')
  _('CHA L_Q1S21B')
  _('CHA L_Q1S21C')
  _('CHA L_Q1S21D')
  _('CHA L_Q1S21E')
  _('CHA L_Q1S21F')
  _('CHA L_Q1S21G')
  _('CHA L_Q1S22A')
  _('CHA L_Q1S22B')
  _('CHA L_Q1S22C')
  _('CHA L_Q1S22D')
  _('CHA L_Q1S22E')
  _('CHA L_Q1S22F')
  _('CHA L_Q1S22G')
  _('CHA L_Q1S23A')
  _('CHA L_Q1S23B')
  _('CHA L_Q1S23C')
  _('CHA L_Q1S23D')
  _('CHA L_Q1S23E')
  _('CHA L_Q1S23F')
  _('CHA L_Q1S23G')
  _('CHA L_Q1S24A')
  _('CHA L_Q1S24B')
  _('CHA L_Q1S24C')
  _('CHA L_Q1S24D')
  _('CHA L_Q1S24E')
  _('CHA L_Q1S24F')
  _('CHA L_Q1S24G')
  _('CHA L_Q1S25A')
  _('CHA L_Q1S25B')
  _('CHA L_Q1S25C')
  _('CHA L_Q1S25D')
  _('CHA L_Q1S25E')
  _('CHA L_Q1S25F')
  _('CHA L_Q1S25G')
  _('CHA L_Q1S26A')
  _('CHA L_Q1S26B')
  _('CHA L_Q1S26C')
  _('CHA L_Q1S26D')
  _('CHA L_Q1S26E')
  _('CHA L_Q1S26F')
  _('CHA L_Q1S26G')
  _('CHA L_Q1S27A')
  _('CHA L_Q1S27B')
  _('CHA L_Q1S27C')
  _('CHA L_Q1S27D')
  _('CHA L_Q1S27E')
  _('CHA L_Q1S27F')
  _('CHA L_Q1S27G')
  _('CHA L_Q1S28A')
  _('CHA L_Q1S28B')
  _('CHA L_Q1S28C')
  _('CHA L_Q1S28D')
  _('CHA L_Q1S28E')
  _('CHA L_Q1S28F')
  _('CHA L_Q1S28G')
  _('CHA L_Q1S29A')
  _('CHA L_Q1S29B')
  _('CHA L_Q1S29C')
  _('CHA L_Q1S29D')
  _('CHA L_Q1S29E')
  _('CHA L_Q1S29F')
  _('CHA L_Q1S29G')
  _('CHA L_Q1S30A')
  _('CHA L_Q1S30B')
  _('CHA L_Q1S30C')
  _('CHA L_Q1S30D')
  _('CHA L_Q1S30E')
  _('CHA L_Q1S30F')
  _('CHA L_Q1S30G')
  _('CHA L_Q1S31A')
  _('CHA L_Q1S31B')
  _('CHA L_Q1S31C')
  _('CHA L_Q1S31D')
  _('CHA L_Q1S31E')
  _('CHA L_Q1S31F')
  _('CHA L_Q1S31G')
  _('CHA L_Q1S32A')
  _('CHA L_Q1S32B')
  _('CHA L_Q1S32C')
  _('CHA L_Q1S32D')
  _('CHA L_Q1S32E')
  _('CHA L_Q1S32F')
  _('CHA L_Q1S32G')
  _('CHA L_Q1S33A')
  _('CHA L_Q1S33B')
  _('CHA L_Q1S33C')
  _('CHA L_Q1S33D')
  _('CHA L_Q1S33E')
  _('CHA L_Q1S33F')
  _('CHA L_Q1S33G')
  _('CHA L_Q1S34A')
  _('CHA L_Q1S34B')
  _('CHA L_Q1S34C')
  _('CHA L_Q1S34D')
  _('CHA L_Q1S34E')
  _('CHA L_Q1S34F')
  _('CHA L_Q1S34G')
  _('CHA L_Q1S35A')
  _('CHA L_Q1S35B')
  _('CHA L_Q1S35C')
  _('CHA L_Q1S35D')
  _('CHA L_Q1S35E')
  _('CHA L_Q1S35F')
  _('CHA L_Q1S35G')
  _('CHA L_Q1S36A')
  _('CHA L_Q1S36B')
  _('CHA L_Q1S36C')
  _('CHA L_Q1S36D')
  _('CHA L_Q1S36E')
  _('CHA L_Q1S36F')
  _('CHA L_Q1S36G')
  _('CHA L_Q1S37A')
  _('CHA L_Q1S37B')
  _('CHA L_Q1S37C')
  _('CHA L_Q1S37D')
  _('CHA L_Q1S37E')
  _('CHA L_Q1S37F')
  _('CHA L_Q1S37G')
  _('CHA L_Q1S38A')
  _('CHA L_Q1S38B')
  _('CHA L_Q1S38C')
  _('CHA L_Q1S38D')
  _('CHA L_Q1S38E')
  _('CHA L_Q1S38F')
  _('CHA L_Q1S38G')
  _('CHA L_Q1S39A')
  _('CHA L_Q1S39B')
  _('CHA L_Q1S39C')
  _('CHA L_Q1S39D')
  _('CHA L_Q1S39E')
  _('CHA L_Q1S39F')
  _('CHA L_Q1S39G')
  _('CHA L_Q1S40A')
  _('CHA L_Q1S40B')
  _('CHA L_Q1S40C')
  _('CHA L_Q1S40D')
  _('CHA L_Q1S40E')
  _('CHA L_Q1S40F')
  _('CHA L_Q1S40G')
  _('CHA L_Q1S41A')
  _('CHA L_Q1S41B')
  _('CHA L_Q1S41C')
  _('CHA L_Q1S41D')
  _('CHA L_Q1S41E')
  _('CHA L_Q1S41F')
  _('CHA L_Q1S41G')
  _('CHA L_Q1S42A')
  _('CHA L_Q1S42B')
  _('CHA L_Q1S42C')
  _('CHA L_Q1S42D')
  _('CHA L_Q1S42E')
  _('CHA L_Q1S42F')
  _('CHA L_Q1S42G')
  _('CHA L_Q1S43A')
  _('CHA L_Q1S43B')
  _('CHA L_Q1S43C')
  _('CHA L_Q1S43D')
  _('CHA L_Q1S43E')
  _('CHA L_Q1S43F')
  _('CHA L_Q1S43G')
  _('CHA L_Q1S44A')
  _('CHA L_Q1S44B')
  _('CHA L_Q1S44C')
  _('CHA L_Q1S44D')
  _('CHA L_Q1S44E')
  _('CHA L_Q1S44F')
  _('CHA L_Q1S44G')
  _('CHA L_Q1S45A')
  _('CHA L_Q1S45B')
  _('CHA L_Q1S45C')
  _('CHA L_Q1S45D')
  _('CHA L_Q1S45E')
  _('CHA L_Q1S45F')
  _('CHA L_Q1S45G')
  _('CHA L_Q1S46A')
  _('CHA L_Q1S46B')
  _('CHA L_Q1S46C')
  _('CHA L_Q1S46D')
  _('CHA L_Q1S46E')
  _('CHA L_Q1S46F')
  _('CHA L_Q1S46G')
  _('CHA L_Q1S47A')
  _('CHA L_Q1S47B')
  _('CHA L_Q1S47C')
  _('CHA L_Q1S47D')
  _('CHA L_Q1S47E')
  _('CHA L_Q1S47F')
  _('CHA L_Q1S47G')
  _('CHA L_Q1S48A')
  _('CHA L_Q1S48B')
  _('CHA L_Q1S48C')
  _('CHA L_Q1S48D')
  _('CHA L_Q1S48E')
  _('CHA L_Q1S48F')
  _('CHA L_Q1S48G')
  _('CHA L_Q1S49A')
  _('CHA L_Q1S49B')
  _('CHA L_Q1S49C')
  _('CHA L_Q1S49D')
  _('CHA L_Q1S49E')
  _('CHA L_Q1S49F')
  _('CHA L_Q1S49G')
  _('CHA L_Q1S50A')
  _('CHA L_Q1S50B')
  _('CHA L_Q1S50C')
  _('CHA L_Q1S50D')
  _('CHA L_Q1S50E')
  _('CHA L_Q1S50F')
  _('CHA L_Q1S50G')

  _('CHA L_Q2')
  _('CHA M_Q1A')
  _('CHA M_Q1B')
  _('CHA M_Q1C')
  _('CHA M_Q1D')
  _('CHA M_Q1E')
  _('CHA M_Q1F')
  _('CHA M_Q1G')
  _('CHA M_Q1H')
  _('CHA M_Q1A_HEADER')
  _('CHA M_Q1A')
  _('CHA M_Q1B')
  _('CHA M_Q1C')
  _('CHA M_Q2A_HEADER')
  _('CHA M_Q2A_SUBHEADER')
  _('CHA M_Q2A')
  _('CHA M_Q2B')
  _('CHA M_Q2C')
  _('CHA N_Q1')
  _('CHA O_Q1_HEADER')
  _('CHA O_Q1')
  _('CHA P_Q1')
  _('CHA P_Q2')
  _('CHA Q_Q1')
  _('CHA Q_Q2')
  _('CHA R_Q1')
  _('CHA R_Q1A')
  _('CHA R_Q1B')
  _('CHA R_Q1C')
  _('CHA R_Q1D')
  _('CHA R_Q2')
  _('CHA R_Q3')
  _('CHA R_Q4')
  _('CHA R_Q5')
  _('CHA R_Q6A_HEADER')
  _('CHA R_Q6A')
  _('CHA R_Q6B')
  _('CHA R_Q6C')
  _('CHA R_Q6D')
  _('CHA R_Q6E')
  _('CHA R_Q7')
  _('CHA R_Q7_HINT')
  _('CHA R_Q8_HEADER')
  _('CHA R_Q8')

  _('CHA R_Q9A')
  _('CHA R_Q9B')
  _('CHA R_Q9C')
  _('CHA R_Q9D')

  _('CHA R_Q10A')
  _('CHA R_Q10B')
  _('CHA R_Q10C')
  _('CHA R_Q10D')

  _('CHA R_Q11A')
  _('CHA R_Q11B')
  _('CHA R_Q11C')
  _('CHA R_Q11D')

  _('CHA R_Q12A')
  _('CHA R_Q12B')
  _('CHA R_Q12C')
  _('CHA R_Q12D')

  _('CHA R_Q13A')
  _('CHA R_Q13B')
  _('CHA R_Q13C')
  _('CHA R_Q13D')

  _('CHA R_Q14A')
  _('CHA R_Q14B')
  _('CHA R_Q14C')
  _('CHA R_Q14D')

  _('CHA R_Q15A')
  _('CHA R_Q15B')
  _('CHA R_Q15C')
  _('CHA R_Q15D')

  _('CHA R_Q16A')
  _('CHA R_Q16B')
  _('CHA R_Q16C')
  _('CHA R_Q16D')

  _('CHA R_Q17A')
  _('CHA R_Q17B')
  _('CHA R_Q17C')
  _('CHA R_Q17D')

  _('CHA R_Q18A')
  _('CHA R_Q18B')
  _('CHA R_Q18C')
  _('CHA R_Q18D')

  _('CHA R_Q19A')
  _('CHA R_Q19B')
  _('CHA R_Q19C')
  _('CHA R_Q19D')

  _('CHA R_Q20A')
  _('CHA R_Q20B')
  _('CHA R_Q20C')
  _('CHA R_Q20D')

  _('CHA R_Q21A')
  _('CHA R_Q21B')
  _('CHA R_Q21C')
  _('CHA R_Q21D')

  _('CHA R_Q22A')
  _('CHA R_Q22B')
  _('CHA R_Q22C')
  _('CHA R_Q22D')

  _('CHA R_Q23A')
  _('CHA R_Q23B')
  _('CHA R_Q23C')
  _('CHA R_Q23D')

  _('CHA R_Q24A')
  _('CHA R_Q24B')
  _('CHA R_Q24C')
  _('CHA R_Q24D')

  _('CHA R_Q25A')
  _('CHA R_Q25B')
  _('CHA R_Q25C')
  _('CHA R_Q25D')

  _('CHA R_Q26A')
  _('CHA R_Q26B')
  _('CHA R_Q26C')
  _('CHA R_Q26D')

  _('CHA R_Q27A')
  _('CHA R_Q27B')
  _('CHA R_Q27C')
  _('CHA R_Q27D')

  _('CHA R_Q28A')
  _('CHA R_Q28B')
  _('CHA R_Q28C')
  _('CHA R_Q28D')

  _('CHA R_Q29A')
  _('CHA R_Q29B')
  _('CHA R_Q29C')
  _('CHA R_Q29D')

  _('CHA R_Q30A')
  _('CHA R_Q30B')
  _('CHA R_Q30C')
  _('CHA R_Q30D')

  _('CHA R_Q31A')
  _('CHA R_Q31B')
  _('CHA R_Q31C')
  _('CHA R_Q31D')

  _('CHA R_Q32A')
  _('CHA R_Q32B')
  _('CHA R_Q32C')
  _('CHA R_Q32D')

  _('CHA R_Q33A')
  _('CHA R_Q33B')
  _('CHA R_Q33C')
  _('CHA R_Q33D')

  _('CHA R_Q34A')
  _('CHA R_Q34B')
  _('CHA R_Q34C')
  _('CHA R_Q34D')

  _('CHA R_Q35A')
  _('CHA R_Q35B')
  _('CHA R_Q35C')
  _('CHA R_Q35D')

  _('CHA R_Q36A')
  _('CHA R_Q36B')
  _('CHA R_Q36C')
  _('CHA R_Q36D')

  _('CHA R_Q37A')
  _('CHA R_Q37B')
  _('CHA R_Q37C')
  _('CHA R_Q37D')

  _('CHA R_Q38A')
  _('CHA R_Q38B')
  _('CHA R_Q38C')
  _('CHA R_Q38D')

  _('CHA A_Q2_A1')
  _('CHA A_Q2_A2')
  _('CHA A_Q4_A1')
  _('CHA A_Q4_A2')
  _('CHA A_Q4_A3')
  _('CHA A_Q4_A4')
  _('CHA A_Q4_A5')
  _('CHA A_Q4_A6')
  _('CHA A_Q7_A1')
  _('CHA A_Q7_A2')
  _('CHA A_Q7_A3')
  _('CHA A_Q7_A4')
  _('CHA A_Q7_A5')
  _('CHA A_Q7_A6')
  _('CHA A_Q7_A7')
  _('CHA A_Q11_A1')
  _('CHA A_Q11_A2')
  _('CHA A_Q11_A3')
  _('CHA A_Q11_A4')
  _('CHA A_Q11_A5')
  _('CHA A_Q11_A6')
  _('CHA A_Q11_A7')
  _('CHA A_Q11_A8')
  _('CHA A_Q11_A9')
  _('CHA A_Q11_A10')
  _('CHA A_Q11_A11')
  _('CHA A_Q11_A12')
  _('CHA A_Q11_A13')
  _('CHA A_Q11_A14')
  _('CHA A_Q12_A1')
  _('CHA A_Q12_A2')
  _('CHA A_Q12_A3')
  _('CHA A_Q12_A4')
  _('CHA A_Q12_A5')
  _('CHA A_Q12_A6')
  _('CHA A_Q12_A7')
  _('CHA A_Q12_A8')
  _('CHA B_Q2_A1')
  _('CHA B_Q2_A2')
  _('CHA B_Q2_A3')
  _('CHA B_Q2_A4')
  _('CHA B_Q2_A5')
  _('CHA B_Q2_A6')
  _('CHA B_Q3_A1')
  _('CHA B_Q3_A2')
  _('CHA B_Q3_A3')
  _('CHA B_Q3_A4')
  _('CHA B_Q4_A1')
  _('CHA B_Q4_A2')
  _('CHA B_Q4_A3')
  _('CHA B_Q4_A4')
  _('CHA B_Q4_A5')
  _('CHA C_Q1_A1')
  _('CHA C_Q1_A2')
  _('CHA C_Q1_A3')
  _('CHA C_Q1_A4')
  _('CHA C_Q1_A5')
  _('CHA C_Q1_A6')
  _('CHA C_Q2_A1')
  _('CHA C_Q2_A2')
  _('CHA C_Q3_A1')
  _('CHA C_Q3_A2')
  _('CHA C_Q3_A3')
  _('CHA C_Q3_A4')
  _('CHA C_Q1_A1')
  _('CHA C_Q1_A2')
  _('CHA C_Q1_A3')
  _('CHA C_Q1_A4')
  _('CHA C_Q1_A5')
  _('CHA C_Q2_A1')
  _('CHA C_Q2_A2')
  _('CHA C_Q2_A3')
  _('CHA C_Q2_A4')
  _('CHA C_Q2_A5')
  _('CHA C_Q3_A1')
  _('CHA C_Q3_A2')
  _('CHA C_Q3_A3')
  _('CHA C_Q3_A4')
  _('CHA C_Q3_A5')
  _('CHA C_Q4_A1')
  _('CHA C_Q4_A2')
  _('CHA C_Q4_A3')
  _('CHA C_Q4_A4')
  _('CHA C_Q4_A5')
  _('CHA D_Q1_A1')
  _('CHA D_Q1_A2')
  _('CHA D_Q1_A3')
  _('CHA D_Q1_A4')
  _('CHA D_Q1_A5')
  _('CHA D_Q2_A1')
  _('CHA D_Q2_A2')
  _('CHA D_Q2_A3')
  _('CHA D_Q2_A4')
  _('CHA D_Q2_A5')
  _('CHA D_Q3_A1')
  _('CHA D_Q3_A2')
  _('CHA D_Q3_A3')
  _('CHA D_Q3_A4')
  _('CHA D_Q3_A5')
  _('CHA D_Q4_A1')
  _('CHA D_Q4_A2')
  _('CHA D_Q4_A3')
  _('CHA D_Q4_A4')
  _('CHA D_Q4_A5')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q1A_A1')
  _('CHA E_Q1A_A2')
  _('CHA E_Q1A_A3')
  _('CHA E_Q1A_A4')
  _('CHA E_Q2A_A1')
  _('CHA E_Q2A_A2')
  _('CHA E_Q2A_A3')
  _('CHA E_Q2A_A4')
  _('CHA E_Q2A_A5')
  _('CHA E_Q2A_A1')
  _('CHA E_Q2A_A2')
  _('CHA E_Q2A_A3')
  _('CHA E_Q2A_A4')
  _('CHA E_Q2A_A5')
  _('CHA E_Q2A_A1')
  _('CHA E_Q2A_A2')
  _('CHA E_Q2A_A3')
  _('CHA E_Q2A_A4')
  _('CHA E_Q2A_A5')
  _('CHA F_Q1A_A1')
  _('CHA F_Q1A_A2')
  _('CHA F_Q1A_A3')
  _('CHA F_Q1A_A4')
  _('CHA F_Q1A_A5')
  _('CHA F_Q1A_A6')
  _('CHA F_Q1A_A1')
  _('CHA F_Q1A_A2')
  _('CHA F_Q1A_A3')
  _('CHA F_Q1A_A4')
  _('CHA F_Q1A_A5')
  _('CHA F_Q1A_A6')
  _('CHA F_Q1A_A1')
  _('CHA F_Q1A_A2')
  _('CHA F_Q1A_A3')
  _('CHA F_Q1A_A4')
  _('CHA F_Q1A_A5')
  _('CHA F_Q1A_A6')
  _('CHA F_Q1A_A1')
  _('CHA F_Q1A_A2')
  _('CHA F_Q1A_A3')
  _('CHA F_Q1A_A4')
  _('CHA F_Q1A_A5')
  _('CHA F_Q1A_A6')
  _('CHA F_Q1A_A1')
  _('CHA F_Q1A_A2')
  _('CHA F_Q1A_A3')
  _('CHA F_Q1A_A4')
  _('CHA F_Q1A_A5')
  _('CHA F_Q1A_A6')
  _('CHA F_Q1A_A1')
  _('CHA F_Q1A_A2')
  _('CHA F_Q1A_A3')
  _('CHA F_Q1A_A4')
  _('CHA F_Q1A_A5')
  _('CHA F_Q1A_A6')
  _('CHA F_Q2_A1')
  _('CHA F_Q2_A2')
  _('CHA F_Q3_A1')
  _('CHA F_Q3_A2')
  _('CHA F_Q3_A3')
  _('CHA F_Q4_A1')
  _('CHA F_Q4_A2')
  _('CHA F_Q4_A3')
  _('CHA F_Q4_A4')
  _('CHA F_Q5_A1')
  _('CHA F_Q5_A2')
  _('CHA G_Q1AP_A1')
  _('CHA G_Q1AP_A2')
  _('CHA G_Q1AP_A3')
  _('CHA G_Q1AP_A4')
  _('CHA G_Q1AP_A5')
  _('CHA G_Q1AP_A6')
  _('CHA G_Q1AP_A7')
  _('CHA G_Q1AP_A8')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A8')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A8')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A8')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A8')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A8')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A8')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q1A_A1')
  _('CHA G_Q1A_A2')
  _('CHA G_Q1A_A3')
  _('CHA G_Q1A_A4')
  _('CHA G_Q1A_A5')
  _('CHA G_Q1A_A6')
  _('CHA G_Q1A_A7')
  _('CHA G_Q2A_A1')
  _('CHA G_Q2A_A2')
  _('CHA G_Q2A_A3')
  _('CHA G_Q2A_A4')
  _('CHA G_Q2A_A5')
  _('CHA G_Q2A_A6')
  _('CHA G_Q2A_A7')
  _('CHA G_Q2A_A8')
  _('CHA G_Q2A_A1')
  _('CHA G_Q2A_A2')
  _('CHA G_Q2A_A3')
  _('CHA G_Q2A_A4')
  _('CHA G_Q2A_A5')
  _('CHA G_Q2A_A6')
  _('CHA G_Q2A_A7')
  _('CHA G_Q2A_A8')
  _('CHA G_Q2A_A1')
  _('CHA G_Q2A_A2')
  _('CHA G_Q2A_A3')
  _('CHA G_Q2A_A4')
  _('CHA G_Q2A_A5')
  _('CHA G_Q2A_A6')
  _('CHA G_Q2A_A7')
  _('CHA G_Q2A_A8')
  _('CHA G_Q2A_A1')
  _('CHA G_Q2A_A2')
  _('CHA G_Q2A_A3')
  _('CHA G_Q2A_A4')
  _('CHA G_Q2A_A5')
  _('CHA G_Q2A_A6')
  _('CHA G_Q2A_A7')
  _('CHA G_Q2A_A8')
  _('CHA G_Q2A_A1')
  _('CHA G_Q2A_A2')
  _('CHA G_Q2A_A3')
  _('CHA G_Q2A_A4')
  _('CHA G_Q2A_A5')
  _('CHA G_Q2A_A6')
  _('CHA G_Q2A_A7')
  _('CHA G_Q2A_A8')
  _('CHA G_Q2A_A1')
  _('CHA G_Q2A_A2')
  _('CHA G_Q2A_A3')
  _('CHA G_Q2A_A4')
  _('CHA G_Q2A_A5')
  _('CHA G_Q2A_A6')
  _('CHA G_Q2A_A7')
  _('CHA G_Q2A_A8')
  _('CHA G_Q3_A1')
  _('CHA G_Q3_A2')
  _('CHA G_Q3_A3')
  _('CHA G_Q3_A4')
  _('CHA G_Q4A_A1')
  _('CHA G_Q4A_A2')
  _('CHA G_Q4A_A3')
  _('CHA G_Q4A_A4')
  _('CHA G_Q4A_A5')
  _('CHA G_Q4B_A1')
  _('CHA G_Q4B_A2')
  _('CHA G_Q4B_A3')
  _('CHA G_Q4B_A4')
  _('CHA G_Q5_A1')
  _('CHA G_Q5_A2')
  _('CHA G_Q5_A3')
  _('CHA G_Q5_A4')
  _('CHA G_Q6A_A1')
  _('CHA G_Q6A_A2')
  _('CHA G_Q6B_A1')
  _('CHA G_Q6B_A2')
  _('CHA H_Q1_A1')
  _('CHA H_Q1_A2')
  _('CHA H_Q1_A3')
  _('CHA H_Q1_A4')
  _('CHA H_Q1_A5')
  _('CHA H_Q1_A6')
  _('CHA H_Q1_A7')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA I_Q1A_A1')
  _('CHA I_Q1A_A2')
  _('CHA I_Q1A_A3')
  _('CHA I_Q1A_A4')
  _('CHA J_Q1_A1')
  _('CHA J_Q1_A2')
  _('CHA J_Q1_A3')
  _('CHA J_Q1_A4')
  _('CHA J_Q2_A1')
  _('CHA J_Q2_A2')
  _('CHA J_Q2_A3')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q3A_A1')
  _('CHA J_Q3A_A2')
  _('CHA J_Q3A_A3')
  _('CHA J_Q3A_A4')
  _('CHA J_Q3A_A5')
  _('CHA J_Q4_A1')
  _('CHA J_Q4_A2')
  _('CHA J_Q4_A3')
  _('CHA J_Q4_A4')
  _('CHA J_Q5_A1')
  _('CHA J_Q5_A2')
  _('CHA J_Q5_A3')
  _('CHA J_Q5_A4')
  _('CHA J_Q5_A5')
  _('CHA J_Q6A_A1')
  _('CHA J_Q6A_A2')
  _('CHA J_Q6A_A3')
  _('CHA J_Q6A_A4')
  _('CHA J_Q6B_A1')
  _('CHA J_Q6B_A2')
  _('CHA J_Q6B_A3')
  _('CHA J_Q6B_A4')
  _('CHA J_Q6B_A5')
  _('CHA J_Q6C_A1')
  _('CHA J_Q6C_A2')
  _('CHA J_Q6C_A3')
  _('CHA J_Q6C_A4')
  _('CHA J_Q6D_A1')
  _('CHA J_Q6D_A2')
  _('CHA J_Q6E_A1')
  _('CHA J_Q6E_A2')
  _('CHA J_Q6E_A3')
  _('CHA J_Q6E_A4')
  _('CHA J_Q6E_A5')
  _('CHA J_Q6E_A6')
  _('CHA J_Q7A_A1')
  _('CHA J_Q7A_A2')
  _('CHA J_Q7A_A1')
  _('CHA J_Q7A_A2')
  _('CHA J_Q8_A1')
  _('CHA J_Q8_A2')
  _('CHA J_Q8_A3')
  _('CHA J_Q8_A4')
  _('CHA J_Q8_A5')
  _('CHA J_Q9A_A1')
  _('CHA J_Q9A_A2')
  _('CHA J_Q9A_A3')
  _('CHA J_Q9B_A1')
  _('CHA J_Q9B_A2')
  _('CHA J_Q9B_A3')
  _('CHA J_Q9B_A4')
  _('CHA K_Q1A_A1')
  _('CHA K_Q1A_A2')
  _('CHA J_Q7A_A1')
  _('CHA J_Q7A_A2')
  _('CHA J_Q7A_A1')
  _('CHA J_Q7A_A2')
  _('CHA J_Q7A_A1')
  _('CHA J_Q7A_A2')
  _('CHA L_Q1_1C_A1')
  _('CHA L_Q1_1C_A2')
  _('CHA L_Q1_1C_A3')
  _('CHA L_Q1_1C_A4')
  _('CHA L_Q1_1C_A5')
  _('CHA L_Q1_1C_A6')
  _('CHA L_Q1_1C_A7')
  _('CHA L_Q1_1C_A8')
  _('CHA L_Q1_1C_A9')
  _('CHA L_Q1_1C_A10')
  _('CHA L_Q1_1C_A11')
  _('CHA L_Q1_1C_A12')
  _('CHA L_Q1_1D_A1')
  _('CHA L_Q1_1D_A2')
  _('CHA L_Q1_1D_A3')
  _('CHA L_Q1_1D_A4')
  _('CHA L_Q1_1D_A5')
  _('CHA L_Q1_1D_A6')
  _('CHA L_Q1_1D_A7')
  _('CHA L_Q1_1D_A8')
  _('CHA L_Q1_1D_A9')
  _('CHA L_Q1_1D_A10')
  _('CHA L_Q1_1D_A11')
  _('CHA L_Q1_1D_A12')
  _('CHA L_Q1_1D_A13')
  _('CHA L_Q1_1E_A1')
  _('CHA L_Q1_1E_A2')
  _('CHA L_Q1_1E_A3')
  _('CHA L_Q1_1E_A4')
  _('CHA L_Q1_1E_A5')
  _('CHA L_Q1_1E_A6')
  _('CHA L_Q1_1E_A7')
  _('CHA L_Q1_1E_A8')
  _('CHA L_Q1_1E_A9')
  _('CHA L_Q1_1E_A10')
  _('CHA L_Q1_1E_A11')
  _('CHA L_Q1_1E_A12')
  _('CHA L_Q1_1E_A13')
  _('CHA L_Q1_1E_A14')
  _('CHA L_Q1_1E_A15')
  _('CHA L_Q1_1E_A16')
  _('CHA L_Q1_1E_A17')
  _('CHA L_Q1_1E_A18')
  _('CHA L_Q1_1E_A19')
  _('CHA L_Q1_1E_A20')
  _('CHA L_Q1_1E_A21')
  _('CHA L_Q1_1F_A1')
  _('CHA L_Q1_1F_A2')
  _('CHA L_Q1_1C_A1')
  _('CHA L_Q1_1C_A2')
  _('CHA L_Q1_1C_A3')
  _('CHA L_Q1_1C_A4')
  _('CHA L_Q1_1C_A5')
  _('CHA L_Q1_1C_A6')
  _('CHA L_Q1_1C_A7')
  _('CHA L_Q1_1C_A8')
  _('CHA L_Q1_1C_A9')
  _('CHA L_Q1_1C_A10')
  _('CHA L_Q1_1C_A11')
  _('CHA L_Q1_1C_A12')
  _('CHA L_Q1_1D_A1')
  _('CHA L_Q1_1D_A2')
  _('CHA L_Q1_1D_A3')
  _('CHA L_Q1_1D_A4')
  _('CHA L_Q1_1D_A5')
  _('CHA L_Q1_1D_A6')
  _('CHA L_Q1_1D_A7')
  _('CHA L_Q1_1D_A8')
  _('CHA L_Q1_1D_A9')
  _('CHA L_Q1_1D_A10')
  _('CHA L_Q1_1D_A11')
  _('CHA L_Q1_1D_A12')
  _('CHA L_Q1_1D_A13')
  _('CHA L_Q1_1E_A1')
  _('CHA L_Q1_1E_A2')
  _('CHA L_Q1_1E_A3')
  _('CHA L_Q1_1E_A4')
  _('CHA L_Q1_1E_A5')
  _('CHA L_Q1_1E_A6')
  _('CHA L_Q1_1E_A7')
  _('CHA L_Q1_1E_A8')
  _('CHA L_Q1_1E_A9')
  _('CHA L_Q1_1E_A10')
  _('CHA L_Q1_1E_A11')
  _('CHA L_Q1_1E_A12')
  _('CHA L_Q1_1E_A13')
  _('CHA L_Q1_1E_A14')
  _('CHA L_Q1_1E_A15')
  _('CHA L_Q1_1E_A16')
  _('CHA L_Q1_1E_A17')
  _('CHA L_Q1_1E_A18')
  _('CHA L_Q1_1E_A19')
  _('CHA L_Q1_1E_A20')
  _('CHA L_Q1_1E_A21')
  _('CHA L_Q1_1F_A1')
  _('CHA L_Q1_1F_A2')
  _('CHA L_Q1_1C_A1')
  _('CHA L_Q1_1C_A2')
  _('CHA L_Q1_1C_A3')
  _('CHA L_Q1_1C_A4')
  _('CHA L_Q1_1C_A5')
  _('CHA L_Q1_1C_A6')
  _('CHA L_Q1_1C_A7')
  _('CHA L_Q1_1C_A8')
  _('CHA L_Q1_1C_A9')
  _('CHA L_Q1_1C_A10')
  _('CHA L_Q1_1C_A11')
  _('CHA L_Q1_1C_A12')
  _('CHA L_Q1_1D_A1')
  _('CHA L_Q1_1D_A2')
  _('CHA L_Q1_1D_A3')
  _('CHA L_Q1_1D_A4')
  _('CHA L_Q1_1D_A5')
  _('CHA L_Q1_1D_A6')
  _('CHA L_Q1_1D_A7')
  _('CHA L_Q1_1D_A8')
  _('CHA L_Q1_1D_A9')
  _('CHA L_Q1_1D_A10')
  _('CHA L_Q1_1D_A11')
  _('CHA L_Q1_1D_A12')
  _('CHA L_Q1_1D_A13')
  _('CHA L_Q1_1E_A1')
  _('CHA L_Q1_1E_A2')
  _('CHA L_Q1_1E_A3')
  _('CHA L_Q1_1E_A4')
  _('CHA L_Q1_1E_A5')
  _('CHA L_Q1_1E_A6')
  _('CHA L_Q1_1E_A7')
  _('CHA L_Q1_1E_A8')
  _('CHA L_Q1_1E_A9')
  _('CHA L_Q1_1E_A10')
  _('CHA L_Q1_1E_A11')
  _('CHA L_Q1_1E_A12')
  _('CHA L_Q1_1E_A13')
  _('CHA L_Q1_1E_A14')
  _('CHA L_Q1_1E_A15')
  _('CHA L_Q1_1E_A16')
  _('CHA L_Q1_1E_A17')
  _('CHA L_Q1_1E_A18')
  _('CHA L_Q1_1E_A19')
  _('CHA L_Q1_1E_A20')
  _('CHA L_Q1_1E_A21')
  _('CHA L_Q1_1F_A1')
  _('CHA L_Q1_1F_A2')
  _('CHA L_Q1_1C_A1')
  _('CHA L_Q1_1C_A2')
  _('CHA L_Q1_1C_A3')
  _('CHA L_Q1_1C_A4')
  _('CHA L_Q1_1C_A5')
  _('CHA L_Q1_1C_A6')
  _('CHA L_Q1_1C_A7')
  _('CHA L_Q1_1C_A8')
  _('CHA L_Q1_1C_A9')
  _('CHA L_Q1_1C_A10')
  _('CHA L_Q1_1C_A11')
  _('CHA L_Q1_1C_A12')
  _('CHA L_Q1_1D_A1')
  _('CHA L_Q1_1D_A2')
  _('CHA L_Q1_1D_A3')
  _('CHA L_Q1_1D_A4')
  _('CHA L_Q1_1D_A5')
  _('CHA L_Q1_1D_A6')
  _('CHA L_Q1_1D_A7')
  _('CHA L_Q1_1D_A8')
  _('CHA L_Q1_1D_A9')
  _('CHA L_Q1_1D_A10')
  _('CHA L_Q1_1D_A11')
  _('CHA L_Q1_1D_A12')
  _('CHA L_Q1_1D_A13')
  _('CHA L_Q1_1E_A1')
  _('CHA L_Q1_1E_A2')
  _('CHA L_Q1_1E_A3')
  _('CHA L_Q1_1E_A4')
  _('CHA L_Q1_1E_A5')
  _('CHA L_Q1_1E_A6')
  _('CHA L_Q1_1E_A7')
  _('CHA L_Q1_1E_A8')
  _('CHA L_Q1_1E_A9')
  _('CHA L_Q1_1E_A10')
  _('CHA L_Q1_1E_A11')
  _('CHA L_Q1_1E_A12')
  _('CHA L_Q1_1E_A13')
  _('CHA L_Q1_1E_A14')
  _('CHA L_Q1_1E_A15')
  _('CHA L_Q1_1E_A16')
  _('CHA L_Q1_1E_A17')
  _('CHA L_Q1_1E_A18')
  _('CHA L_Q1_1E_A19')
  _('CHA L_Q1_1E_A20')
  _('CHA L_Q1_1E_A21')
  _('CHA L_Q1_1F_A1')
  _('CHA L_Q1_1F_A2')
  _('CHA L_Q1_1C_A1')
  _('CHA L_Q1_1C_A2')
  _('CHA L_Q1_1C_A3')
  _('CHA L_Q1_1C_A4')
  _('CHA L_Q1_1C_A5')
  _('CHA L_Q1_1C_A6')
  _('CHA L_Q1_1C_A7')
  _('CHA L_Q1_1C_A8')
  _('CHA L_Q1_1C_A9')
  _('CHA L_Q1_1C_A10')
  _('CHA L_Q1_1C_A11')
  _('CHA L_Q1_1C_A12')
  _('CHA L_Q1_1D_A1')
  _('CHA L_Q1_1D_A2')
  _('CHA L_Q1_1D_A3')
  _('CHA L_Q1_1D_A4')
  _('CHA L_Q1_1D_A5')
  _('CHA L_Q1_1D_A6')
  _('CHA L_Q1_1D_A7')
  _('CHA L_Q1_1D_A8')
  _('CHA L_Q1_1D_A9')
  _('CHA L_Q1_1D_A10')
  _('CHA L_Q1_1D_A11')
  _('CHA L_Q1_1D_A12')
  _('CHA L_Q1_1D_A13')
  _('CHA L_Q1_1E_A1')
  _('CHA L_Q1_1E_A2')
  _('CHA L_Q1_1E_A3')
  _('CHA L_Q1_1E_A4')
  _('CHA L_Q1_1E_A5')
  _('CHA L_Q1_1E_A6')
  _('CHA L_Q1_1E_A7')
  _('CHA L_Q1_1E_A8')
  _('CHA L_Q1_1E_A9')
  _('CHA L_Q1_1E_A10')
  _('CHA L_Q1_1E_A11')
  _('CHA L_Q1_1E_A12')
  _('CHA L_Q1_1E_A13')
  _('CHA L_Q1_1E_A14')
  _('CHA L_Q1_1E_A15')
  _('CHA L_Q1_1E_A16')
  _('CHA L_Q1_1E_A17')
  _('CHA L_Q1_1E_A18')
  _('CHA L_Q1_1E_A19')
  _('CHA L_Q1_1E_A20')
  _('CHA L_Q1_1E_A21')
  _('CHA L_Q1_1F_A1')
  _('CHA L_Q1_1F_A2')
  _('CHA L_Q2_A1')
  _('CHA L_Q2_A2')
  _('CHA M_Q1A_A1')
  _('CHA M_Q1A_A2')
  _('CHA M_Q1A_A1')
  _('CHA M_Q1A_A2')
  _('CHA M_Q1A_A1')
  _('CHA M_Q1A_A2')
  _('CHA M_Q1A_A1')
  _('CHA M_Q1A_A2')
  _('CHA M_Q1A_A1')
  _('CHA M_Q1A_A2')
  _('CHA M_Q1A_A1')
  _('CHA M_Q1A_A2')
  _('CHA M_Q1A_A1')
  _('CHA M_Q1A_A2')
  _('CHA M_Q1A_A1')
  _('CHA M_Q1A_A2')
  _('CHA N_Q1_A1')
  _('CHA N_Q1_A2')
  _('CHA O_Q1_A1')
  _('CHA O_Q1_A2')
  _('CHA P_Q2_A1')
  _('CHA P_Q2_A2')
  _('CHA P_Q2_A3')
  _('CHA P_Q2_A4')
  _('CHA P_Q2_A5')
  _('CHA P_Q2_A6')
  _('CHA P_Q2_A7')
  _('CHA P_Q2_A8')
  _('CHA P_Q2_A9')
  _('CHA P_Q2_A10')
  _('CHA P_Q2_A11')
  _('CHA P_Q2_A12')
  _('CHA P_Q2_A13')
  _('CHA P_Q2_A14')
  _('CHA P_Q2_A15')

  _('CHA R_Q1_A1')
  _('CHA R_Q1_A2')
  _('CHA R_Q1_A3')
  _('CHA R_Q1_A4')
  _('CHA R_Q2_A1')
  _('CHA R_Q2_A2')
  _('CHA R_Q3_A1')
  _('CHA R_Q3_A2')
  _('CHA R_Q4_A1')
  _('CHA R_Q4_A2')
  _('CHA R_Q5_A1')
  _('CHA R_Q5_A2')
  _('CHA R_Q5_A3')
  _('CHA R_Q5_A4')
  _('CHA R_Q7_A1')
  _('CHA R_Q7_A2')
  _('CHA R_Q8_A1')
  _('CHA R_Q8_A2')
  _('CHA R_Q8_A3')
  _('CHA R_Q8_A4')
  _('CHA R_Q8_A5')
  _('CHA R_Q8_A6')
  _('CHA R_Q8_A7')
  _('CHA R_Q8_A8')
  _('CHA R_Q8_A9')
end
