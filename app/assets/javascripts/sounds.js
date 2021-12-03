function soundMadness() {
  document
    .querySelector('.logo')
    .addEventListener('mouseover', () => {
      console.log('coucou')
      const audio = document.querySelector('audio[data-sound="logo"]')

      audio.play();
    });

  document
    .querySelectorAll('.add-to-cart')
    .forEach(btn => {
      btn.addEventListener('click', () => {
        const audio = document.querySelector('audio[data-sound="add-item"]');

        audio.currentTime = 0;
        audio.play();
      })
    });

  document
    .querySelector('a[data-sound="link-1"]')
    .addEventListener('click', e => {
      e.preventDefault();

      const audio = document.querySelector('audio[data-sound="link-1"]');

      audio.currentTime = 0;
      audio.play();
    });

  document
  .querySelector('a[data-sound="link-2"]')
  .addEventListener('click', e => {
    e.preventDefault();

    const audio = document.querySelector('audio[data-sound="link-2"]');

    audio.currentTime = 0;
    audio.play();
  });

  document
  .querySelector('a[data-sound="link-3"]')
  .addEventListener('click', e => {
    e.preventDefault();

    const audio = document.querySelector('audio[data-sound="link-3"]');

    audio.currentTime = 0;
    audio.play();
  });

  document
  .querySelector('a[data-sound="link-4"]')
  .addEventListener('click', e => {
    e.preventDefault();

    const audio = document.querySelector('audio[data-sound="link-4"]');

    audio.currentTime = 0;
    audio.play();
  });

  document
    .querySelectorAll('.danger-btn')
    .forEach(btn => {
      btn.addEventListener('click', () => {
        const audio = document.querySelector('audio[data-sound="remove-item"]')
    
        audio.currentTime = 0;
        audio.play();
      })
    });
}

document
  .querySelector('.fa-heart')
  .addEventListener('click', () => soundMadness());