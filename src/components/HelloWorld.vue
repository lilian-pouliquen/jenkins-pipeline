<template>
  <div>
    <h1>Home</h1>
    <div>
      <form>
        <input v-model="username" type="text"/>
        <div v-if="usernameExists" class="div-submit">
          <button v-bind:value="username" type="submit">Validate</button>
        </div>
        <div v-else class="div-error">
          <p>
            No username provided
          </p>
        </div>
      </form>
    </div>
  </div>

</template>

<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      username: ""
    }
  },

  computed: {
    usernameExists() {
      return this.username.trim().length > 0
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
