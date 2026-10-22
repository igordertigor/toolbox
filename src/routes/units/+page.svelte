<script lang="ts">
  import UnitConverter from '#lib/UnitConverter.svelte';

  const TEMP_FAC = 5 / 9;
  // c x 9/5 + 32
  const celsius2fahrenheit = (c: number) => c / TEMP_FAC + 32;
  // c = (F - 32) x 5/9
  const fahrenheit2celsius = (f: number) => (f - 32) * TEMP_FAC;

  const FT_PER_M = 3.28084;

  const meter2feet = (m: number) => FT_PER_M * m;
  const feet2meter = (f: number) => f / FT_PER_M;
</script>

<div class="container">
  <UnitConverter
    labelA="°C"
    labelB="°F"
    convertAtoB={celsius2fahrenheit}
    convertBtoA={fahrenheit2celsius}
    digits={1}
  />
  <br />
  <UnitConverter
    labelA="m"
    labelB="ft"
    convertAtoB={meter2feet}
    convertBtoA={feet2meter}
    digits={1}
  />
</div>

<style>
  .container {
    display: grid;
    grid-template-columns: auto auto auto auto;
    gap: 0.5rem 1rem;
    align-items: center;
    margin: 0.5rem;
  }
</style>
