function test() {
  const $startStudy = document.getElementById('start-study');
  const $modal = document.getElementById('modal');
  const $description = document.getElementsByName('description');
  const $word = document.getElementsByName('word');
  const $target = document.getElementsByName('target');
  const $btn = document.getElementById('btn');
  const $result = document.getElementById('result');
  const $scoreLabel = document.querySelector('#result > p');
  const $homebtn = document.getElementById('home_btn');
  const $hintbtn = document.getElementById('hint_btn');
  const $title = document.getElementById('title');
  const $appExplanation = document.getElementById('app-explanation');
  const $replay = document.getElementById('replay');
  const correctAudio = document.querySelector("#correct")
  const incorrectAudio = document.querySelector("#incorrect")
  


  $startStudy.addEventListener('click', () => {
    $modal.classList.remove('hidden');
    $title.classList.add('hidden');
    $startStudy.classList.add('hidden');
    $appExplanation.classList.add('hidden');
  });
  
  index = 0;
  miss = 0;
  hintCount = 0;
  const description = $description[index].textContent;
  const word = $word[index].textContent;
  const target = $target[index];
  
  function setWord() {
    $description[index].classList.remove('hidden');
    $target[index].textContent = '_'.repeat($word[index].textContent.length)
    loc = 0;
  }
  
  function speech() {
    const text = $word[index].textContent;
    const uttr = new SpeechSynthesisUtterance(text);
    uttr.lang = 'en-US';
    uttr.rate = 0.9;
    const voice = speechSynthesis.getVoices().find(function(voice){
      return voice.name === 'Google US English';
    })
    uttr.voice = voice;
    speechSynthesis.speak(uttr);
  }
  
  function proceed() {
    window.setTimeout(function () {
      $description[index].remove();
      $word[index].remove();
      $target[index].remove();

      if($word.length === 0) {
        $homebtn.remove();
        $hintbtn.remove();
        $result.classList.remove('hidden');
        const $miss = document.getElementById('miss');
        const $hintCount = document.getElementById('hint-count');
        $miss.innerText = "ミスタイプ数：" + mistake + "回";
        $hintCount.innerText = "ヒントボタンを押した回数：" + hintCount + "回";
        return
      }
      setWord();
    }, 1200);
  }
  
  let loc = 0;
  let mistake = 0;
  let hintCount = 0;
  setWord();
  document.addEventListener('keydown', e => {
    if (e.key !== $word[index].textContent[loc]) {
      incorrectAudio.pause();
      incorrectAudio.currentTime = 0;
      incorrectAudio.play();
      mistake++;
      return
    }
    correctAudio.pause();
    correctAudio.currentTime = 0;
    correctAudio.play();
    loc++;
    $target[index].textContent = $word[index].textContent.substring(0, loc) + '_'.repeat($word[index].textContent.length - loc);
    
    if (loc === $word[index].textContent.length) {
      speech();
      proceed();
    }
  });
  
  $hintbtn.addEventListener('click', () => {
    correctAudio.pause();
    correctAudio.currentTime = 0;
    correctAudio.play();
    loc++;
    hintCount++;
    $target[index].textContent = $word[index].textContent.substring(0, loc) + '_'.repeat($word[index].textContent.length - loc);

    if (loc === $word[index].textContent.length) {
      speech();
      proceed();
    }
  });
} 

window.addEventListener('load', test);