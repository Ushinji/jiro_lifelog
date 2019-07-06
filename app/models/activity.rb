# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  belongs_to :store

  class << self
    def parameters
      {
        menu: menu_params,
        store: store_params,
        size: size_params,
        yasai: yasai_params,
        abura: abura_params,
        ninniku: ninniku_params,
        karame: karame_params,
      }
    end

    private
    def menu_params
      Menu.all.map do |m|
        {
          id: m.id,
          value: m.id,
          label: m.name,
        }
      end
    end

    def store_params
      Store.all.map do |m|
        {
          id: m.id,
          value: m.id,
          label: m.name,
        }
      end
    end

    def size_params
      [
        {
          id: 1,
          value: 'small',
          label: '小',
        },
        {
          id: 2,
          value: 'large',
          label: '大',
        },
      ]
    end

    def yasai_params
      [
        {
          id: 1,
          value: 'small',
          label: '小',
        },
        {
          id: 2,
          value: 'normal',
          label: 'ノーコール',
        },
        {
          id: 3,
          value: 'large',
          label: 'マシ',
        },
        {
          id: 4,
          value: 'mashimashi',
          label: 'マシマシ',
        },
      ]
    end

    def abura_params
      [
        {
          id: 1,
          value: 'small',
          label: '小',
        },
        {
          id: 2,
          value: 'normal',
          label: 'ノーコール',
        },
        {
          id: 3,
          value: 'large',
          label: 'マシ',
        },
        {
          id: 4,
          value: 'mashimashi',
          label: 'マシマシ',
        },
        {
          id: 5,
          value: 'crazy',
          label: 'ザブトン',
        },
      ]
    end

    def ninniku_params
      [
        {
          id: 1,
          value: 'small',
          label: '小',
        },
        {
          id: 2,
          value: 'normal',
          label: 'ノーコール',
        },
        {
          id: 3,
          value: 'large',
          label: 'マシ',
        },
        {
          id: 4,
          value: 'mashimashi',
          label: 'マシマシ',
        },
      ]
    end

    def karame_params
      [
        {
          id: 1,
          value: 'small',
          label: '小',
        },
        {
          id: 2,
          value: 'normal',
          label: 'ノーコール',
        },
        {
          id: 3,
          value: 'large',
          label: 'マシ',
        },
        {
          id: 4,
          value: 'mashimashi',
          label: 'マシマシ',
        },
      ]
    end
  end
end
