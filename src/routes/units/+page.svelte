<script lang="ts">

let fahrenheit = $state<number | null>(null);
let celsius = $state<number | null>(null);

const TEMP_FAC = 5/9.;
// c x 9/5 + 32
const celsius2fahrenheit = (c: number) => c / TEMP_FAC + 32;
// c = (F - 32) x 5/9
const fahrenheit2celsius = (f: number) => (f - 32)*TEMP_FAC;

const FT_PER_M = 3.28084;
let meters = $state<number | null>(null);
let feet = $state<number | null>(null);

</script>

<table>
  <tbody>
    <tr>
      <td>
      °C
      </td><td>
        <input type="number" bind:value={
            () => celsius,
            (c) => {
              celsius=c;
              fahrenheit = c === null ? null : Math.round(celsius2fahrenheit(c));
            }
          }>
      </td><td>
      °F
      </td><td>
        <input type="number" bind:value={
            () => fahrenheit,
            (f) => {
              fahrenheit=f;
              celsius = f === null ? null : Math.round(fahrenheit2celsius(f));
            }
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
          (m) => {
            meters=m;
            feet = m === null ? null : Math.round(10*FT_PER_M*m)/10;
          }
        }>
      </td><td>
      Feet
      </td><td>
        <input type="number" bind:value={
          () => feet,
          (f) => {
            meters=f;
            feet = f === null ? null : Math.round(10*f/FT_PER_M)/10;
          }
        }>
      </td>
    </tr>
  </tbody>
</table>


<style>
input {
  height: 30px;
  width: 140px;
  border-width: 0;
}
table {
  margin: auto;
}
tr {
  padding-bottom: 10px;
  padding-top: 10px;
}
</style>

