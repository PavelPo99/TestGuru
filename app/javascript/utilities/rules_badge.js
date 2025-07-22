function initBadgeRules() {
  const ruleTypeSelect = document.getElementById('rule_type_select');
  if (!ruleTypeSelect) return;
  
  const paramContainer = document.getElementById('rule_parameter_container');
  const paramSelect = document.getElementById('rule_parameter_select');
  const ruleField = document.getElementById('rule_field');
  
  const badgeRulesData = document.getElementById('badge-rules-data');
  const rules = JSON.parse(badgeRulesData.dataset.rules);
  const currentRule = badgeRulesData.dataset.currentRule || '';
  
  updateRuleField();
  
  ruleTypeSelect.addEventListener('change', function() {
    const ruleType = this.value;
    const ruleData = rules[ruleType];
    
    paramContainer.classList.add('d-none');
    paramSelect.innerHTML = '';
    
    if (ruleType && ruleData.options) {
      ruleData.options.forEach(option => {
        const [text, value] = Array.isArray(option) ? option : [option, option];
        const opt = document.createElement('option');
        opt.value = value;
        opt.textContent = text;
        paramSelect.appendChild(opt);
      });
      
      paramContainer.classList.remove('d-none');
    }
    
    updateRuleField();
  });
  
  paramSelect.addEventListener('change', updateRuleField);
  
  function updateRuleField() {
    const ruleType = ruleTypeSelect.value;
    const param = paramSelect.value;
    
    if (ruleType) {
      ruleField.value = param ? `${ruleType}:${param}` : ruleType;
    } else {
      ruleField.value = '';
    }
  }
  
  if (currentRule) {
    const [ruleType, param] = currentRule.split(':');
    
    if (ruleType) {
      ruleTypeSelect.value = ruleType;
      
      const event = new Event('change');
      ruleTypeSelect.dispatchEvent(event);
      
      setTimeout(() => {
        if (param && paramSelect) {
          paramSelect.value = param;
          updateRuleField();
        }
      }, 100);
    }
  }
}

document.addEventListener('DOMContentLoaded', initBadgeRules);
document.addEventListener('turbo:load', initBadgeRules);
