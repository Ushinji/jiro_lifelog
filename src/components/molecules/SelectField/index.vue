<template>
  <select @change="onChange">
    <option value="" hidden>
      {{ label }}
    </option>
    <option v-for="option in options" :key="option.id" :value="option.value">
      {{ option.label }}
    </option>
  </select>
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
      type: String,
      required: true,
    },
  },
  methods: {
    onChange(e) {
      this.$emit('input', e.target.value);
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';

select {
  font-size: 14px;
  padding: 8px 16px;
  border: 1px solid $black10;
  -webkit-appearance: none;
}
</style>
