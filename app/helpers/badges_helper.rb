module BadgesHelper
  def available_badge_rules
    {
      first_attempt: {
        description: I18n.t("activerecord.badge.first_attempt")
      },
      all_tests_in_category: {
        description: I18n.t("activerecord.badge.all_tests_in_category"),
        options: Category.pluck(:title, :id)
      },
      all_tests_of_level: {
        description: I18n.t("activerecord.badge.all_tests_of_level"),
        options: (1..5).to_a
      }
    }.with_indifferent_access
  end

  def badge_rule_description(badge)
    return badge.rule unless badge.rule.present?

    rule_parts = badge.rule.split(":")
    rule_name = rule_parts[0]
    param = rule_parts[1]

    rule_data = available_badge_rules[rule_name]
    return badge.rule unless rule_data

    base_description = rule_data[:description]

    case rule_name
    when "all_tests_in_category"
      category = Category.find_by(id: param)
      category ? "#{base_description} '#{category.title}'" : base_description
    when "all_tests_of_level"
      "#{base_description} #{param}"
    else
      base_description
    end
  end
end
