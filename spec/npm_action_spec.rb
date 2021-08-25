describe Fastlane::Actions::NpmAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The npm plugin is working!")

      Fastlane::Actions::NpmAction.run(nil)
    end
  end
end
