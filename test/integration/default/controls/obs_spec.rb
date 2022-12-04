control 'obs' do
	describe package('python3') do
		it { should be_installed }
	end
	describe apt('ppa:obsproject/obs-studio') do
		it { should exist }
	end
	describe package('ffmpeg') do
		it { should be_installed }
	end
	describe package('obs-studio') do
		it { should be_installed }
	end
end
