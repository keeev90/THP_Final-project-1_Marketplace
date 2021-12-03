// Logo change

const coolCatsReactions = [
  'blank',
  'cool',
  'cupcake',
  'deepsea',
  'dizzy',
  'dizzy2',
  'doubleface',
  'dragon',
  'fancy',
  'firecrown',
  'firehalo',
  'froggy',
  'glossy',
  'handsome',
  'hearmeout',
  'hobbes',
  'kewlcet',
  'kiss',
  'knight',
  'lol',
  'love',
  'metamask',
  'navy',
  'nosignal',
  'ohno',
  'pirate',
  'prince',
  'ramcowboy',
  'sleep',
  'smiley',
  'smirk',
  'smirk2',
  'sob',
  'squad',
  'sushi',
  'sweat_smile',
  'tongue',
  'uuh',
  'what',
  'wink'
]

function chooseRandomLogo() {
  const imgId = Math.floor(Math.random() * coolCatsReactions.length)
  const img = coolCatsReactions[imgId]

  const logoDiv = document.querySelector('.navbar__brand .logo');
  const favicon = document.querySelector('link[rel="icon"]');

  logoDiv.setAttribute(
    'style',
    `background-image: url(https://www.coolcatsnft.com/assets/images/e_${img}.png);
    background-position: 50% 50%;
    background-size: cover;
    transform: scaleX(-1);
  `);

  favicon.setAttribute('href', `https://www.coolcatsnft.com/assets/images/e_${img}.png`)
}

chooseRandomLogo();

// Mobile nav toggler

window.onload = () => {
  const dropdownBtn = document.querySelector('.dropdown-btn');
  const dropdownMenu = document.querySelector('.dropdown-menu');

  dropdownBtn.addEventListener('click', () => {
    dropdownBtn.classList.toggle('is-active');
    dropdownMenu.classList.toggle('is-active');
  })
}
