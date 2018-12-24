require 'spec_helper'

describe TennisScore do
  context 'a new game' do
    subject { TennisScore.new('Alice', 'Bob')}

    it 'shows the expected score' do
      expect(subject.to_s).to eq 'Love all'
    end

    describe 'after a score by Alice' do
      before{ subject.score_left }

      it 'shows 15 - love' do
        expect(subject.to_s).to eq 'Alice fifteen, Bob love'
      end
    end

    describe 'after a score by Bob' do
      before{ subject.score_right }

      it 'shows love - 15' do
        expect(subject.to_s).to eq 'Alice love, Bob fifteen'
      end
    end

    describe 'Alice scores twice' do
      before do
        2.times{ subject.score_left }
      end

      it 'shows 30 - love' do
        expect(subject.to_s).to eq 'Alice thirty, Bob love'
      end
    end

    describe 'Alice scores 3 times' do
      before do
        3.times{ subject.score_left }
      end

      it 'shows 40 - love' do
        expect(subject.to_s).to eq 'Alice forty, Bob love'
      end
    end

    describe 'Deuce' do
      before do
        3.times{ subject.score_left }
        3.times{ subject.score_right }
      end

      it 'shows deuce' do
        expect(subject.to_s).to eq 'Deuce'
      end
    end

    describe 'Deuce to Advantage' do
      before do
        3.times{ subject.score_left }
        4.times{ subject.score_right }
      end

      it 'shows advantage' do
        expect(subject.to_s).to eq 'Advantage Bob'
      end
    end

    describe 'advtange back to Deuce' do
      before do
        3.times{ subject.score_left }
        4.times{ subject.score_right }
      end

      it 'shows deuce' do
        expect(subject.to_s).to eq 'Advantage Bob'
        subject.score_left
        expect(subject.to_s).to eq 'Deuce'
      end
    end

    describe 'Advantage to Game' do
      before do
        3.times{ subject.score_left }
        5.times{ subject.score_right }
      end

      it 'shows the winner' do
        expect(subject.to_s).to eq 'Game Bob'
      end
    end

    describe 'An ended game' do
      before do
        3.times{ subject.score_left }
        5.times{ subject.score_right }
      end

      it 'prohibits further scoring' do
        10.times{ subject.score_left }
        expect(subject.to_s).to eq 'Game Bob'
      end
    end
  end
end
