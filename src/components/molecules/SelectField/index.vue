<template>
  <div class="select-field">
    <Icon>keyboard_arrow_down</Icon>
    <select @focus="onFocus" @change="onChange">
      <option value.value="">
        ---
      </option>
      <option v-for="option in options" :key="option.id" :value="option.value">
        {{ option.label }}
      </option>
    </select>
    <div v-if="isError" class="error-label">
      {{ errorLabel }}
    </div>
  </div>
</template>

<script>
import Icon from '@/components/atoms/Icon';

export default {
  name: 'SelectField',
  components: {
    Icon,
  },
  props: {
    options: {
      type: Array,
      required: true,
    },
    label: {
      type: String,
      required: true,
    },
    value: {
      type: Object,
      required: true,
    },
    validate: {
      type: Function,
      required: true,
    },
    errorLabel: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      touched: false,
    };
  },
  computed: {
    isError() {
      return this.touched && !this.validate(this.value.value);
    },
  },
  methods: {
    onFocus() {
      this.touched = true;
    },
    onChange(e) {
      this.$emit('input', {
        value: e.target.value,
        isError: !this.validate(e.target.value),
      });
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';

.select-field {
  width: 100%;
  position: relative;

  .material-icons {
    position: absolute;
    top: 6px;
    right: calc(50%);
    color: $black40;
  }
}

select {
  font-size: 16px;
  padding: 8px 12px;
  border: 1px solid $black10;
  -webkit-appearance: none;
  margin-bottom: 2px;
  cursor: pointer;
  width: 50%;
  outline: 0;

  &:focus {
    border: 1px solid red;
  }
}

.error-label {
  font-size: 16px;
  color: $red;
}

.label {
  font-size: 16px;
  color: $black60;
}
</style>
