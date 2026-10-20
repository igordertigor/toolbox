<script lang="ts">

let fahrenheit = $state<number | null>(0);
let celsius = $state<number | null>(0);

const TEMP_FAC = 5/9.;
// c x 9/5 + 32
const celsius2fahrenheit = (c: number) => c / TEMP_FAC + 32;
// c = (F - 32) x 5/9
const fahrenheit2celsius = (f: number) => (f - 32)*TEMP_FAC;

const FT_PER_M = 3.28084;
let meters = $state<number | null>(0);
let feet = $state<number | null>(0);

</script>

<table>
  <tbody>
    <tr>
      <td>
      °C
      </td><td>
        <input type="number" bind:value={
            () => celsius,
            (c) => { celsius=Math.round(c); fahrenheit = Math.round(celsius2fahrenheit(c));}
            }>
      </td><td>
      °F
      </td><td>
        <input type="number" bind:value={
            () => fahrenheit,
            (f) => { fahrenheit=Math.round(f); celsius = Math.round(fahrenheit2celsius(f));}
            }>
      </td>
    </tr>
  <!------------------------------------------------------------------------------->
    <tr>
      <td>
      Meter
      </td><td>
        <input type="number" bind:value={
          () => meters,
          (m) => { meters=Math.round(10*m)/10; feet = Math.round(10*FT_PER_M*m)/10; }
          }>
      </td><td>
      Feet
      </td><td>
        <input type="number" bind:value={
          () => feet,
          (m) => { meters=Math.round(10*m)/10; feet = Math.round(10*f/FT_PER_M)/10; }
          }>
      </td>
    </tr>
  </tbody>
</table>


<style>
#spacer {
  width: 50px;
}
input {
  height: 30px;
}
table {
  margin: auto;
}
tr {
  padding-bottom: 10px;
  padding-top: 10px;
}
</style>

