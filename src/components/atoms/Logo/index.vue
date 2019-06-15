<template>
  <div class="logo">
    <div class="logo--description">
      お前は今まで食べた麺の量を覚えているか？
    </div>
    <div class="logo--main">
      二郎 LifeLog
    </div>
  </div>
</template>

<script>
export default {
  name: 'Logo',
};
</script>

<style lang="scss" scoped>
.logo {
  color: #4f4f4f;

  &--main {
    font-size: 28px;
    font-weight: bold;
  }

  &--description {
    font-size: 10px;
  }
}
</style>
