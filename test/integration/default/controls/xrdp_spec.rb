control 'xrdp' do
  describe package('xrdp') do
    it { should be_installed }
  end

  describe package('xfce4') do
    it { should be_installed }
  end

  describe package('xfce4-goodies') do
    it { should be_installed }
  end

  describe file('/home/bleed/.xsession') do
    its('content') { should match 'startxfce4' }
  end

  describe file('/home/bleed/.config/obs-studio/basic/scenes/STR_Fest.json') do
    its('link_path') { should eq '/home/bleed/.config/obs-studio/basic/scenes/STR_Fest.json' }
  end

  describe systemd_service('xrdp') do
    it { should be_enabled }
  end

  describe user('bleed') do
    it { should exist }
    its('home') { should eq '/home/bleed' }
    its('group') { should eq 'sudo' }
  end
end
