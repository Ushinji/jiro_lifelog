<template>
  <div class="select-field">
    <select @focus="onFocus" @change="onChange">
      <option value.value="" hidden>
        {{ label }}
      </option>
      <option v-for="option in options" :key="option.id" :value="option.value">
        {{ option.label }}
      </option>
    </select>
    <div class="position-relative">
      <div class="error-message">
        {{ isError ? errorLabel : '' }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SelectField',
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
  margin-bottom: 40px;
}

select {
  font-size: 12px;
  padding: 8px 12px;
  border: 1px solid $black10;
  -webkit-appearance: none;
  margin-bottom: 4px;
  cursor: pointer;
}

.position-relative {
  position: relative;
}

.error-message {
  position: absolute;
  top: 0;
  left: 0;
  font-size: 14px;
  color: $red;
}
</style>
