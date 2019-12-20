describe Fastlane::Actions::GitterAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The gitter plugin is working!")

      Fastlane::Actions::GitterAction.run(nil)
    end
  end
end
