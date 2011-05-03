# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

########### Users ##################
session = User.create do |u|
  u.name = "SuperAdmin"
  u.email = 'superadmin@sarkcsc.in'
  u.password = u.password_confirmation = 'admin123'
  u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Admin"
  u.email = 'admin@sarkcsc.in'
  u.password = u.password_confirmation = 'admin123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Chapra Manager"
  u.email = 'chapra@sarkcsc.in'
  u.password = u.password_confirmation = 'chapra123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Siwan Manager"
  u.email = 'siwan@sarkcsc.in'
  u.password = u.password_confirmation = 'siwan123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Gopalgunj Manager"
  u.email = 'gopalgunj@sarkcsc.in'
  u.password = u.password_confirmation = 'gopalgunj123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Saharsa Manager"
  u.email = 'saharsa@sarkcsc.in'
  u.password = u.password_confirmation = 'saharsa123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Madhepura Manager"
  u.email = 'madhepura@sarkcsc.in'
  u.password = u.password_confirmation = 'madhepura123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Supaul Manager"
  u.email = 'supaul@sarkcsc.in'
  u.password = u.password_confirmation = 'supaul123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Chapra Engineer"
  u.email = 'chapraeng@sarkcsc.in'
  u.password = u.password_confirmation = 'chapra123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Siwan Engineer"
  u.email = 'siwaneng@sarkcsc.in'
  u.password = u.password_confirmation = 'siwan123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Gopalgunj Engineer"
  u.email = 'gopalgunjeng@sarkcsc.in'
  u.password = u.password_confirmation = 'gopalgunj123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Saharsa Engineer"
  u.email = 'saharsaeng@sarkcsc.in'
  u.password = u.password_confirmation = 'saharsa123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Madhepura Engineer"
  u.email = 'madhepuraeng@sarkcsc.in'
  u.password = u.password_confirmation = 'madhepura123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save
session = User.create do |u|
  u.name = "Supaul Engineer"
  u.email = 'supauleng@sarkcsc.in'
  u.password = u.password_confirmation = 'supaul123'
   u.status = 'Approved'
  u.created_by = 1
end
session.save

########## Roles

Role.create(:name=>'super_admin',:created_at=>Time.now,:updated_at=>Time.now)
Role.create(:name=>'admin',:created_at=>Time.now,:updated_at=>Time.now)
Role.create(:name=>'vle_representative',:created_at=>Time.now,:updated_at=>Time.now)
Role.create(:name=>'dmanager',:created_at=>Time.now,:updated_at=>Time.now)
Role.create(:name=>'denigneer',:created_at=>Time.now,:updated_at=>Time.now)
########## Assigmments ###############
Assignment.create(:user_id=>1,:role_id=>1,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>2,:role_id=>2,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>3,:role_id=>4,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>4,:role_id=>4,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>5,:role_id=>4,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>6,:role_id=>4,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>7,:role_id=>4,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>8,:role_id=>4,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>9,:role_id=>5,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>10,:role_id=>5,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>11,:role_id=>5,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>12,:role_id=>5,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>13,:role_id=>5,:created_at=>Time.now,:updated_at=>Time.now)
Assignment.create(:user_id=>14,:role_id=>5,:created_at=>Time.now,:updated_at=>Time.now)

