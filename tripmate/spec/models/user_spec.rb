require 'rails_helper'
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'name' do
      describe 'presence' do
        context "when it is blank" do
          let!(:blank_name_user) { FactoryGirl.build(:user, name: "") }

          it "is invalid" do
            expect(blank_name_user).to be_invalid
            expect(blank_name_user.errors[:name]).to be_present
          end
        end
      end
    end

    describe 'email' do
      describe 'uniqueness' do
        context 'when it is already taken' do
          let!(:user) { FactoryGirl.create(:user) }
          let!(:duplicated_address_user) do
            FactoryGirl.build(:user,
            email: user.email
            )
          end
          let!(:duplicated_upcase_address_user) do
            FactoryGirl.build(:user,
            email: user.email.upcase
            )
          end

          it 'is invalid' do
            expect(duplicated_address_user).to be_invalid
            expect(duplicated_address_user.errors[:email]).to be_present
            expect(duplicated_upcase_address_user).to be_invalid
            expect(duplicated_upcase_address_user.errors[:email]).to be_present
          end
        end
      end

      describe 'presence' do
        context 'when it is blank' do
          let!(:blank_email_user) { FactoryGirl.build(:user, email: "") }

          it 'is invalid' do
            expect(blank_email_user).to be_invalid
            expect(blank_email_user.errors[:email]).to be_present
          end
        end
      end

      describe 'format' do
        context 'when it does not follow email format' do
          let!(:invalid_address_user) { FactoryGirl.create(:user)}
          let(:addresses) { %w[user@foo,com user_at_foo.org example.user@foo.
                               foo@bar_baz.com foo@bar+baz.com foo@bar..com] }
          it 'is invalid' do
            addresses.each do |invalid_address|
              invalid_address_user.email = invalid_address
              expect(invalid_address_user).to be_invalid
              expect(invalid_address_user.errors[:email]).to be_present
            end
          end
        end
      end
    end

    describe 'password' do
      describe 'presence' do
        context 'when it is blank' do
          let!(:blank_password_user) { FactoryGirl.build(:user, password: "") }

          it 'is invalid' do
            expect(blank_password_user).to be_invalid
            expect(blank_password_user.errors[:password]).to be_present
          end
        end
      end

      describe 'length' do
        context 'when it is less than minimum length' do
          let!(:less_than_min_length) { "a" * (User::MIN_PASSWORD_LENGTH - 1) }
          let!(:less_length_password_user) do
            FactoryGirl.build(:user,
              password: less_than_min_length,
              password_confirmation: less_than_min_length
            )
          end

          it 'is invalid' do
            expect(less_length_password_user).to be_invalid
            expect(less_length_password_user.errors[:password]).to be_present
          end
        end
      end

      describe 'consistency' do
        context 'when password is different from password_confirmation' do
          let!(:mismatching_passwords_user) do
            FactoryGirl.build(:user,
              password: "password",
              password_confirmation: "anotherpassword"
            )
          end

          it 'is invalid' do
            expect(mismatching_passwords_user).to be_invalid
            expect(mismatching_passwords_user.errors[:password_confirmation]).to be_present
          end
        end
      end
    end

    describe 'birthday' do
      describe 'presence' do
        context 'when it is blank' do
          let!(:blank_birthday_user) { FactoryGirl.build(:user, birthday: "") }

          it 'is invalid' do
            expect(blank_birthday_user).to be_invalid
            expect(blank_birthday_user.errors[:birthday]).to be_present
          end
        end
      end
    end

    describe 'sex' do
      describe 'presence' do
        context 'when it is blank' do
          let!(:blank_sex_user) { FactoryGirl.build(:user, sex: "") }

          it 'is invalid' do
            expect(blank_sex_user).to be_invalid
            expect(blank_sex_user.errors[:sex]).to be_present
          end
        end
      end
    end

    describe 'nationality' do
      describe 'presence' do
        context 'when it is blank' do
          let!(:blank_nationality_user) { FactoryGirl.build(:user, nationality: "") }

          it 'is invalid' do
            expect(blank_nationality_user).to be_invalid
            expect(blank_nationality_user.errors[:nationality]).to be_present
          end
        end
      end
    end
  end
end
