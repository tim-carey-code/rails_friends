require 'rails_helper'

describe RailsFriends::Friendship, type: :model do
  let(:user) { User.create(name: 'Jessie') }
  let(:friend) { User.create(name: 'Heisenberg') }

  describe 'associations' do
    it { should belong_to(:friendable) }
    it { should belong_to(:friend).with_foreign_key(:friend_id) } # Why can't I use '.class_name('Friendable')'?
  end

  describe 'class methods' do
    describe '.exist?' do
      it 'should be provided' do
        expect(RailsFriends::Friendship).to respond_to(:exist?)
      end

      context 'when a friendship exists between user and friend' do
        it 'returns true' do
          create_friendship(user, friend)
          expect(RailsFriends::Friendship.exist?(user, friend)).to be true
        end
      end

      context 'when a friendship does not exists' do
        it 'returns false' do
          expect(RailsFriends::Friendship.exist?(user, friend)).to be false
        end
      end
    end

    describe '.find_unblocked_friendship' do
      it 'should be provided' do
        expect(RailsFriends::Friendship).to respond_to(:find_unblocked_friendship)
      end

      it 'should find friendship' do
        create_request(user, friend)
        friendship = RailsFriends::Friendship.find_by(friendable_id: user.id,
                                                      friendable_type: user.class.base_class.name, friend_id: friend.id)

        expect(RailsFriends::Friendship.find_unblocked_friendship(user, friend)).to eq friendship
      end
    end

    describe '.find_blocked_friendship' do
      it 'should find a blocked friendship' do
        create_friendship(user, friend, status: 'blocked', blocker_id: user.id)
        friendship = find_friendship_record(user, friend)

        expect(RailsFriends::Friendship.find_blocked_friendship(user, friend)).to eq friendship
      end
    end

    describe '.find_one_side' do
      it 'finds a friendship record' do
        create_request(user, friend)
        friendship = find_friendship_record(user, friend)
        expect(RailsFriends::Friendship.find_one_side(user, friend)).to eq friendship
      end
    end
  end
end
