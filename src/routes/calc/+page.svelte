<script lang="ts">
  import { evaluate } from 'mathjs';

  let expression = $state<string[]>([]);

  const calc = (expr: string[]): string => {
    const sanitized = [...expr];

    const valid = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '%', ')'];
    while (sanitized.length && !valid.includes(sanitized.at(-1)!)) sanitized.pop();

    if (sanitized.length === 0) return '';

    if (!balancedParen(sanitized)) sanitized.push(')');

    try {
      return String(evaluate(sanitized.join('')));
    } catch {
      return '';
    }
  };

  const render = (expr: string[]): string => {
    const rendered = expr.reduce((previous, current) => {
      if (previous.length === 0) {
        return current;
      }
      const digits = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'];
      if (digits.includes(previous.at(-1)) && digits.includes(current)) return previous + current;

      return previous + ' ' + current;
    }, '');
    return rendered;
  };

  const addOp = (op: string) => {
    console.log('addOp');
    expression.push(op);
  };
  const delOp = () => {
    console.log('delOp');
    expression.pop();
  };

  const clear = () => {
    expression = [];
  };

  const addParen = () => {
    if (balancedParen(expression)) expression.push('(');
    else expression.push(')');
  };

  const exprToResult = () => {
    expression = [...result];
  };

  const balancedParen = (expr: string[]) => {
    const opening = expr.filter((c) => c === '(').length;
    const closing = expr.filter((c) => c === ')').length;
    return opening === closing;
  };

  let visibleExpression = $derived(render(expression));
  let result = $derived(calc(expression));
</script>

<div class="display">
  <p class="expression">{visibleExpression}</p>
  <p class="result">{result}</p>
</div>

<table>
  <tbody>
    <tr>
      <td><button onclick={clear}>AC</button></td>
      <td><button onclick={addParen}>()</button></td>
      <td><button onclick={() => addOp('%')}>%</button></td>
      <td><button onclick={() => addOp('/')}>/</button></td>
    </tr>

    <tr>
      <td><button onclick={() => addOp('7')}>7</button></td>
      <td><button onclick={() => addOp('8')}>8</button></td>
      <td><button onclick={() => addOp('9')}>9</button></td>
      <td><button onclick={() => addOp('*')}>*</button></td>
    </tr>

    <tr>
      <td><button onclick={() => addOp('4')}>4</button></td>
      <td><button onclick={() => addOp('5')}>5</button></td>
      <td><button onclick={() => addOp('6')}>6</button></td>
      <td><button onclick={() => addOp('-')}>-</button></td>
    </tr>

    <tr>
      <td><button onclick={() => addOp('1')}>1</button></td>
      <td><button onclick={() => addOp('2')}>2</button></td>
      <td><button onclick={() => addOp('3')}>3</button></td>
      <td><button onclick={() => addOp('+')}>+</button></td>
    </tr>

    <tr>
      <td><button onclick={() => addOp('0')}>0</button></td>
      <td><button onclick={() => addOp('.')}>.</button></td>
      <td><button onclick={delOp}>del</button></td>
      <td><button onclick={exprToResult}>=</button></td>
    </tr>
  </tbody>
</table>

<style>
  button {
    width: 80px;
    height: 80px;
    font-size: 16pt;
  }
  .expression {
    font-size: 16pt;
    height: 20px;
  }
  .result {
    font-size: 14pt;
    color: #aaaaaa;
    height: 10px;
  }
  table {
    margin: 0 auto;
  }
  .display {
    padding-left: 20px;
    padding-right: 20px;
  }
</style>
