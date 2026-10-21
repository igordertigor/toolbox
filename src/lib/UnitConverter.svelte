<script lang="ts">

interface Props {
  labelA: string;
  labelB: string;
  convertAtoB: (a: number) => number;
  convertBtoA: (b: number) => number;
  digits?: number;
}

let { labelA, labelB, convertAtoB, convertBtoA, digits = 0 }: Props = $props();

let a = $state<number | null>(null);
let b = $state<number | null>(null);

const digitsFactor = $derived(10 ** digits);
const round = (n: number) => Math.round(n * digitsFactor) / digitsFactor;

</script>

<span>
  <label>
    {labelA}
    <input type="number" bind:value={
      () => a,
      (value) => {
        a = value;
        b = value === null ? null : round(convertAtoB(value));
      }
    }
    />
  </label>
  <label>
    {labelB}
    <input type="number" bind:value={
      () => b,
      (value) => {
        b = value;
        a = value == null ? null : round(convertBtoA(value));
      }
    }
    />
  </label>
</span>

<style>

span {
  display: grid;
  grid-column: 1 / -1;
  grid-template-columns: subgrid;
}

label {
  display: grid;
  grid-column: span 2;
  grid-template-columns: subgrid;
  align-items: center;
}

input {
  width: 5rem;
}

</style>
