require "spec_helper"

describe Lita::Handlers::Flip, lita_handler: true do

  it { routes_command('flip me Nerdbot').to(:flip) }
  it { routes_command('flip Nerdbot').to(:flip) }

  context 'with a "me"' do
    it 'flips the words' do
      send_command('flip me Nerdbot ftw')
      expect(replies.last).to eq('(╯°□°）╯︵ ʍʇɟ ʇoqpɹǝu')
    end
  end

  context 'without a "me"' do
    it 'flips the words' do
      send_command('flip Nerdbot ftw')
      expect(replies.last).to eq('(╯°□°）╯︵ ʍʇɟ ʇoqpɹǝu')
    end
  end

  context 'words that get fliped specially' do
    it 'flips the whole word' do
      send_command('flip table')
      expect(replies.last).to eq('(╯°□°）╯︵ ┻━┻')
    end
  end

end
