<template>
  <div>
    <h2>カウンター</h2>
    <div>{{ this.count }}</div>
    <button v-on:click="increment">＋</button>
    <button v-on:click="decrement">ー</button>
  </div>
</template>

<script>
export default {
  name: 'Counter',
  methods: {
    increment() {
      this.count = this.count + 1;
    },
    decrement() {
      this.count = this.count - 1;
    }
  },
  data() {
    return {
      count: 0,
    };
  },
};
</script>

