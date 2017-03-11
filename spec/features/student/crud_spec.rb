feature 'Student CRUD' do
  let (:student) { FactoryGirl.create(:student) }

  scenario 'create' do
    visit new_student_path
    within('#new_student') do
      fill_in 'student_name', with: Faker::Name.name
      fill_in 'student_register_number', with: Faker::Number.number(12)
      select Student.enumerations[:status].translations.sample, from: 'student_status'
    end
    submit_form # Clicks the commit button regardless of id or text
    expect(page).to have_content I18n.t('flash.actions.create.notice', resource_name: I18n.t('activerecord.models.student.one'))
  end

  scenario 'read' do
    visit student_path(student)

    expect(page).to have_content student.name
    expect(page).to have_content student.register_number
    expect(page).to have_content student.status_humanize
  end

  scenario 'update' do
    visit edit_student_path(student)

    within('.edit_student') do
      fill_in 'student_name', with: Faker::Name.name
      fill_in 'student_register_number', with: '01/30921'
      select Student.enumerations[:status].translations.sample, from: 'student_status'
    end

    submit_form # Clicks the commit button regardless of id or text
    expect(page).to have_content I18n.t('flash.actions.update.notice', resource_name: I18n.t('activerecord.models.student.one'))
    expect(page).to have_content '01/30921'
  end
end