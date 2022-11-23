control 'obs' do
	describe apt('https://ppa.launchpadcontent.net/obsproject/obs-studio/ubuntu/') do
		it { should exist }
	end
	describe package('ffmpeg') do
		it { should be_installed }
	end
	describe package('obs-studio') do
		it { should be_installed }
	end
end
