<template>
  <div class="input-field">
    <label>{{ label }}</label>
    <input :value="value" :type="inputtype" />
    <div v-if="isError" class="input-field--error-msg">
      ErrorMsg
    </div>
  </div>
</template>

<script>
export default {
  name: 'InputField',
  props: {
    label: {
      type: String,
      required: true,
    },
    inputtype: {
      type: String,
      required: true,
    },
    value: {
      type: String,
      required: true,
    },
    isError: {
      type: Boolean,
      required: true,
    },
  },
  computed: {},
};

/*
<div class="input-field">
    <label>店名</label>
    <input v-model="form.storeName.value" />
    <div v-if="form.storeName.isError" class="input-field--error-msg">
    {{ form.storeName.errorMessage }}
    </div>
</div>
*/
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';

.input-field {
  font-size: 16px;

  &--error-msg {
    color: $red;
  }
}
</style>
