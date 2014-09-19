require 'spec_helper'

class TestPerson < TestModel
  validates :pasep_pis_nit, :pasep_pis_nit => true
end

class TestPersonAllowsNil < TestModel
  validates :pasep_pis_nit, :pasep_pis_nit => {:allow_blank => true}
end

class TestPersonAllowsNilFalse < TestModel
  validates :pasep_pis_nit, :pasep_pis_nit => {:allow_blank => false}
end

class TestPersonWithMessage < TestModel
  validates :pasep_pis_nit_address, :pasep_pis_nit => {:message => 'is not looking very good!'}
end

describe PasepPisNitValidator do

  describe "validation" do
    context "given the valid PASEP/PIS/NIT" do
      [
        '125.5256.164-2',
        '125.1765.831-7',
        '125.4779.406-5',
        '125.6132.272-8',
        '125.4657.521-1',
        '125.7768.118-8',
        '125.1632.712-0',
        '125.2545.275-7',
        '125.4607.879-0',
        '125.6395.441-1',
        '125.0151.564-3',
        '125.8227.898-1',
        '12561488324',
        '12588968467',
        '12547781800'
      ].each do |pasep_pis_nit|

        it "#{pasep_pis_nit.inspect} should be valid" do
          expect(TestPerson.new(:pasep_pis_nit => pasep_pis_nit).valid?).to be_truthy
        end

      end

    end

    context "given the invalid PASEP/PIS/NIT" do
      [
        "",
        "f@s",
        "f@s.c",
        "@bar",
        "test@",
        "! \#$%\`|@invalid-characters-in-local.org",
        "<>@[]\`|@125.5256.164-2",
        "125.5256.164-2\n<script>alert('hello')</script>",
        "127 2226 164 2",
        '129.9996.164-2',
        '125.3365.831-7',
        '125.4779.406-0',
        '125.6162.272-8',
        '235.4757.521-1',
        '1245.628.118-8',
        '525.5332.712-6',
        '267.4545.267-7',
        '275.4607.879-0',
        '235.6395.443-1',
        '225.0151.564-3',
        '12a.8227.898-1',
        '15.6148.8342-4',
        '18896.8416-7',
        '125477818300'
      ].each do |pasep_pis_nit|

        it "#{pasep_pis_nit.inspect} should not be valid" do
          expect(TestPerson.new(:pasep_pis_nit => pasep_pis_nit).valid?).to be_falsey
        end

      end
    end
  end

  describe "error messages" do
    context "when the message is not defined" do
      subject { TestPerson.new :pasep_pis_nit => '15.6148.8342-4' }
      before { subject.valid? }

      it "should add the default message" do
        expect(subject.errors[:pasep_pis_nit]).to include "is invalid"
      end
    end

    context "when the message is defined" do
      subject { TestPersonWithMessage.new :pasep_pis_nit_address => '15.6148.8342-4' }
      before { subject.valid? }

      it "should add the customized message" do
        expect(subject.errors[:pasep_pis_nit_address]).to include "is not looking very good!"
      end
    end
  end

  describe "blank PASEP/PIS/NIT" do
    it "should not be valid when :allow_blank option is missing" do
      person = TestPerson.new(:pasep_pis_nit => '')
      expect(person.valid?).to be_falsey
    end

    it "should be valid when :allow_blank options is set to true" do
      person = TestPersonAllowsNil.new(:pasep_pis_nit => '')
      expect(person.valid?).to be_truthy
    end

    it "should not be valid when :allow_blank option is set to false" do
      person = TestPersonAllowsNilFalse.new(:pasep_pis_nit => '')
      expect(person.valid?).to_not be_truthy
    end
  end
end
