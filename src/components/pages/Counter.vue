<template>
  <div>
    <h2>カウンター</h2>
    <div>{{ count }}</div>
    <button @click="increment">
      ＋
    </button>
    <button @click="decrement">
      ー
    </button>
  </div>
</template>

<script>
export default {
  name: 'Counter',
  data() {
    return {
      count: 0,
    };
  },
  methods: {
    increment() {
      this.count = this.count + 1;
    },
    decrement() {
      this.count = this.count - 1;
    },
  },
};
</script>