###############States
State.create(:name=>'Bihar',:description=>'desc',:created_by=>1,:updated_by=>1)
#####################BiddingZones############
BiddingZone.create(:name=>'Saran',:state_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
BiddingZone.create(:name=>'Kosi',:state_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
#############################Districts
District.create(:name=>'Chhapra',:state_id=>1,:bidding_zone_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
District.create(:name=>'Gopalganj',:state_id=>1,:bidding_zone_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
District.create(:name=>'Sharsha',:state_id=>1,:bidding_zone_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
District.create(:name=>'Madhepura',:state_id=>1,:bidding_zone_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
District.create(:name=>'Supaul',:state_id=>1,:bidding_zone_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
District.create(:name=>'Siwan',:state_id=>1,:bidding_zone_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
############################CSC Blocks #############
CscBlock.create(:name=>'Ekma',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Baniapur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Deulganj',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Manyahi',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Garkha',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sadar Chhapra',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Marhowrah',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Jalalpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sadar',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sonpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Amnour',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Chhapra Sadar',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Iehuapur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sonepur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Taraiyan',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Daripur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Dariyapur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Panapyur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Baniyapur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Madhoura',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Parsa',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Isuapur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Panapur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Manjhi',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Mashrak',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Panpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Revilganj',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Dighwara',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sonepur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Lahlahadpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Nagra',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'danapur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'masrakh',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Eksar',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Lahladpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'jaitpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Saran',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Maker',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'sadar chapra',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Manzi',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Semari',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Lakri NaViganj',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Masharkh',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Issuapur',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Bhorey',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Barouli',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Gopalganj',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kuchaikot',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Uchkagaon',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Bhose',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Bhore',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Vijaypur',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Piprahia',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kahya',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kateya',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Uchakagawan',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Panchdewari',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Hathua',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Uchakagawan',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Phulwaria',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kuchaikote',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kuchaikot',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kucharwt',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Jagirdari',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kuchikot',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'panchdeori',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Thawe',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Fulwaria',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sidhawalia',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Uch ka gaon',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Barauli',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Manjha',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Bijai pur',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Panchewri',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Baikunthpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Manjha Gardh',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Panch deori',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Manjhgadh',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'majha garh',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Manjhagadh',:state_id=>1,:bidding_zone_id=>1,:district_id=>2,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Nawhata',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Simari Bakhtiyarpur',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Satar Kateya',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Etahri',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Patarchat',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sonbarsha Raj',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kahra',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sourbazar',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Banam Earahri',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Salkhua',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sonbarsha',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Patarghat',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Nawhta',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Mahishi',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Salkha',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Banama Etahri',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Pattar Ghat',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sonbasha',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Ekarh',:state_id=>1,:bidding_zone_id=>2,:district_id=>3,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Madhepura',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Shankarpur',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Ghailadh',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Gamharia',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Gwalpara',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Behari Ganj',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Puraini Bazar',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Uda Kishunganj',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Uda Kishunganj',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Rajnigoath',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Murliganj',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Singheshwar',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Alamnagar',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kumarkhand',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Chousa',:state_id=>1,:bidding_zone_id=>2,:district_id=>4,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Supaul ',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Basantpur',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Pipra Bazar',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Triveniganj',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Kishanpur',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Saraygadh Bhapriyari',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Aundouli',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Raghopur',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Chhatapur',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Pratapganj',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Pipra',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Nirmali',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Marowja',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Chattapur',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Supoul',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Balbhadrapur',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Vasantpur',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Triveniganj',:state_id=>1,:bidding_zone_id=>2,:district_id=>5,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Hussianganj',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Andar',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Pachrukhi',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Mairwa',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Darounda',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Raghunath pur',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Aander',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Goreya kothi',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Daraouli',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'siswan',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Hasanpura',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Darauli',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Barhariya',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Siwan Sadar',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Barharia',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Maharajganj',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Gutani',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Mairua',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sisawan',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Darawda',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Mairwa (Zeradei)',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Bhagwanpur Hat',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Goriakhothi',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Bhagwanpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Sarshaiya',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Durandha',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Lakrinabiganj',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Ziradai',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Ander( Ziradei)y',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Shilapatti',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
CscBlock.create(:name=>'Basantpur',:state_id=>1,:bidding_zone_id=>1,:district_id=>6,:description=>'desc',:created_by=>1,:updated_by=>1)
=begin
###################VLE Representatives#####################
VleRepresentative.create(:name=>'rep1',:state_id=>1,:bidding_zone_id=>1,:district_id=>1,:csc_block_id=>1,:father_name=>'fat1',:address=>'add1',:pincode=>50504,:phone_number=>43343332,:date_of_birth=>Date.today,:csc_panchayat=>'csc1',:block_id=>1,:status=>false,:created_by=>1,:updated_by=>1)
VleRepresentative.create(:name=>'rep2',:state_id=>2,:bidding_zone_id=>2,:district_id=>2,:csc_block_id=>2,:father_name=>'fat2',:address=>'add2',:pincode=>50501,:phone_number=>4232343332,:date_of_birth=>Date.today,:csc_panchayat=>'csc2',:block_id=>1,:status=>false,:created_by=>1,:updated_by=>1)
VleRepresentative.create(:name=>'rep3',:state_id=>3,:bidding_zone_id=>3,:district_id=>3,:csc_block_id=>3,:father_name=>'fat3',:address=>'add3',:pincode=>505232,:phone_number=>4334356562,:date_of_birth=>Date.today,:csc_panchayat=>'csc3',:block_id=>1,:status=>false,:created_by=>1,:updated_by=>1)
VleRepresentative.create(:name=>'rep4',:state_id=>4,:bidding_zone_id=>4,:district_id=>4,:csc_block_id=>4,:father_name=>'fat4',:address=>'add4',:pincode=>5050323,:phone_number=>4333423332,:date_of_birth=>Date.today,:csc_panchayat=>'csc4',:block_id=>1,:status=>false,:created_by=>1,:updated_by=>1)
VleRepresentative.create(:name=>'rep5',:state_id=>5,:bidding_zone_id=>5,:district_id=>5,:csc_block_id=>5,:father_name=>'fat5',:address=>'add5',:pincode=>505013,:phone_number=>43343322,:date_of_birth=>Date.today,:csc_panchayat=>'csc5',:block_id=>1,:status=>false,:created_by=>1,:updated_by=>1)
VleRepresentative.create(:name=>'rep6',:state_id=>6,:bidding_zone_id=>6,:district_id=>6,:csc_block_id=>5,:father_name=>'fat6',:address=>'add5',:pincode=>5050421,:phone_number=>43343311,:date_of_birth=>Date.today,:csc_panchayat=>'csc6',:block_id=>1,:status=>false,:created_by=>1,:updated_by=>1)
=end
=begin
################ =>VLE Documents ####################
VleDocument.create(:vle_representative_id=>1,:agreement_paper=>'agree1',:address_proof=>true,:education_proof=>true,:photograph_proof=>true,:dd_number=>'1201',:dd_date=>Date.today,:dd_bank_name=>'bank1',:dd_branch_name=>'branch1',:dd_amount=>20000,:created_by=>1,:updated_by=>1)
VleDocument.create(:vle_representative_id=>2,:agreement_paper=>'agree2',:address_proof=>false,:education_proof=>false,:photograph_proof=>false,:dd_number=>'1202',:dd_date=>Date.today,:dd_bank_name=>'bank2',:dd_branch_name=>'branch2',:dd_amount=>30000,:created_by=>1,:updated_by=>1)
VleDocument.create(:vle_representative_id=>3,:agreement_paper=>'agree3',:address_proof=>true,:education_proof=>true,:photograph_proof=>true,:dd_number=>'1203',:dd_date=>Date.today,:dd_bank_name=>'bank3',:dd_branch_name=>'branch3',:dd_amount=>40000,:created_by=>1,:updated_by=>1)
VleDocument.create(:vle_representative_id=>4,:agreement_paper=>'agree4',:address_proof=>false,:education_proof=>false,:photograph_proof=>false,:dd_number=>'1204',:dd_date=>Date.today,:dd_bank_name=>'bank4',:dd_branch_name=>'branch4',:dd_amount=>50000,:created_by=>1,:updated_by=>1)
VleDocument.create(:vle_representative_id=>5,:agreement_paper=>'agree5',:address_proof=>true,:education_proof=>true,:photograph_proof=>true,:dd_number=>'1205',:dd_date=>Date.today,:dd_bank_name=>'bank5',:dd_branch_name=>'branch5',:dd_amount=>60000,:created_by=>1,:updated_by=>1)
VleDocument.create(:vle_representative_id=>6,:agreement_paper=>'agree6',:address_proof=>false,:education_proof=>false,:photograph_proof=>false,:dd_number=>'1206',:dd_date=>Date.today,:dd_bank_name=>'bank6',:dd_branch_name=>'branch6',:dd_amount=>70000,:created_by=>1,:updated_by=>1)
=end
############################ => Account Types ###################
AccountType.create(:name=>'Savings Account',:created_by=>1,:updated_by=>1)
AccountType.create(:name=>'Current Account',:created_by=>1,:updated_by=>1)
AccountType.create(:name=>'TDR',:created_by=>1,:updated_by=>1)
AccountType.create(:name=>'FD',:created_by=>1,:updated_by=>1)
######################## => Premia ################
Premium.create(:name=>'Monthly',:created_by=>1,:updated_by=>1)
Premium.create(:name=>'Quarterly',:created_by=>1,:updated_by=>1)
Premium.create(:name=>'Half Yeraly',:created_by=>1,:updated_by=>1)
Premium.create(:name=>'Yearly',:created_by=>1,:updated_by=>1)
Premium.create(:name=>'Single',:created_by=>1,:updated_by=>1)
######### Bankings ###################

