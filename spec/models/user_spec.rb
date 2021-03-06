require 'rails_helper'

describe User, type: :model do
  it 'should be of class User' do
    expect(subject.class).to eq User
  end

  describe 'Database table' do
    it { should have_db_column :id }
    it { should have_db_column :full_name }
    it { should have_db_column :initials }
    it { should have_db_column :email }
    it { should have_db_column :encrypted_password }
    it { should have_db_column :reset_password_token }
    it { should have_db_column :reset_password_sent_at }
    it { should have_db_column :sign_in_count }
    it { should have_db_column :current_sign_in_at }
    it { should have_db_column :last_sign_in_at }
    it { should have_db_column :current_sign_in_ip }
    it { should have_db_column :last_sign_in_ip }
    it { should have_db_column :created_at }
    it { should have_db_column :updated_at }
    it { should have_db_column :avatar_file_name }
    it { should have_db_column :avatar_content_type }
    it { should have_db_column :avatar_file_size }
    it { should have_db_column :avatar_updated_at }
    it { should have_db_column :confirmation_token }
    it { should have_db_column :confirmed_at }
    it { should have_db_column :confirmation_sent_at }
    it { should have_db_column :unconfirmed_email }
    it { should have_db_column :time_zone }
    it { should have_db_column :invitation_token }
    it { should have_db_column :invitation_created_at }
    it { should have_db_column :invitation_sent_at }
    it { should have_db_column :invitation_accepted_at }
    it { should have_db_column :invitation_limit }
    it { should have_db_column :invited_by_id }
    it { should have_db_column :invited_by_type }
    it { should have_db_column :invitations_count }
    it { should have_db_column :tutorial_status }
    it { should have_db_column :assignments_notification }
    it { should have_db_column :recent_notification }
    it { should have_db_column :assignments_notification_email }
    it { should have_db_column :recent_notification_email }
    it { should have_db_column :current_team_id }
    it { should have_db_column :system_message_notification_email }
    it { should have_db_column :authentication_token }
  end

  describe 'Relations' do
    it { should have_many :user_teams }
    it { should have_many :teams }
    it { should have_many :user_projects }
    it { should have_many :projects }
    it { should have_many :user_my_modules }
    it { should have_many :comments }
    it { should have_many :activities }
    it { should have_many :results }
    it { should have_many :samples }
    it { should have_many :samples_tables }
    it { should have_many :repositories }
    it { should have_many :repository_table_states }
    it { should have_many :steps }
    it { should have_many :custom_fields }
    it { should have_many :reports }
    it { should have_many :created_assets }
    it { should have_many :modified_assets }
    it { should have_many :created_checklists }
    it { should have_many :modified_checklists }
    it { should have_many :created_checklist_items }
    it { should have_many :modified_checklist_items }
    it { should have_many :modified_comments }
    it { should have_many :modified_custom_fields }
    it { should have_many :created_my_module_groups }
    it { should have_many :created_my_module_tags }
    it { should have_many :created_my_modules }
    it { should have_many :modified_my_modules }
    it { should have_many :archived_my_modules }
    it { should have_many :restored_my_modules }
    it { should have_many :created_teams }
    it { should have_many :modified_teams }
    it { should have_many :created_projects }
    it { should have_many :modified_projects }
    it { should have_many :archived_projects }
    it { should have_many :restored_projects }
    it { should have_many :modified_reports }
    it { should have_many :modified_results }
    it { should have_many :archived_results }
    it { should have_many :restored_results }
    it { should have_many :created_sample_groups }
    it { should have_many :modified_sample_groups }
    it { should have_many :assigned_sample_my_modules }
    it { should have_many :created_sample_types }
    it { should have_many :modified_sample_types }
    it { should have_many :modified_samples }
    it { should have_many :modified_steps }
    it { should have_many :created_tables }
    it { should have_many :modified_tables }
    it { should have_many :created_tags }
    it { should have_many :tokens }
    it { should have_many :modified_tags }
    it { should have_many :assigned_user_my_modules }
    it { should have_many :assigned_user_teams }
    it { should have_many :assigned_user_projects }
    it { should have_many :added_protocols }
    it { should have_many :archived_protocols }
    it { should have_many :restored_protocols }
    it { should have_many :assigned_my_module_repository_rows }
    it { should have_many :user_notifications }
    it { should have_many :notifications }
    it { should have_many :zip_exports }
  end

  describe 'Should be a valid object' do
    it { should validate_presence_of :full_name }
    it { should validate_presence_of :initials  }
    it { should validate_presence_of :email }
    it { should validate_presence_of :time_zone }

    it do
      should validate_length_of(:full_name).is_at_most(
        Constants::NAME_MAX_LENGTH
      )
    end

    it do
      should validate_length_of(:initials).is_at_most(
        Constants::USER_INITIALS_MAX_LENGTH
      )
    end

    it do
      should validate_length_of(:email).is_at_most(
        Constants::EMAIL_MAX_LENGTH
      )
    end
  end

  describe 'Should return a user name' do
    let(:user) { build :user, full_name: 'Tinker' }

    it 'should return a user full name' do
      expect(user.name).to eq 'Tinker'
    end

    it 'should to be able to change full name' do
      user.name = 'Axe'
      expect(user.name).to_not eq 'Tinker'
      expect(user.name).to eq 'Axe'
    end
  end
end
