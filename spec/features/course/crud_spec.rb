feature 'Course CRUD' do
  let (:course) { FactoryGirl.create(:course) }

  scenario 'create' do
    visit new_course_path
    within('#new_course') do
      fill_in 'course_name', with: Faker::Commerce.department(1)
      fill_in 'course_description', with: 'Description'
      select Course.enumerations[:status].translations.sample, from: 'course_status'
    end
    submit_form # Clicks the commit button regardless of id or text
    expect(page).to have_content I18n.t('flash.actions.create.notice', resource_name: I18n.t('activerecord.models.course.one'))
  end

  scenario 'read' do
    visit course_path(course)

    expect(page).to have_content course.name
    expect(page).to have_content course.description
    expect(page).to have_content course.status_humanize
  end

  scenario 'update' do
    visit edit_course_path(course)

    within('.edit_course') do
      fill_in 'course_name', with: Faker::Commerce.department(1)
      fill_in 'course_description', with: 'New description'
      select Course.enumerations[:status].translations.sample, from: 'course_status'
    end

    submit_form # Clicks the commit button regardless of id or text
    expect(page).to have_content I18n.t('flash.actions.update.notice', resource_name: I18n.t('activerecord.models.course.one'))
    expect(page).to have_content 'New description'
  end
end