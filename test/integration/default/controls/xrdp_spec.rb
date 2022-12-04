control 'xrdp' do
  describe package('xrdp') do
    it { should be_installed }
  end

  describe package('xfce4') do
    it { should be_installed }
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
